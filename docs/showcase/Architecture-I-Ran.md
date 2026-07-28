# Architecture I ran

Local-only path from the tutorial (no hosted MCP, no cloud DB for this showcase).

```text
Public GitHub READMEs
        │
        ▼
  Loaders (markdown → posts + chunks)
        │
        ▼
  Oracle AI Database 26ai (Colima container)
   · in-DB MiniLM embeddings
   · hybrid search (semantic + keyword / RRF)
   · agent memory + compiled wiki tables
        │
        ├──────────────► Research agent (Claude API)
        │
        └──────────────► MCP server (stdio)
                              │
                              ▼
                     Cursor  +  Claude Desktop
```

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
