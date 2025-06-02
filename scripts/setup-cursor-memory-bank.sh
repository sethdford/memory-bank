#!/bin/bash

# Memory Bank - Cursor Custom Modes Setup Script
# Integrates the Memory Bank system with Cursor's custom mode feature

set -e

echo "🧠 Memory Bank - Cursor Custom Modes Setup"
echo "=================================================="

# Check if we're in a directory with .cursor folder or create it
if [ ! -d ".cursor" ]; then
    echo "📁 Creating .cursor directory..."
    mkdir -p .cursor
fi

# Create the rules directory if it doesn't exist
if [ ! -d ".cursor/rules" ]; then
    echo "📁 Creating .cursor/rules directory..."
    mkdir -p .cursor/rules
fi

# Function to check if Cursor custom modes are enabled
check_cursor_custom_modes() {
    echo "📋 Checking Cursor custom modes availability..."
    echo "   Please ensure you have:"
    echo "   1. Cursor version 0.48+ installed"
    echo "   2. Custom modes enabled in Settings → Features → Chat → Custom modes"
    echo ""
}

# Function to install/update modes.json
install_modes_config() {
    echo "⚙️  Installing Memory Bank custom modes configuration..."
    
    if [ -f ".cursor/modes.json" ]; then
        echo "   Found existing .cursor/modes.json"
        echo "   Backing up to .cursor/modes.json.backup"
        cp .cursor/modes.json .cursor/modes.json.backup
    fi
    
    # Copy the modes.json file (assuming it exists in the repo)
    if [ -f ".cursor/modes.json" ]; then
        echo "   ✅ Memory Bank custom modes installed successfully!"
    else
        echo "   ❌ Error: .cursor/modes.json not found in the repository"
        echo "   Please make sure you've cloned the complete repository"
        exit 1
    fi
}

# Function to install Cursor rules
install_cursor_rules() {
    echo "📝 Installing Memory Bank Cursor rules..."
    
    # Copy all .mdc rule files if they exist
    if [ -f ".cursor/rules/memory-bank-initialization.mdc" ]; then
        echo "   ✅ Memory Bank initialization rule installed"
    else
        echo "   ❌ Error: Memory Bank rules not found"
        echo "   Please make sure you've cloned the complete repository"
        exit 1
    fi
}

