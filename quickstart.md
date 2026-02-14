# StateBase Quickstart

Get started with StateBase in under 5 minutes.

## Installation

```bash
pip install statebase
```

## Get Your API Key

1. Sign up at [dashboard.statebase.org](https://dashboard.statebase.org)
2. Create your organization
3. Generate an API key from the dashboard

## Your First Session

```python
from statebase import StateBase

# Initialize client
client = StateBase(api_key="your_api_key_here")

# Create a session
session = client.sessions.create(
    agent_id="my-chatbot",
    initial_state={"conversation_count": 0}
)

print(f"Session created: {session.id}")

# Add a turn (user message + AI response)
turn = client.sessions.add_turn(
    session_id=session.id,
    input="Hello! What can you help me with?",
    output="I'm an AI assistant. I can help you with various tasks!"
)

# Update state
client.sessions.update_state(
    session_id=session.id,
    updates={"conversation_count": 1, "last_topic": "greeting"}
)

# Save a memory
memory = client.memories.create(
    session_id=session.id,
    content="User prefers friendly, casual tone",
    memory_type="preference"
)

# Search memories
results = client.memories.search(
    session_id=session.id,
    query="user communication style"
)

print(f"Found {len(results)} relevant memories")
```

## Advanced Features

### State Rollback

```python
# Rollback to a previous state version
previous_state = client.sessions.rollback(
    session_id=session.id,
    version=1  # Go back to version 1
)
```

### Session Forking

```python
# Create a branch from current session
forked_session = client.sessions.fork(
    session_id=session.id,
    new_agent_id="experiment-bot"
)
```

### Tool Calling

```python
# Log structured tool interactions
tool_turn = client.sessions.add_tool_call(
    session_id=session.id,
    tool_name="web_search",
    arguments={"query": "latest AI news"},
    output={"results": ["Article 1", "Article 2"]}
)
```

### Get Full Context

```python
# Get state + memories + recent turns in one call
context = client.sessions.get_context(
    session_id=session.id,
    include_memories=True,
    include_turns=True,
    max_turns=10
)

print(f"Current state: {context.state}")
print(f"Relevant memories: {len(context.memories)}")
print(f"Recent turns: {len(context.turns)}")
```

## Async Support

```python
from statebase import AsyncStateBase
import asyncio

async def main():
    client = AsyncStateBase(api_key="your_api_key_here")
    
    session = await client.sessions.create(
        agent_id="async-bot",
        initial_state={"status": "active"}
    )
    
    print(f"Async session: {session.id}")

asyncio.run(main())
```

## Next Steps

- [API Reference](https://docs.statebase.org/api-reference) - Complete API documentation
- [Code Examples](https://github.com/StateBase/statebase-python/tree/main/examples) - Production-ready examples
- [Best Practices](https://docs.statebase.org/best-practices) - Patterns for reliable agents
- [Dashboard](https://dashboard.statebase.org) - Monitor your sessions and usage

## Need Help?

- **Documentation**: [docs.statebase.org](https://docs.statebase.org)
- **GitHub Issues**: [github.com/StateBase/statebase-python/issues](https://github.com/StateBase/statebase-python/issues)
- **Email**: support@statebase.org
