# Strategic Choice: One Project to Build First

## Decision

If only one project can be developed deeply first, choose:

**MCP Tool Safety Gateway**

This is the best spearhead project for showing product ability, AI engineering ability, backend/platform thinking, and real business value.

## Why not build all at once

A broad portfolio is useful for positioning. A single sharp product is better for proof.

The portfolio should remain visible, but execution should concentrate on one project until it has:

- a working demo
- a clear screenshot
- a short demo video
- a useful README
- a small architecture note
- a product story that hiring teams can remember

## Ranking

| Rank | Project | Score | Reason |
|---:|---|---:|---|
| 1 | MCP Tool Safety Gateway | 95 | Strong timing, real platform problem, visible product boundary, hard enough to show skill, narrow enough for MVP |
| 2 | RAG Reliability Lab | 88 | Clear demo and strong AI signal, but the space is more crowded |
| 3 | Agent Eval Debug Suite | 84 | High engineering value, but harder to make emotionally obvious in a first demo |
| 4 | Human-in-the-loop Workflow Agent | 80 | Strong business meaning, but needs domain polish to avoid looking generic |
| 5 | Issue-to-PR Coding Agent | 76 | Strong developer appeal, but crowded by major coding tools |
| 6 | Production Agent Starter Kit | 72 | Good umbrella project, but too broad as the first single product |

## Why MCP Tool Safety Gateway is the spearhead

### 1. It sits at the point where agents become useful

A chatbot can talk. An agent becomes valuable when it uses tools, reads systems, writes records, or triggers workflows.

The gateway sits exactly at that transition point.

### 2. It is more defensible than a generic chatbot or coding agent

Generic RAG and coding agents are already crowded. A focused tool gateway is more specific:

- tool contracts
- input validation
- access checks
- request preview
- human review
- operation records
- audit trail

This makes the project feel like infrastructure, not another wrapper.

### 3. It shows your strongest background

Your background is not only AI prompting. It includes backend systems, enterprise workflows, internal tools, financial/tax systems, automation, and product thinking.

MCP Tool Safety Gateway lets those strengths appear naturally.

### 4. It can absorb the other projects later

The other projects can become modules or demos around the gateway:

- RAG Reliability Lab becomes a knowledge tool behind the gateway.
- HITL Workflow Agent becomes a review workflow powered by the gateway.
- Agent Eval Debug Suite tests gateway behavior.
- Issue-to-PR Coding Agent uses gateway-controlled GitHub actions.
- Production Agent Starter Kit becomes the reference runtime.

So the gateway is not isolated. It is the control point for the whole portfolio.

## Sun Bin style strategic reading

The principle is not to defend every possible front. The principle is to choose the point where one precise move changes the whole field.

For this portfolio, that point is not the model and not the chat interface. Those are already crowded battlefields.

The decisive point is the boundary between AI intent and real action.

Build the gate. Make the action visible. Make the system reviewable. Make every tool request explainable.

That is the modern version of attacking the undefended hinge.

## One-sentence product thesis

AI agents will not enter serious work through better chat alone. They will enter through controlled tool use, visible review, and reliable records.

## MVP that should be built first

Build one tight path:

```text
Tool Registry -> Request Preview -> Input Check -> Access Result -> Review Step -> Record View
```

The first demo should use only three mock tools:

1. Read a document record.
2. Query a simple database table.
3. Create a draft task record.

Do not connect many real services first. Make the control layer excellent.

## What the demo must prove

A reviewer should understand in three minutes:

- what tools exist
- what the agent wants to do
- what arguments it is passing
- whether the request is valid
- whether it is allowed
- what a human should review
- what record remains afterward

## Commercial meaning

This project can become:

- an open-source gateway for agent tool calls
- a developer tool for MCP servers
- a review console for AI automation
- a safety layer for internal agents
- a productized template for enterprise AI workflows

## First 14-day build plan

### Days 1-2: Static demo shell

- Build the UI shell.
- Add tool registry list.
- Add request preview panel.
- Add record detail panel.

### Days 3-5: Tool contract layer

- Define tool schema model.
- Add three mock tools.
- Add input validation.
- Add validation result UI.

### Days 6-8: Access and review

- Add simple policy rules.
- Add allowed/denied result.
- Add review step for higher-impact tools.
- Add record timeline.

### Days 9-11: Demo data and polish

- Add sample requests.
- Add good request, bad request, and denied request examples.
- Add design refinements.
- Add README screenshots.

### Days 12-14: Public package

- Add architecture doc.
- Add data model doc.
- Add three-minute demo script.
- Record a short demo video.
- Pin the repo first on GitHub.

## Quality bar

The project is successful when a hiring manager can say:

This engineer understands that production agents are not just prompts. They are systems with contracts, permissions, review, and records.
