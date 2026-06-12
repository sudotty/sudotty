#!/usr/bin/env bash
set -euo pipefail

OWNER="sudotty"
MODE="${MODE:-dry-run}" # dry-run | private | delete | rename

run() {
  if [[ "$MODE" == "dry-run" ]]; then
    echo "[DRY-RUN] $*"
  else
    eval "$@"
  fi
}

# -----------------------------------------------------------------------------
# 1. Repositories that should disappear from the public portfolio.
#    Default recommendation: make private first; delete later only when certain.
# -----------------------------------------------------------------------------
TO_PRIVATE=(
  "my-springboot"
  "my-awk"
  "my-scripts"
  "leetcode"
  "reading_note"
  "mule-example"
  "springboot-sentry-demo"
  "dive-to-gosync-workshop"
  "scalaWar"
  "one-python-craftsman"
  "hands-on-scala-zh"
  "promext-plugin"
  "JavaGuide"
  "kafka"
  "flink"
  "elasticsearch"
  "metabase"
  "thingsboard"
  "PaddleOCR"
  "servicecomb-java-chassis"
  "streamx"
  "view-ui-plus"
  "Fengshenbang-LM"
  "electron-redux"
  "drone-tutorial"
  "what-happens-when"
)

# Highest-priority delete candidates. Keep this list short.
TO_DELETE=(
  "FuckMFS"
  "my-awk"
  "reading_note"
  "mule-example"
  "springboot-sentry-demo"
  "dive-to-gosync-workshop"
)

# -----------------------------------------------------------------------------
# 2. Repositories that should be renamed into professional portfolio assets.
# -----------------------------------------------------------------------------
RENAMES=(
  "stock_data_collector market-data-pipeline"
  "orca-stock-ui market-event-terminal"
  "prime-quant market-signal-lab"
  "bubu-bi local-bi-agent"
)

# -----------------------------------------------------------------------------
# 3. Repositories that should usually be merged rather than renamed directly.
# -----------------------------------------------------------------------------
cat <<'NOTE'
Manual consolidation recommendations:

- desk-form-tool        -> merge into webloop, or rename to browser-form-agent
- wxocr + wechat-ocr    -> merge into local-ocr-agent
- crow/crow_cam/we_cam/local_camera_app -> merge into local-vision-agent
- stocks_data/prime-data/orca-data/icc-data/madmax-effect-data -> merge or privatize under market-data-pipeline / market-signal-lab
- kore                  -> keep as KoreMemo product repo; do not confuse with geo-loop

Recommended public pins after cleanup:
1. webloop
2. geo-loop
3. mcp-tool-safety-gateway
4. rag-reliability-lab
5. agent-eval-debug-suite
6. issue-to-pr-coding-agent
NOTE

case "$MODE" in
  dry-run)
    echo "Dry run. To execute: MODE=private|delete|rename ./scripts/github-portfolio-cleanup.sh"
    echo
    echo "Private candidates:"
    for repo in "${TO_PRIVATE[@]}"; do echo "  $OWNER/$repo"; done
    echo
    echo "Delete candidates:"
    for repo in "${TO_DELETE[@]}"; do echo "  $OWNER/$repo"; done
    echo
    echo "Rename candidates:"
    for pair in "${RENAMES[@]}"; do echo "  $OWNER/$pair"; done
    ;;

  private)
    for repo in "${TO_PRIVATE[@]}"; do
      echo "Making private: $OWNER/$repo"
      run "gh repo edit '$OWNER/$repo' --visibility private --accept-visibility-change-consequences"
    done
    ;;

  delete)
    echo "WARNING: this deletes repositories. Make sure gh has delete_repo scope."
    for repo in "${TO_DELETE[@]}"; do
      echo "Deleting: $OWNER/$repo"
      run "gh repo delete '$OWNER/$repo' --yes"
    done
    ;;

  rename)
    for pair in "${RENAMES[@]}"; do
      old="$(echo "$pair" | awk '{print $1}')"
      new="$(echo "$pair" | awk '{print $2}')"
      echo "Renaming: $OWNER/$old -> $new"
      run "gh repo rename -R '$OWNER/$old' '$new' --yes"
    done
    ;;

  *)
    echo "Unknown MODE: $MODE" >&2
    exit 1
    ;;
esac