# Function to create initial project structure
create_project_structure() {
    echo "📂 Setting up project structure..."
    
    # Create memory-bank directory if it doesn't exist
    if [ ! -d "memory-bank" ]; then
        echo "   Creating memory-bank/ directory..."
        mkdir -p memory-bank
        
        # Create template files
        cat > memory-bank/activeContext.md << EOF
# Active Context

## Current Session Goals
- Project setup and Memory Bank integration with Cursor custom modes

## Recent Changes
- [$(date '+%Y-%m-%d %H:%M:%S')] - Initialized Memory Bank system with Cursor custom modes

## Open Questions/Issues
- None currently

## Session Context
- Setting up Memory Bank to work with Cursor's custom mode feature
EOF

        cat > memory-bank/productContext.md << EOF
# Product Context

## Project Overview
- **Purpose**: [Describe your project purpose]
- **Goals**: [Main project objectives]
- **Scope**: [What's included/excluded in this project]

## Technical Architecture
- **Stack**: [Technology choices - e.g., React, TypeScript, Node.js]
- **Components**: [Main system components]
- **Dependencies**: [Key dependencies]

## Standards & Conventions
- **Code Style**: [Coding standards and linting rules]
- **Documentation**: [Documentation requirements]
- **Testing**: [Testing approach and coverage requirements]

## Memory Bank Integration
- **Custom Modes**: Architect, Code, Ask, Debug, Update modes configured
- **Workflow**: Using Cursor custom modes for persistent context across sessions
EOF

        cat > memory-bank/progress.md << EOF
# Progress Tracking

## Completed Work
- [$(date '+%Y-%m-%d %H:%M:%S')] - Memory Bank system setup with Cursor custom modes
- [$(date '+%Y-%m-%d %H:%M:%S')] - Custom modes configuration installed

## Current Tasks
- [$(date '+%Y-%m-%d %H:%M:%S')] - Testing Memory Bank custom modes workflow

## Next Steps
- Test each custom mode (Architect, Code, Ask, Debug, Update)
- Begin using Memory Bank workflow for project development
- Establish project-specific patterns and standards

## Known Issues
- None currently
EOF

        cat > memory-bank/decisionLog.md << EOF
# Decision Log

## Architectural Decisions
- [$(date '+%Y-%m-%d %H:%M:%S')] - Memory Bank Integration Decision
  - **Context**: Need for persistent project context across Cursor sessions
  - **Decision**: Implement Memory Bank with Cursor custom modes
  - **Rationale**: Provides structured approach to maintaining context and project knowledge
  - **Implications**: Enables consistent AI assistance and project understanding across sessions

## Technical Choices
- [$(date '+%Y-%m-%d %H:%M:%S')] - Cursor Custom Modes Selection
  - **Alternatives**: Traditional Cursor rules only, external documentation systems
  - **Selection**: Cursor custom modes with Memory Bank integration
  - **Reasoning**: Native integration with Cursor, mode-specific tool access, structured workflows
EOF

        cat > memory-bank/systemPatterns.md << EOF
# System Patterns

## Memory Bank Workflow Patterns
- [$(date '+%Y-%m-%d %H:%M:%S')] - Custom Mode Usage Pattern
  - **Usage**: Switch between specialized modes based on task type
  - **Implementation**: Use keyboard shortcuts or mode picker to switch contexts
  - **Examples**: 
    - ⌘⇧A for Architect mode (design, initialization)
    - ⌘⇧C for Code mode (implementation)
    - ⌘⇧? for Ask mode (questions, guidance)
    - ⌘⇧D for Debug mode (troubleshooting)
    - ⌘⇧U for Update mode (sync memory bank)

## Code Organization Patterns
- [$(date '+%Y-%m-%d %H:%M:%S')] - Memory Bank File Organization
  - **Context**: Consistent organization of project knowledge
  - **Structure**: Separate files for different types of context
  - **Benefits**: Easy to maintain, search, and update specific types of information
EOF

        echo "   ✅ Memory Bank directory structure created with initial files"
    else
        echo "   📁 Memory Bank directory already exists"
    fi
}

# Function to display usage instructions
show_usage_instructions() {
    echo ""
    echo "🎉 Setup Complete!"
    echo "=================="
    echo ""
    echo "📋 Next Steps:"
    echo "1. Open Cursor and navigate to this project"
    echo "2. Verify custom modes are enabled: Settings → Features → Chat → Custom modes"
    echo "3. You should see these new modes in your mode picker:"
    echo "   🏗️  Memory Bank Architect (⌘⇧A)"
    echo "   💻 Memory Bank Code (⌘⇧C)"
    echo "   ❓ Memory Bank Ask (⌘⇧?)"
    echo "   🐛 Memory Bank Debug (⌘⇧D)"
    echo "   🔄 Memory Bank Update (⌘⇧U)"
    echo ""
    echo "🚀 Getting Started:"
    echo "1. Start with 🏗️ Memory Bank Architect mode to initialize your project"
    echo "2. Use 💻 Memory Bank Code mode for implementation work"
    echo "3. Use ❓ Memory Bank Ask mode for questions and guidance"
    echo "4. Use 🐛 Memory Bank Debug mode for troubleshooting"
    echo "5. Use 🔄 Memory Bank Update mode to sync memory bank at session end"
    echo ""
    echo "📚 Documentation:"
    echo "- README.md: Complete system overview"
    echo "- developer-primer.md: Technical implementation details"
    echo "- memory-bank/: Your project's persistent context"
    echo ""
    echo "💡 Pro Tip: Always start new sessions by reading memory-bank files for context!"
}

# Main execution
main() {
    check_cursor_custom_modes
    install_modes_config
    install_cursor_rules
    create_project_structure
    show_usage_instructions
}

# Run the main function
main 