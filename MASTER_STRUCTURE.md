# StateBase Documentation Structure

This document serves as the master map of the StateBase documentation site (`docs.statebase.org`). The structure is defined in `mint.json`.

## 1. Getting Started
- **Introduction** (`introduction.mdx`): The "Amalthea Problem" and high-level value prop.
- **Quickstart** (`quickstart.mdx`): "Hello World" Chat Loop.
- **Memory Quickstart** (`quickstart-memory.mdx`): Building a Personal Shopper agent.

## 2. Tutorials
*Real-world implementation guides.*
- [ ] **MCP Server** (`tutorials/mcp-server.mdx`): Building a Model Context Protocol server.
- [ ] **Chrome Extension** (`tutorials/chrome-extension.mdx`): Browser copilot with state.
- [ ] **n8n Integration** (`tutorials/n8n-integration.mdx`): Low-code workflow automation.

## 3. Migration Guides
*Helpers for upgrading from other tools.*
- **Mem0** (`migration/mem0.mdx`): Upgrading from Mem0 vector store.
- [ ] **LangChain** (`migration/langchain.mdx`): Migrating from `ConversationBufferMemory`.

## 4. Enterprise
- **Self Hosting** (`enterprise/self-hosting.mdx`): Docker Compose and VPC deployment.

## 5. Advanced Usage
*The "Alchemyst" Tier - Complex Architectures.*
- **Context Arithmetic** (`advanced/context-arithmetic.mdx`): Set operations (Union, Intersection) on context.
- [ ] **Patterns** (`advanced/patterns.mdx`): Common architecture patterns.
- [ ] **Architecture** (`advanced/architecture.mdx`): System internals diagram.
- [ ] **Errors** (`advanced/errors.mdx`): Handling rate limits and drift alerts.

## 6. Guides (Core Concepts)
- **Sessions** (`concepts/sessions.mdx`): Immutable containers and lifecycle.
- **Memory** (`concepts/memory.mdx`): The SNAP Algorithm (Ingestion -> Consolidation).
- **Snapshots** (`concepts/snapshots.mdx`): Rollbacks and Forking.

## 7. Cookbook
*Copy-pasteable code snippets.*
- **LangChain** (`cookbook/langchain.mdx`): `StateBaseMemory` adapter.
- **Vercel AI SDK** (`cookbook/vercel-ai-sdk.mdx`): `onFinish` streaming hooks.
- **Telegram Bot** (`cookbook/telegram-bot.mdx`): Stateful bot template.

## 8. Integrations
- **OpenAI** (`integrations/openai.mdx`): The "Amalthea Pattern" & Context Injection.
- **Anthropic** (`integrations/anthropic.mdx`): Claude-specific prompting.
- **Postgres** (`integrations/postgres.mdx`): Exporting data to Data Warehouse.

## 9. API Reference
*OpenAPI Specification mappings.*
- **Introduction** (`api-reference/introduction.mdx`): Auth & Base URL.
- **Sessions** (`api-reference/sessions.mdx`): `POST /sessions`
- **Turns** (`api-reference/turns.mdx`): `POST /turns`
- **Memory** (`api-reference/memory.mdx`): `POST /memories`
- **Traces** (`api-reference/traces.mdx`): `GET /traces`

---
*Legend:*
- **Bold**: Implemented
- [ ] : Planned / Placeholder
