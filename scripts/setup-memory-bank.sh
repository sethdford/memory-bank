#!/bin/bash

# Memory Bank - Universal Setup Script
# Choose your integration: Cursor, GitHub Copilot, or both

set -e

echo "🧠 Memory Bank - Universal Setup"
echo "================================"
echo ""
echo "Choose your integration:"
echo "1. 🏗️  Cursor Custom Modes (recommended for Cursor users)"
echo "2. 🤖 GitHub Copilot Integration (for VS Code + Copilot)"
echo "3. 🏄 Windsurf Integration (for Windsurf IDE + Cascade)"
echo "4. 🚀 All Integrations (Cursor + GitHub Copilot + Windsurf)"
echo "5. ❓ Help me choose"
echo "6. 🔧 Validation only"
echo ""
read -p "Enter your choice (1-6): " choice

case $choice in
    1)
        echo ""
        echo "🏗️  Setting up Cursor Custom Modes integration..."
        echo "This will configure Memory Bank with Cursor's custom mode feature."
        echo ""
        ./scripts/setup-cursor-memory-bank.sh
        ;;
    2)
        echo ""
        echo "🤖 Setting up GitHub Copilot integration..."
        echo "This will configure Memory Bank to work with GitHub Copilot."
        echo ""
        ./scripts/setup-github-copilot.sh
        ;;
    3)
        echo ""
        echo "🏄 Setting up Windsurf integration..."
        echo "This will configure Memory Bank for Windsurf IDE with Cascade AI."
        echo ""
        ./scripts/setup-windsurf.sh
        ;;
    4)
        echo ""
        echo "🚀 Setting up all integrations..."
        echo "This will configure Memory Bank for Cursor, GitHub Copilot, and Windsurf."
        echo ""
        echo "Setting up Cursor first..."
        ./scripts/setup-cursor-memory-bank.sh
        echo ""
        echo "Now setting up GitHub Copilot..."
        ./scripts/setup-github-copilot.sh
        echo ""
        echo "Now setting up Windsurf..."
        ./scripts/setup-windsurf.sh
        echo ""
        echo "🎉 All integrations complete! You can now use Memory Bank with Cursor, GitHub Copilot, and Windsurf."
        ;;
    5)
        echo ""
        echo "❓ Help choosing the right integration:"
        echo ""
        echo "📋 Choose based on your primary development environment:"
        echo ""
        echo "🏗️  **Cursor Custom Modes** if you:"
        echo "   - Use Cursor as your primary IDE"
        echo "   - Want specialized AI assistants for different tasks"
        echo "   - Prefer keyboard shortcuts for mode switching"
        echo "   - Want the most advanced Memory Bank integration"
        echo ""
        echo "🤖 **GitHub Copilot** if you:"
        echo "   - Use VS Code as your primary IDE"
        echo "   - Already have GitHub Copilot subscription"
        echo "   - Want enhanced code generation with project context"
        echo "   - Prefer repository-level custom instructions"
        echo ""
        echo "🏄 **Windsurf** if you:"
        echo "   - Use Windsurf IDE as your primary editor"
        echo "   - Want Cascade AI with persistent project context"
        echo "   - Prefer agentic AI development workflows"
        echo "   - Want rules-based AI behavior customization"
        echo ""
        echo "🚀 **All Integrations** if you:"
        echo "   - Use multiple IDEs in your workflow"
        echo "   - Want maximum compatibility and features"
        echo "   - Work on teams with different IDE preferences"
        echo "   - Want the complete Memory Bank experience"
        echo ""
        read -p "Would you like to run the setup now? (1=Cursor, 2=Copilot, 3=Windsurf, 4=All, n=No): " setup_choice
        
        case $setup_choice in
            1)
                echo "Setting up Cursor..."
                ./scripts/setup-cursor-memory-bank.sh
                ;;
            2)
                echo "Setting up GitHub Copilot..."
                ./scripts/setup-github-copilot.sh
                ;;
            3)
                echo "Setting up Windsurf..."
                ./scripts/setup-windsurf.sh
                ;;
            4)
                echo "Setting up all integrations..."
                ./scripts/setup-cursor-memory-bank.sh
                echo ""
                ./scripts/setup-github-copilot.sh
                echo ""
                ./scripts/setup-windsurf.sh
                ;;
            *)
                echo "Setup cancelled. Run this script again when ready."
                ;;
        esac
        ;;
    6)
        echo ""
        echo "🔧 Running validation checks..."
        echo ""
        if [ -f "./scripts/validate-cursor-setup.sh" ]; then
            echo "Checking Cursor setup..."
            ./scripts/validate-cursor-setup.sh
            echo ""
        fi
        if [ -f "./scripts/validate-github-copilot.sh" ]; then
            echo "Checking GitHub Copilot setup..."
            ./scripts/validate-github-copilot.sh
            echo ""
        fi
        if [ -f "./scripts/validate-windsurf.sh" ]; then
            echo "Checking Windsurf setup..."
            ./scripts/validate-windsurf.sh
            echo ""
        fi
        ;;
    *)
        echo "Invalid choice. Please run the script again and choose 1-6."
        exit 1
        ;;
esac

echo ""
echo "📚 Next Steps:"
echo "- Read README.md for complete documentation"
echo "- Check CURSOR-INTEGRATION.md for Cursor-specific features"
echo "- Check GITHUB-COPILOT-INTEGRATION.md for Copilot-specific features"
echo "- Check WINDSURF-INTEGRATION.md for Windsurf-specific features"
echo "- Run validation scripts to verify your setup" 