#!/bin/bash
# StateBase REST API Examples
# Pure curl commands - no SDK required

# Set your API key
API_KEY="your_api_key_here"
BASE_URL="https://api.statebase.org"

echo "🚀 StateBase REST API Examples"
echo "================================"

# 1. Health Check
echo -e "\n📍 1. Health Check"
curl -s "$BASE_URL/health" | jq '.'

# 2. Create a Session
echo -e "\n📍 2. Create Session"
SESSION_RESPONSE=$(curl -s -X POST "$BASE_URL/v1/sessions" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "agent_id": "rest-api-example",
    "initial_state": {
      "status": "active",
      "step": 0
    },
    "metadata": {
      "source": "curl_example"
    }
  }')

SESSION_ID=$(echo $SESSION_RESPONSE | jq -r '.id')
echo "Created session: $SESSION_ID"
echo $SESSION_RESPONSE | jq '.'

# 3. Add a Turn
echo -e "\n📍 3. Add Turn"
curl -s -X POST "$BASE_URL/v1/sessions/$SESSION_ID/turns" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "input": "What is the weather today?",
    "output": "The weather is sunny with a high of 75°F",
    "metadata": {
      "model": "gpt-4",
      "tokens": 150
    }
  }' | jq '.'

# 4. Update State
echo -e "\n📍 4. Update State"
curl -s -X PATCH "$BASE_URL/v1/sessions/$SESSION_ID/state" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "updates": {
      "step": 1,
      "last_query": "weather"
    }
  }' | jq '.'

# 5. Get Current State
echo -e "\n📍 5. Get Current State"
curl -s -X GET "$BASE_URL/v1/sessions/$SESSION_ID/state" \
  -H "X-API-Key: $API_KEY" | jq '.'

# 6. Create a Memory
echo -e "\n📍 6. Create Memory"
curl -s -X POST "$BASE_URL/v1/sessions/$SESSION_ID/memories" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "content": "User asked about weather in San Francisco",
    "memory_type": "fact",
    "metadata": {
      "location": "San Francisco"
    }
  }' | jq '.'

# 7. Search Memories
echo -e "\n📍 7. Search Memories"
curl -s -X POST "$BASE_URL/v1/sessions/$SESSION_ID/memories/search" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "query": "weather location",
    "top_k": 5
  }' | jq '.'

# 8. Get Full Context
echo -e "\n📍 8. Get Full Context"
curl -s -X GET "$BASE_URL/v1/sessions/$SESSION_ID/context?include_memories=true&include_turns=true&max_turns=10" \
  -H "X-API-Key: $API_KEY" | jq '.'

# 9. Rollback State
echo -e "\n📍 9. Rollback State (to version 0)"
curl -s -X POST "$BASE_URL/v1/sessions/$SESSION_ID/state/rollback" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "version": 0
  }' | jq '.'

# 10. Fork Session
echo -e "\n📍 10. Fork Session"
FORK_RESPONSE=$(curl -s -X POST "$BASE_URL/v1/sessions/$SESSION_ID/fork" \
  -H "X-API-Key: $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "new_agent_id": "forked-experiment"
  }')

FORK_ID=$(echo $FORK_RESPONSE | jq -r '.new_session_id')
echo "Forked session: $FORK_ID"
echo $FORK_RESPONSE | jq '.'

# 11. List Sessions
echo -e "\n📍 11. List Sessions"
curl -s -X GET "$BASE_URL/v1/sessions?agent_id=rest-api-example&limit=10" \
  -H "X-API-Key: $API_KEY" | jq '.'

# 12. Get Session Details
echo -e "\n📍 12. Get Session Details"
curl -s -X GET "$BASE_URL/v1/sessions/$SESSION_ID" \
  -H "X-API-Key: $API_KEY" | jq '.'

echo -e "\n✅ All examples complete!"
echo "Session ID: $SESSION_ID"
echo "Fork ID: $FORK_ID"
