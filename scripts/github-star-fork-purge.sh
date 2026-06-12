#!/usr/bin/env bash
set -euo pipefail

OWNER="${OWNER:-sudotty}"
MODE="${MODE:-dry-run}" # dry-run | export | unstar-all | private-forks | delete-forks | purge-all
OUT_DIR="${OUT_DIR:-github-star-fork-purge-$(date +%Y%m%d-%H%M%S)}"

require_gh() {
  command -v gh >/dev/null 2>&1 || {
    echo "gh is required. Install GitHub CLI first." >&2
    exit 1
  }
}

run() {
  if [[ "$MODE" == "dry-run" ]]; then
    echo "[DRY-RUN] $*"
  else
    eval "$@"
  fi
}

export_state() {
  mkdir -p "$OUT_DIR"

  echo "Exporting starred repositories to $OUT_DIR/starred.tsv"
  gh api --paginate /user/starred \
    --jq '.[] | [.full_name, (.description // ""), (.html_url // ""), ((.topics // []) | join(","))] | @tsv' \
    > "$OUT_DIR/starred.tsv" || true

  echo "Exporting owned fork repositories to $OUT_DIR/forks.tsv"
  gh repo list "$OWNER" \
    --limit 1000 \
    --json name,nameWithOwner,isFork,isPrivate,url,description \
    --jq '.[] | select(.isFork == true) | [.nameWithOwner, (.isPrivate|tostring), (.description // ""), .url] | @tsv' \
    > "$OUT_DIR/forks.tsv" || true

  echo "Export complete: $OUT_DIR"
}

unstar_all() {
  mkdir -p "$OUT_DIR"
  gh api --paginate /user/starred \
    --jq '.[] | .full_name' \
    > "$OUT_DIR/starred-fullnames.txt"

  count=$(wc -l < "$OUT_DIR/starred-fullnames.txt" | tr -d ' ')
  echo "Starred repositories found: $count"

  while IFS= read -r repo; do
    [[ -z "$repo" ]] && continue
    echo "Unstar: $repo"
    gh api -X DELETE "/user/starred/$repo" >/dev/null || true
  done < "$OUT_DIR/starred-fullnames.txt"
}

private_forks() {
  mkdir -p "$OUT_DIR"
  gh repo list "$OWNER" \
    --limit 1000 \
    --json nameWithOwner,isFork \
    --jq '.[] | select(.isFork == true) | .nameWithOwner' \
    > "$OUT_DIR/fork-fullnames.txt"

  count=$(wc -l < "$OUT_DIR/fork-fullnames.txt" | tr -d ' ')
  echo "Fork repositories found: $count"

  while IFS= read -r repo; do
    [[ -z "$repo" ]] && continue
    echo "Make fork private: $repo"
    gh repo edit "$repo" --visibility private --accept-visibility-change-consequences || true
  done < "$OUT_DIR/fork-fullnames.txt"
}

delete_forks() {
  mkdir -p "$OUT_DIR"
  gh repo list "$OWNER" \
    --limit 1000 \
    --json nameWithOwner,isFork \
    --jq '.[] | select(.isFork == true) | .nameWithOwner' \
    > "$OUT_DIR/fork-fullnames.txt"

  count=$(wc -l < "$OUT_DIR/fork-fullnames.txt" | tr -d ' ')
  echo "Fork repositories found: $count"
  echo "WARNING: delete-forks permanently deletes fork repositories under $OWNER."

  while IFS= read -r repo; do
    [[ -z "$repo" ]] && continue
    echo "Delete fork: $repo"
    gh repo delete "$repo" --yes || true
  done < "$OUT_DIR/fork-fullnames.txt"
}

main() {
  require_gh

  case "$MODE" in
    dry-run)
      echo "Dry run only. No GitHub account changes will be made."
      echo
      echo "Available modes:"
      echo "  MODE=export        Export current stars and forks"
      echo "  MODE=unstar-all    Remove every starred repository"
      echo "  MODE=private-forks Make every owned fork repository private"
      echo "  MODE=delete-forks  Delete every owned fork repository"
      echo "  MODE=purge-all     Unstar all and delete all owned forks"
      echo
      echo "Recommended sequence:"
      echo "  MODE=export bash scripts/github-star-fork-purge.sh"
      echo "  MODE=unstar-all bash scripts/github-star-fork-purge.sh"
      echo "  MODE=delete-forks bash scripts/github-star-fork-purge.sh"
      ;;

    export)
      export_state
      ;;

    unstar-all)
      export_state
      unstar_all
      ;;

    private-forks)
      export_state
      private_forks
      ;;

    delete-forks)
      export_state
      delete_forks
      ;;

    purge-all)
      export_state
      unstar_all
      delete_forks
      ;;

    *)
      echo "Unknown MODE: $MODE" >&2
      exit 1
      ;;
  esac
}

main "$@"
