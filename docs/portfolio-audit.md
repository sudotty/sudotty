# GitHub Portfolio Audit

Goal: make the public GitHub profile read as an AI Agent Engineering portfolio instead of a long historical repository archive.

## Target public identity

```text
AI Agent Engineer
  → Browser automation
  → GitHub-native growth automation
  → RAG reliability
  → MCP tool safety
  → Agent eval and debugging
  → Human-in-the-loop workflows
```

## Recommended public pins

| Rank | Repository | Reason |
|---:|---|---|
| 1 | `webloop` | Closest to a product; browser automation and lightweight RPA direction |
| 2 | `geo-loop` | Strong product narrative: GitHub-native SEO/GEO/ASO automation loop |
| 3 | `mcp-tool-safety-gateway` | Best enterprise AI Agent safety signal |
| 4 | `rag-reliability-lab` | Clear RAG reliability and evaluation signal |
| 5 | `agent-eval-debug-suite` | Strong AgentOps / eval / debugging signal |
| 6 | `issue-to-pr-coding-agent` | Direct GitHub automation and coding agent signal |

## Keep and build

| Repository | Action |
|---|---|
| `webloop` | Keep public, pin, continue as main product |
| `geo-loop` | Keep public, pin, continue as growth automation product |
| `mcp-tool-safety-gateway` | Keep public, build minimal runnable demo |
| `rag-reliability-lab` | Keep public, build minimal eval report demo |
| `agent-eval-debug-suite` | Keep public, build trace + regression gate demo |
| `issue-to-pr-coding-agent` | Keep public, build issue-to-draft-PR workflow |
| `hitl-workflow-agent` | Keep public or second layer; concrete enterprise workflow demo |
| `production-agent-starter-kit` | Keep as reference architecture; avoid pinning first until code exists |
| `kore` | Keep as KoreMemo product repo or make private if product code is sensitive |

## Rename or consolidate

| Current repository | Recommended target | Action |
|---|---|---|
| `desk-form-tool` | `webloop` or `browser-form-agent` | Prefer merge into WebLoop |
| `bubu-bi` | `local-bi-agent` | Rename if public |
| `stock_data_collector` | `market-data-pipeline` | Rename |
| `orca-stock-ui` | `market-event-terminal` | Rename |
| `prime-quant` | `market-signal-lab` | Rename |
| `wxocr` + `wechat-ocr` | `local-ocr-agent` | Merge |
| `crow` + `crow_cam` + `we_cam` + `local_camera_app` | `local-vision-agent` | Merge |
| `stocks_data` + `prime-data` + `orca-data` + `icc-data` | private data layer | Usually private |

## Make private or delete

| Repository type | Examples | Reason |
|---|---|---|
| Unprofessional names | `FuckMFS` | Directly damages public signal |
| `my-*` repositories | `my-springboot`, `my-awk`, `my-scripts` | Student / personal scratchpad signal |
| Old demos | `mule-example`, `springboot-sentry-demo` | Low signal, old stack |
| Workshops / notes | `dive-to-gosync-workshop`, `reading_note` | Learning archive, not portfolio |
| Algorithm practice | `leetcode` | Not useful for a senior AI Agent portfolio |
| Large forks | `JavaGuide`, `kafka`, `flink`, `metabase`, `PaddleOCR`, `thingsboard` | Looks like a collection, not original work |

## Operating rule

A public repository must satisfy at least one of these:

1. Demonstrates AI Agent engineering.
2. Demonstrates browser automation or workflow automation.
3. Demonstrates RAG / MCP / eval / tool safety.
4. Demonstrates a real product or market-intelligence system.
5. Has a clear README, architecture, roadmap, and runnable demo.

If not, make it private or delete it.
