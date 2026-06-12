# Production AI Agent Portfolio Roadmap

This roadmap organizes the portfolio into six repositories. The goal is to show a coherent engineering story for overseas AI Agent, RAG, AgentOps, AI Platform, and AI Automation roles.

## Portfolio thesis

A useful AI agent is not only a model prompt. It is a system with context, tools, state, review points, traces, evaluations, and deployment boundaries.

```text
knowledge -> safe action -> business workflow -> coding workflow -> evaluation -> production starter kit
```

## Recommended execution order

| Order | Repository | Why first |
|---:|---|---|
| 1 | `rag-reliability-lab` | Fastest visible demo and strongest applied AI signal |
| 2 | `mcp-tool-safety-gateway` | Strong differentiation for agentic AI and platform roles |
| 3 | `agent-eval-debug-suite` | Makes the portfolio look production-oriented rather than demo-oriented |
| 4 | `hitl-workflow-agent` | Shows business workflow and regulated-domain judgment |
| 5 | `issue-to-pr-coding-agent` | Shows AI devtools depth and coding-agent reasoning |
| 6 | `production-agent-starter-kit` | Integrates lessons into a coherent starter kit |

## MVP definition

A project reaches MVP when it has:

- A clear README.
- A small working demo.
- A visible data model or architecture note.
- A few sample inputs and outputs.
- One quality or evaluation report.
- A three-minute English demo script.

## P0 / MVP work across all projects

| Project | P0 outcome |
|---|---|
| RAG Reliability Lab | Compare BM25, vector, and hybrid retrieval on sample documents |
| MCP Tool Safety Gateway | Validate and record external actions through a controlled gateway |
| Agent Eval Debug Suite | Compare baseline and candidate runs on stable eval cases |
| HITL Workflow Agent | Run invoice review from extraction to approval and audit |
| Issue-to-PR Coding Agent | Turn one small issue into a tested draft PR summary |
| Production Agent Starter Kit | Show run state, step trace, model call, review point, and eval result |

## P1 polish

- Add UI screenshots or GIFs.
- Add failure-mode documents.
- Add eval metrics and example reports.
- Add Docker Compose where useful.
- Add README badges only after real CI exists.

## P2 interview package

Each project should eventually include:

- `docs/interview-notes.md`
- `docs/architecture.md`
- `docs/data-model.md`
- `docs/evaluation.md`
- `docs/failure-modes.md`
- `docs/demo-script.md`
- resume bullets

## Tone

Keep the writing precise and quiet. The profile can carry a little humanistic texture. The project repositories should feel practical, readable, and technically serious.
