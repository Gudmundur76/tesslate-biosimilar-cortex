#!/bin/bash

# Tesslate Biosimilar Cortex - Automated Setup Script
# This script prepares the environment by forking foundational repositories
# and setting up the local directory structure.

echo "🚀 Starting Tesslate Biosimilar Cortex Setup..."

# 1. Define foundational repositories
RUVECTOR_REPO="https://github.com/ruvnet/ruvector.git"
AGENT_SKILLS_REPO="https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering.git"

# 2. Create directory structure
echo "📂 Creating project directories..."
mkdir -p core/foundational
mkdir -p core/skills
mkdir -p src/api
mkdir -p src/services

# 3. Clone/Fork foundational repositories
echo "🌐 Cloning foundational repositories..."

if [ ! -d "core/foundational/ruvector" ]; then
    git clone $RUVECTOR_REPO core/foundational/ruvector
else
    echo "✅ RuVector already exists, skipping clone."
fi

if [ ! -d "core/foundational/agent-skills" ]; then
    git clone $AGENT_SKILLS_REPO core/foundational/agent-skills
else
    echo "✅ Agent-Skills already exists, skipping clone."
fi

# 4. Initialize environment
echo "⚙️  Initializing environment..."
if [ ! -f ".env" ]; then
    cat <<EOF > .env
# Tesslate Biosimilar Cortex Environment Variables
DATABASE_URL=postgresql://user:password@localhost:5432/tesslate_biosimilar
RUVECTOR_STORAGE_PATH=./data/ruvector
CONTEXT_ENGINEERING_ENABLED=true
NVIDIA_NIM_API_KEY=your_api_key_here
EOF
    echo "✅ .env file created. Please update with your credentials."
else
    echo "✅ .env file already exists."
fi

echo "✨ Setup complete! You are ready to build the Biosimilar Cortex."
echo "👉 Next steps: Run 'docker-compose up --build' to start the services."
