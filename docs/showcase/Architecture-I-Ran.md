# Architecture I ran

Local-only path from the tutorial (no hosted MCP, no cloud DB for this showcase).

## How the flow works

![Ramona's Second Brain walkthrough: public GitHub READMEs into Oracle 26ai, hybrid search and wiki, MCP in Cursor and Claude; content domain is TestMCP to ForgeQA to Release Gate to War Room](flow.png)

| Step | Color | What it is |
|------|-------|------------|
| **1 · Public GitHub READMEs** | Blue | Profile + four portfolio project READMEs |
| **2 · Oracle 26ai + MiniLM** | Teal | Colima container, in-DB embeddings |
| **3 · Hybrid search + wiki** | Amber | Semantic + keyword search, research agent, Lab 5 wiki |
| **4 · MCP in Cursor + Claude** | Charcoal | Local stdio MCP (`content-brain`) |

Bottom row = the **delivery loop** those READMEs describe: TestMCP → ForgeQA → Release Gate → War Room.

## Stack I actually used

| Piece | Choice |
|-------|--------|
| Container engine | Colima (not Docker Desktop) |
| Database | Oracle AI Database 26ai Free (`gvenzl/oracle-free`) |
| Embeddings | In-DB ONNX MiniLM |
| LLM | Anthropic Claude (`LLM_PROVIDER=anthropic`) |
| Clients | Cursor (MCP) + Claude Desktop (MCP) |
| Sources | Public GitHub profile + project READMEs |

## MCP tools I enabled

`search`, `fetch`, `overview`, `source_status`, `topics`, `wiki`, plus gated writes (`ingest_note`, `save_chat`).

Configured as `content-brain` in Cursor and Claude Desktop pointing at:

`oracle/agent/mcp_server.py` in this fork.

## Privacy stance for this demo

- Local stdio MCP only (nothing exposed to the public internet)
- Showcase content is public GitHub only
- Lab 4 (private scoping) comes **before** any hosted server or private notes
