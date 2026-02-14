"""
StateBase Example: Simple Chatbot with Memory

This example demonstrates how to build a chatbot that:
1. Maintains conversation state
2. Stores user preferences as memories
3. Searches memories for context
4. Handles multi-turn conversations
"""

import os
from statebase import StateBase

# Initialize StateBase client
client = StateBase(
    api_key=os.getenv("STATEBASE_API_KEY"),
    base_url=os.getenv("STATEBASE_API_URL", "https://api.statebase.org")
)

def create_chatbot_session(user_id: str):
    """Create a new chatbot session for a user"""
    session = client.sessions.create(
        agent_id=f"chatbot-{user_id}",
        user_id=user_id,
        initial_state={
            "turn_count": 0,
            "topics_discussed": [],
            "user_sentiment": "neutral"
        },
        metadata={
            "user_id": user_id,
            "created_via": "example_script"
        }
    )
    print(f"✅ Created session: {session.id}")
    return session

def handle_conversation_turn(session_id: str, user_message: str, bot_response: str):
    """Process a single conversation turn"""
    # Add the turn to history
    turn = client.sessions.add_turn(
        session_id=session_id,
        input=user_message,
        output=bot_response,
        metadata={"timestamp": "2024-01-15T10:30:00Z"}
    )
    
    # Update conversation state
    current_state = client.sessions.get_state(session_id)
    client.sessions.update_state(
        session_id=session_id,
        updates={
            "turn_count": current_state.state.get("turn_count", 0) + 1,
            "last_message": user_message
        }
    )
    
    print(f"💬 Turn {turn.turn_number}: User → Bot")
    return turn

def save_user_preference(session_id: str, preference: str):
    """Save a user preference as a long-term memory"""
    memory = client.memories.create(
        session_id=session_id,
        content=preference,
        memory_type="preference",
        metadata={"importance": "high"}
    )
    print(f"🧠 Saved memory: {preference}")
    return memory

def get_relevant_context(session_id: str, query: str):
    """Search for relevant memories and context"""
    # Search memories
    memories = client.memories.search(
        session_id=session_id,
        query=query,
        top_k=5
    )
    
    # Get full context
    context = client.sessions.get_context(
        session_id=session_id,
        include_memories=True,
        include_turns=True,
        max_turns=5
    )
    
    print(f"🔍 Found {len(memories)} relevant memories")
    print(f"📊 Current state: {context.state}")
    return context

def main():
    """Run the chatbot example"""
    print("🤖 StateBase Chatbot Example\n")
    
    # Create a session
    session = create_chatbot_session(user_id="user_123")
    
    # Simulate a conversation
    print("\n--- Conversation Start ---\n")
    
    # Turn 1: Greeting
    handle_conversation_turn(
        session_id=session.id,
        user_message="Hi! I'm looking for help with my Python project.",
        bot_response="Hello! I'd be happy to help with your Python project. What specifically are you working on?"
    )
    
    # Save preference
    save_user_preference(
        session_id=session.id,
        preference="User is working on a Python project and prefers technical explanations"
    )
    
    # Turn 2: Technical question
    handle_conversation_turn(
        session_id=session.id,
        user_message="I need to build an API. Should I use FastAPI or Flask?",
        bot_response="For modern Python APIs, I'd recommend FastAPI. It has built-in async support, automatic API documentation, and excellent type safety with Pydantic."
    )
    
    # Save another preference
    save_user_preference(
        session_id=session.id,
        preference="User is interested in building APIs and values modern tools"
    )
    
    # Turn 3: Follow-up
    handle_conversation_turn(
        session_id=session.id,
        user_message="Great! Can you show me a quick example?",
        bot_response="Sure! Here's a minimal FastAPI example: [code example would go here]"
    )
    
    print("\n--- Retrieving Context ---\n")
    
    # Get context for next response
    context = get_relevant_context(
        session_id=session.id,
        query="user preferences and technical background"
    )
    
    print(f"\n✅ Session complete!")
    print(f"   - Total turns: {context.state.get('turn_count', 0)}")
    print(f"   - Memories stored: {len(context.memories)}")
    print(f"   - Session ID: {session.id}")

if __name__ == "__main__":
    main()
