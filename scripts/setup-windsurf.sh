#!/bin/bash

# Memory Bank - Windsurf Integration Setup Script
# Configures Windsurf IDE to work with Memory Bank system

set -e

echo "🏄 Memory Bank - Windsurf Integration Setup"
echo "============================================"

# Function to check prerequisites
check_prerequisites() {
    echo "📋 Checking prerequisites..."
    
    # Check if we're in a git repository
    if [ ! -d ".git" ]; then
        echo "   ⚠️  Warning: Not in a git repository. Windsurf works best with git repos."
    else
        echo "   ✅ Git repository detected"
    fi
    
    # Check if memory-bank exists
    if [ ! -d "memory-bank" ]; then
        echo "   ❌ Memory Bank not found. Please initialize Memory Bank first:"
        echo "      Run: ./scripts/setup-memory-bank.sh (universal setup)"
        echo "      Or manually create memory-bank/ directory with core files"
        exit 1
    else
        echo "   ✅ Memory Bank directory found"
    fi
    
    # List memory bank files
    echo "   📁 Memory Bank files detected:"
    for file in memory-bank/*.md; do
        if [ -f "$file" ]; then
            echo "      - $(basename "$file")"
        fi
    done
    
    echo ""
}

# Function to create Windsurf rules
setup_windsurf_rules() {
    echo "📝 Setting up Windsurf rules (.windsurfrules)..."
    
    # Check if .windsurfrules already exists
    if [ -f ".windsurfrules" ]; then
        echo "   Found existing .windsurfrules"
        echo "   Backing up to .windsurfrules.backup"
        cp .windsurfrules .windsurfrules.backup
    fi
    
    # Create comprehensive .windsurfrules file
    cat > .windsurfrules << 'EOF'
# Memory Bank Integration Rules for Windsurf/Cascade

## Core Protocol
ALWAYS read and reference these Memory Bank files for complete project context:
- memory-bank/activeContext.md (current session goals and status)
- memory-bank/productContext.md (project overview and architecture)
- memory-bank/decisionLog.md (architectural decisions and rationale)
- memory-bank/progress.md (completed work and next steps)
- memory-bank/systemPatterns.md (coding patterns and standards)

## Memory Bank Management
- Update memory-bank files automatically during development
- When making significant changes, update relevant Memory Bank files
- Include rationale for architectural decisions in decisionLog.md
- Track progress and completed work in progress.md
- Maintain current patterns in systemPatterns.md

## Trigger Commands
- "Update Memory Bank" or "UMB" = Comprehensive sync of all Memory Bank files
- "Initialize Memory Bank" = Create Memory Bank structure if missing
- "Review Memory Bank" = Analyze current Memory Bank state and suggest improvements

## Code Generation Standards
- Prioritize readability and maintainability
- Follow established patterns from systemPatterns.md
- Consider architectural constraints from decisionLog.md
- Align with project goals from productContext.md
- Include comprehensive error handling
- Add appropriate tests for new functionality
- Update documentation when adding new features

## Memory Bank File Updates
When updating Memory Bank files:
1. Use timestamps for all updates: [YYYY-MM-DD HH:MM:SS]
2. Be specific and detailed in descriptions
3. Cross-reference between files when relevant
4. Maintain consistency across all Memory Bank files
5. Focus on actionable information

## Session Management
- Start each session by reading all Memory Bank files
- Update activeContext.md with current session goals
- End sessions by updating progress.md with completed work
- Document any architectural decisions made during the session

## Project Context Awareness
- Always consider existing architectural decisions before suggesting changes
- Reference established patterns when generating new code
- Align suggestions with project goals and constraints
- Maintain consistency with existing codebase patterns

## Development Workflow
1. Read Memory Bank files for context
2. Understand current session goals from activeContext.md
3. Follow established patterns from systemPatterns.md
4. Make code changes following project standards
5. Update relevant Memory Bank files with progress
6. Document any decisions made during development

## Quality Standards
- Ensure all code follows project conventions
- Include proper error handling and logging
- Add comprehensive tests for new features
- Update documentation for public APIs
- Consider performance and security implications
- Follow accessibility guidelines where applicable

## Communication Style
- Be concise but comprehensive in Memory Bank updates
- Use clear, actionable language
- Include context for future reference
- Cross-reference related Memory Bank entries
- Maintain professional but conversational tone
EOF
    
    echo "   ✅ Windsurf rules (.windsurfrules) created"
}

# Function to create Memory Bank initialization structure
create_memory_bank_structure() {
    echo "📂 Ensuring Memory Bank structure is complete..."
    
    # Create systemPatterns.md if it doesn't exist
    if [ ! -f "memory-bank/systemPatterns.md" ]; then
        echo "   Creating memory-bank/systemPatterns.md..."
        cat > memory-bank/systemPatterns.md << 'EOF'
# System Patterns

## Memory Bank Integration
- [YYYY-MM-DD HH:MM:SS] - Windsurf Integration Pattern
  - **Usage**: Reference Memory Bank files in Cascade prompts for better context
  - **Implementation**: Use "Follow the protocol in your rules" to activate Memory Bank awareness
  - **Examples**: 
    - "Update Memory Bank" or "UMB" for comprehensive sync
    - "Initialize Memory Bank" for setup
    - "Review Memory Bank" for analysis

## Code Organization Patterns
- [YYYY-MM-DD HH:MM:SS] - Memory Bank File Organization
  - **Context**: Consistent organization of project knowledge
  - **Structure**: Separate files for different types of context
  - **Benefits**: Easy to maintain, search, and update specific types of information

## Development Workflow Patterns
- [YYYY-MM-DD HH:MM:SS] - Session Management Pattern
  - **Usage**: Start sessions by reviewing Memory Bank, end by updating progress
  - **Implementation**: Use Windsurf rules to automatically maintain context
  - **Benefits**: Consistent project understanding across sessions
EOF
        echo "   ✅ Created memory-bank/systemPatterns.md with Windsurf patterns"
    else
        echo "   ✅ memory-bank/systemPatterns.md already exists"
    fi
}

# Function to create Windsurf-specific documentation
create_windsurf_docs() {
    echo "📚 Creating Windsurf integration documentation..."
    
    cat > WINDSURF-INTEGRATION.md << 'EOF'
# 🏄 Memory Bank + Windsurf Integration

**Enhanced AI Development with Persistent Context for Windsurf IDE**

This integration brings the powerful Memory Bank system to Windsurf IDE, providing seamless persistent context across development sessions with Cascade AI assistant that truly understands your project.

## 🎯 Why Memory Bank + Windsurf?

Windsurf's Cascade AI is excellent at understanding code and context, but it lacks persistent project memory across sessions. Memory Bank solves this by:

- **Persistent Context**: Maintains project knowledge across Cascade sessions
- **Better Code Generation**: Cascade understands your patterns, architecture, and decisions
- **Consistent Standards**: Enforces coding patterns and architectural decisions
- **Automatic Documentation**: Real-time updates to project knowledge
- **Team Collaboration**: Shared context across team members using Windsurf

## 🚀 Quick Setup

### Prerequisites

- **Windsurf IDE** installed and running
- **Memory Bank** initialized in your project
- **Git repository** (recommended)

### Installation

```bash
# Run the setup script
./scripts/setup-windsurf.sh
```

Or manually:
1. Copy `.windsurfrules` to your project root
2. Initialize Memory Bank structure
3. Tell Cascade: "Follow the protocol in your rules"

## 🔄 Core Features

### Windsurf Rules Integration

The setup creates a comprehensive `.windsurfrules` file that:
- Instructs Cascade to always read Memory Bank files
- Provides trigger commands for Memory Bank operations
- Establishes coding standards and patterns
- Defines update procedures and workflows

### Trigger Commands

Use these commands with Cascade:

| Command | Purpose |
|---------|---------|
| `"Follow the protocol in your rules"` | Activate Memory Bank awareness |
| `"Update Memory Bank"` or `"UMB"` | Comprehensive sync of all files |
| `"Initialize Memory Bank"` | Create Memory Bank structure |
| `"Review Memory Bank"` | Analyze and suggest improvements |

### Automatic Context Loading

When you tell Cascade to "Follow the protocol in your rules", it will:
1. Read all Memory Bank files for complete context
2. Understand current session goals
3. Reference established patterns and decisions
4. Maintain awareness throughout the session

## 💡 Usage Examples

### Starting a New Session

```
Tell Cascade: "Follow the protocol in your rules. I want to add user authentication to the app."

Cascade will:
- Read all Memory Bank files
- Understand your project architecture
- Reference existing patterns
- Propose authentication approach
- Update Memory Bank with decisions
```

### During Development

```
Tell Cascade: "Create a new API endpoint for user profiles following our established patterns"

Cascade will:
- Reference systemPatterns.md for conventions
- Follow architectural decisions from decisionLog.md
- Update progress.md with completed work
- Maintain consistency with existing code
```

### End of Session

```
Tell Cascade: "Update Memory Bank with today's progress"

Cascade will:
- Update progress.md with completed work
- Document any new decisions made
- Update activeContext.md for next session
- Ensure all changes are captured
```

## 🗂️ Memory Bank Structure

```
memory-bank/
├── activeContext.md     # Current session state and goals
├── productContext.md    # Project overview and architecture  
├── progress.md          # Task tracking and milestones
├── decisionLog.md       # Architectural decisions with rationale
└── systemPatterns.md    # Coding patterns and Windsurf workflows
```

## 🔧 Advanced Configuration

### Custom Rules

You can extend `.windsurfrules` with project-specific instructions:

```
# Add to .windsurfrules
## Project-Specific Rules
- Use TypeScript for all new components
- Follow React Hooks patterns
- Include Storybook stories for UI components
- Use Jest for unit testing
```

### MCP Integration

For advanced setups, consider integrating with MCP servers:

1. **Add Memory Bank MCP Server** (if available)
2. **Configure custom tools** for Memory Bank operations
3. **Set up automated backups** of Memory Bank files

### Team Collaboration

For team usage:
1. **Commit `.windsurfrules`** to version control
2. **Share Memory Bank setup** across team members
3. **Establish Memory Bank update conventions**
4. **Use consistent trigger commands**

## 🔍 Best Practices

### Effective Prompting

**Instead of:**
```
Create a new component for user settings
```

**Try:**
```
Follow the protocol in your rules. Create a new user settings component following our established patterns and architectural decisions.
```

### Memory Bank Maintenance

1. **Regular Updates**: Use "UMB" at the end of significant work sessions
2. **Clear Documentation**: Keep Memory Bank files concise and actionable
3. **Cross-References**: Link related decisions across files
4. **Timestamp Everything**: Always include timestamps for updates

### Session Management

1. **Start with Rules**: Always begin with "Follow the protocol in your rules"
2. **End with Updates**: Conclude sessions with Memory Bank updates
3. **Review Regularly**: Periodically review Memory Bank state
4. **Keep Current**: Remove outdated information

## 🚦 Troubleshooting

### Cascade Not Following Rules

1. **Explicit Reference**: Start prompts with "Follow the protocol in your rules"
2. **Check File Paths**: Ensure `.windsurfrules` exists in project root
3. **Restart Windsurf**: Reload window to refresh rules
4. **Memory Bank Files**: Verify all Memory Bank files exist

### Memory Bank Not Updating

1. **Use Trigger Commands**: Explicitly use "Update Memory Bank" or "UMB"
2. **Check File Permissions**: Ensure Memory Bank files are writable
3. **Verify Structure**: Confirm Memory Bank directory structure is correct

### Context Not Loading

1. **Initialize First**: Use "Initialize Memory Bank" if structure is missing
2. **File Content**: Ensure Memory Bank files have meaningful content
3. **Explicit Instructions**: Reference specific Memory Bank files in prompts

## 📚 Integration Examples

### Example 1: Feature Development

**Prompt:**
```
Follow the protocol in your rules. I need to add a shopping cart feature to our e-commerce app. Consider our existing architecture and patterns.
```

**Result:** Cascade reads Memory Bank, understands current architecture, references established patterns, proposes cart implementation, and updates Memory Bank with decisions.

### Example 2: Bug Investigation

**Prompt:**
```
Follow the protocol in your rules. There's a performance issue with our user search. Help me investigate and fix it.
```

**Result:** Cascade reviews current context, checks recent changes in progress.md, investigates issue following debugging patterns, and documents findings.

### Example 3: Code Review

**Prompt:**
```
Follow the protocol in your rules. Review this pull request against our coding standards and architectural decisions.
```

**Result:** Cascade checks systemPatterns.md and decisionLog.md, reviews code for consistency, and provides feedback aligned with project standards.

## 🤝 Contributing

Help improve Memory Bank + Windsurf integration:

- **Share Usage Patterns**: Contribute effective rule configurations
- **Report Issues**: Help identify and fix integration problems
- **Document Best Practices**: Share successful workflow patterns
- **Improve Rules**: Enhance the default `.windsurfrules` file

## 📖 Further Reading

- [Windsurf Documentation](https://docs.windsurf.com)
- [Memory Bank Core Documentation](README.md)
- [Cursor Integration Guide](CURSOR-INTEGRATION.md)
- [GitHub Copilot Integration](GITHUB-COPILOT-INTEGRATION.md)
- [Developer Primer](developer-primer.md)

---

By combining Memory Bank's persistent context with Windsurf's powerful Cascade AI, you create a development environment that truly understands your project and maintains that understanding across all sessions and team members. 🏄‍♂️
EOF
    
    echo "   ✅ Windsurf integration documentation created"
}

# Function to create sample Windsurf configurations
create_sample_configs() {
    echo "📁 Creating sample Windsurf configurations..."
    
    # Create .windsurf directory if it doesn't exist
    if [ ! -d ".windsurf" ]; then
        mkdir -p .windsurf
    fi
    
    # Create sample memories configuration
    cat > .windsurf/memory-bank-memories.md << 'EOF'
# Memory Bank Memories for Windsurf

## Project Memory Bank Integration

This project uses Memory Bank for persistent context across Cascade AI sessions.

### Key Memory Bank Files
- `memory-bank/activeContext.md` - Current session goals and status
- `memory-bank/productContext.md` - Project overview and architecture
- `memory-bank/decisionLog.md` - Architectural decisions and rationale
- `memory-bank/progress.md` - Work completed and next steps
- `memory-bank/systemPatterns.md` - Coding patterns and standards

### Usage Patterns
- Start sessions with "Follow the protocol in your rules"
- Use "Update Memory Bank" or "UMB" for comprehensive updates
- Reference Memory Bank files explicitly in prompts
- End sessions by updating progress and context

### Code Generation Preferences
- Follow patterns documented in systemPatterns.md
- Consider architectural constraints from decisionLog.md
- Align with project goals from productContext.md
- Include comprehensive error handling and tests
- Update documentation when adding features
EOF
    
    echo "   ✅ Sample Windsurf memories created"
}

# Function to display usage instructions
show_usage_instructions() {
    echo ""
    echo "🎉 Windsurf Integration Setup Complete!"
    echo "======================================"
    echo ""
    echo "📋 What was configured:"
    echo "✅ .windsurfrules - Windsurf rules for Memory Bank integration"
    echo "✅ memory-bank/systemPatterns.md - Windsurf-specific patterns"
    echo "✅ WINDSURF-INTEGRATION.md - Complete integration guide"
    echo "✅ .windsurf/memory-bank-memories.md - Sample memories"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Open Windsurf and load your project"
    echo "2. Start a new Cascade session"
    echo "3. Tell Cascade: 'Follow the protocol in your rules'"
    echo "4. Begin development with full Memory Bank context!"
    echo ""
    echo "💡 Key Commands:"
    echo "- 'Follow the protocol in your rules' - Activate Memory Bank awareness"
    echo "- 'Update Memory Bank' or 'UMB' - Comprehensive sync"
    echo "- 'Initialize Memory Bank' - Set up structure"
    echo "- 'Review Memory Bank' - Analyze current state"
    echo ""
    echo "📚 Documentation:"
    echo "- WINDSURF-INTEGRATION.md: Complete integration guide"
    echo "- .windsurfrules: Rules that guide Cascade behavior"
    echo "- memory-bank/: Your project's persistent context"
    echo ""
    echo "🔧 Troubleshooting:"
    echo "Run ./scripts/validate-windsurf.sh to verify setup"
    echo ""
    echo "🏄 Ready to surf with persistent context!"
}

# Main execution
main() {
    check_prerequisites
    setup_windsurf_rules
    create_memory_bank_structure
    create_windsurf_docs
    create_sample_configs
    show_usage_instructions
}

# Run the main function
main 