#!/bin/bash

# Memory Bank - GitHub Copilot Integration Setup Script
# Configures GitHub Copilot to work with Memory Bank system

set -e

echo "🤖 Memory Bank - GitHub Copilot Integration Setup"
echo "================================================="

# Function to check prerequisites
check_prerequisites() {
    echo "📋 Checking prerequisites..."
    
    # Check if we're in a git repository
    if [ ! -d ".git" ]; then
        echo "   ⚠️  Warning: Not in a git repository. GitHub Copilot works best with git repos."
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

# Function to create .github directory and copilot instructions
setup_github_instructions() {
    echo "📝 Setting up GitHub Copilot custom instructions..."
    
    # Create .github directory if it doesn't exist
    if [ ! -d ".github" ]; then
        echo "   Creating .github directory..."
        mkdir -p .github
    fi
    
    # Check if copilot-instructions.md already exists
    if [ -f ".github/copilot-instructions.md" ]; then
        echo "   Found existing .github/copilot-instructions.md"
        echo "   Backing up to .github/copilot-instructions.md.backup"
        cp .github/copilot-instructions.md .github/copilot-instructions.md.backup
    fi
    
    # Create copilot-instructions.md
    cat > .github/copilot-instructions.md << 'EOF'
# Memory Bank Integration

This project uses Memory Bank for persistent context across AI sessions.

## Project Context
- Check memory-bank/productContext.md for project overview and architecture
- Review memory-bank/activeContext.md for current session goals and status  
- Consult memory-bank/decisionLog.md for architectural decisions and rationale
- Reference memory-bank/progress.md for completed work and next steps

## Coding Standards
- Follow patterns documented in memory-bank/systemPatterns.md
- Reference established conventions in productContext.md
- Maintain consistency with existing architectural decisions

## Memory Bank Updates
When making significant changes:
- Suggest updates to relevant memory bank files
- Include rationale for architectural decisions in decisionLog.md
- Track progress and completed work in progress.md

## Code Generation Preferences
- Prioritize readability and maintainability
- Follow established patterns from systemPatterns.md
- Consider architectural constraints from decisionLog.md
- Align with project goals from productContext.md
- Include comprehensive error handling
- Add appropriate tests for new functionality
- Update documentation when adding new features

## Commit Message Guidelines
- Reference memory-bank/progress.md for context
- Include relevant task IDs and feature descriptions
- Align with project goals and completed milestones
- Use conventional commit format when applicable
EOF
    
    echo "   ✅ GitHub Copilot custom instructions created"
}

# Function to setup VS Code workspace settings
setup_vscode_settings() {
    echo "⚙️  Setting up VS Code workspace configuration..."
    
    # Create .vscode directory if it doesn't exist
    if [ ! -d ".vscode" ]; then
        echo "   Creating .vscode directory..."
        mkdir -p .vscode
    fi
    
    # Check if settings.json already exists
    settings_exists=false
    if [ -f ".vscode/settings.json" ]; then
        settings_exists=true
        echo "   Found existing .vscode/settings.json"
        echo "   Backing up to .vscode/settings.json.backup"
        cp .vscode/settings.json .vscode/settings.json.backup
    fi
    
    # Create or update settings.json with Copilot configuration
    if [ "$settings_exists" = true ]; then
        # If settings exist, we'll create a separate copilot-settings.json for manual merge
        cat > .vscode/copilot-settings.json << 'EOF'
{
  "github.copilot.chat.codeGeneration.instructions": [
    {
      "file": "./memory-bank/productContext.md"
    },
    {
      "file": "./memory-bank/systemPatterns.md"
    },
    {
      "text": "Always consider established patterns and architectural decisions from Memory Bank files"
    }
  ],
  "github.copilot.chat.commitMessageGeneration.instructions": [
    {
      "text": "Reference memory-bank/progress.md for context. Include relevant task IDs, feature descriptions, and align with project goals."
    }
  ],
  "github.copilot.chat.codeReview.instructions": [
    {
      "text": "Review code against patterns in memory-bank/systemPatterns.md and architectural decisions in memory-bank/decisionLog.md"
    }
  ]
}
EOF
        echo "   ⚠️  Created .vscode/copilot-settings.json"
        echo "   Please manually merge these settings into your existing .vscode/settings.json"
    else
        # Create new settings.json
        cat > .vscode/settings.json << 'EOF'
{
  "github.copilot.chat.codeGeneration.instructions": [
    {
      "file": "./memory-bank/productContext.md"
    },
    {
      "file": "./memory-bank/systemPatterns.md"
    },
    {
      "text": "Always consider established patterns and architectural decisions from Memory Bank files"
    }
  ],
  "github.copilot.chat.commitMessageGeneration.instructions": [
    {
      "text": "Reference memory-bank/progress.md for context. Include relevant task IDs, feature descriptions, and align with project goals."
    }
  ],
  "github.copilot.chat.codeReview.instructions": [
    {
      "text": "Review code against patterns in memory-bank/systemPatterns.md and architectural decisions in memory-bank/decisionLog.md"
    }
  ]
}
EOF
        echo "   ✅ VS Code workspace settings created"
    fi
}

# Function to create sample prompt files
setup_sample_prompts() {
    echo "📁 Setting up sample prompt files..."
    
    # Create .github/prompts directory
    if [ ! -d ".github/prompts" ]; then
        mkdir -p .github/prompts
    fi
    
    # Create API endpoint prompt
    cat > .github/prompts/api-endpoint.prompt.md << 'EOF'
Generate a new API endpoint following our project standards.

## Context Files
- Architecture: [memory-bank/productContext.md](../../memory-bank/productContext.md)
- Patterns: [memory-bank/systemPatterns.md](../../memory-bank/systemPatterns.md)  
- Decisions: [memory-bank/decisionLog.md](../../memory-bank/decisionLog.md)

## Requirements
- Follow RESTful conventions
- Include proper error handling  
- Add comprehensive tests
- Update API documentation
- Consider security requirements
- Follow established patterns

## Please provide:
1. Implementation code
2. Tests
3. Documentation updates
4. Any Memory Bank file updates needed
EOF
    
    # Create component prompt
    cat > .github/prompts/component.prompt.md << 'EOF'
Generate a new component following our design system and patterns.

## Context Files
- Architecture: [memory-bank/productContext.md](../../memory-bank/productContext.md)
- Patterns: [memory-bank/systemPatterns.md](../../memory-bank/systemPatterns.md)
- Decisions: [memory-bank/decisionLog.md](../../memory-bank/decisionLog.md)

## Requirements
- Follow component patterns from systemPatterns.md
- Include proper TypeScript types
- Add comprehensive tests
- Include Storybook stories (if applicable)
- Follow accessibility guidelines
- Include proper documentation

## Please provide:
1. Component implementation
2. Test files
3. Documentation
4. Usage examples
EOF
    
    echo "   ✅ Sample prompt files created in .github/prompts/"
}

# Function to create integration documentation
create_integration_docs() {
    echo "📚 Creating integration documentation..."
    
    cat > .github/COPILOT-MEMORY-BANK.md << 'EOF'
# Memory Bank + GitHub Copilot Integration

This repository is configured to work with Memory Bank for persistent AI context.

## How It Works

- **Repository Instructions**: `.github/copilot-instructions.md` provides project context
- **Workspace Settings**: `.vscode/settings.json` configures code generation preferences
- **Sample Prompts**: `.github/prompts/` contains reusable prompt templates

## Usage

### Effective Prompting
Reference Memory Bank files in your prompts:
```
Create a new user service following patterns in memory-bank/systemPatterns.md
```

### Memory Bank Files
- `memory-bank/productContext.md` - Project overview and architecture
- `memory-bank/activeContext.md` - Current session goals
- `memory-bank/decisionLog.md` - Architectural decisions  
- `memory-bank/progress.md` - Work completed and next steps
- `memory-bank/systemPatterns.md` - Coding patterns and standards

### Commit Messages
Copilot will automatically reference Memory Bank context for better commit messages.

### Code Reviews
Code reviews will consider established patterns and architectural decisions.

## Maintenance

Keep Memory Bank files updated for best results:
- Update progress.md as work completes
- Document decisions in decisionLog.md
- Maintain current patterns in systemPatterns.md
EOF
    
    echo "   ✅ Integration documentation created"
}

# Function to display usage instructions
show_usage_instructions() {
    echo ""
    echo "🎉 GitHub Copilot Integration Setup Complete!"
    echo "============================================="
    echo ""
    echo "📋 What was configured:"
    echo "✅ .github/copilot-instructions.md - Repository custom instructions"
    echo "✅ .vscode/settings.json - Workspace configuration"
    echo "✅ .github/prompts/ - Sample prompt templates"
    echo "✅ .github/COPILOT-MEMORY-BANK.md - Integration documentation"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Install GitHub Copilot extension in VS Code if not already installed"
    echo "2. Ensure you have a GitHub Copilot subscription"
    echo "3. Reload VS Code window to apply new settings"
    echo "4. Test integration with prompts like:"
    echo "   'Create a component following memory-bank/systemPatterns.md'"
    echo ""
    echo "💡 Pro Tips:"
    echo "- Reference Memory Bank files explicitly in your prompts"
    echo "- Keep Memory Bank files updated for best results"
    echo "- Use sample prompts in .github/prompts/ as templates"
    echo "- Commit messages will automatically reference Memory Bank context"
    echo ""
    echo "📚 Documentation:"
    echo "- .github/COPILOT-MEMORY-BANK.md: Integration guide"
    echo "- GITHUB-COPILOT-INTEGRATION.md: Comprehensive documentation"
    echo "- memory-bank/: Your project's persistent context"
    echo ""
    echo "🔧 Troubleshooting:"
    echo "Run ./scripts/validate-github-copilot.sh to verify setup"
}

# Main execution
main() {
    check_prerequisites
    setup_github_instructions
    setup_vscode_settings
    setup_sample_prompts
    create_integration_docs
    show_usage_instructions
}

# Run the main function
main 