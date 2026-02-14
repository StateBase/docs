# StateBase Examples

Production-ready code examples for integrating StateBase into your AI agents.

## Quick Links

- **[Quickstart Guide](../quickstart.md)** - Get started in 5 minutes
- **[API Reference](https://docs.statebase.org/api-reference)** - Complete API documentation
- **[Dashboard](https://dashboard.statebase.org)** - Monitor your sessions

## Examples

### Python

- **[chatbot.py](python/chatbot.py)** - Simple chatbot with memory and state management
  - Session creation
  - Turn tracking
  - Memory storage and search
  - Context retrieval

### REST API

- **[curl-examples.sh](rest/curl-examples.sh)** - Complete REST API examples using curl
  - Works with any programming language
  - No SDK required
  - Demonstrates all core features

## Running the Examples

### Python Example

```bash
# Install StateBase SDK
pip install statebase

# Set your API key
export STATEBASE_API_KEY="your_api_key_here"

# Run the example
python examples/python/chatbot.py
```

### REST API Example

```bash
# Make the script executable
chmod +x examples/rest/curl-examples.sh

# Edit the script to add your API key
# Then run it
./examples/rest/curl-examples.sh
```

## Get Your API Key

1. Sign up at [dashboard.statebase.org](https://dashboard.statebase.org)
2. Create an organization
3. Generate an API key

## Need Help?

- **Documentation**: [docs.statebase.org](https://docs.statebase.org)
- **GitHub Issues**: [github.com/StateBase/statebase-python/issues](https://github.com/StateBase/statebase-python/issues)
- **Email**: support@statebase.org
