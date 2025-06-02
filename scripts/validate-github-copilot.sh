#!/bin/bash

# Memory Bank - GitHub Copilot Setup Validation Script
# Validates GitHub Copilot integration with Memory Bank

echo "🔍 Memory Bank - GitHub Copilot Setup Validation"
echo "================================================"

errors=0
warnings=0

# Function to print status
print_status() {
    local status=$1
    local message=$2
    case $status in
        "ok")
            echo "✅ $message"
            ;;
        "warning")
            echo "⚠️  $message"
            ((warnings++))
            ;;
        "error")
            echo "❌ $message"
            ((errors++))
            ;;
    esac
}

# Check if we're in a git repository
if [ -d ".git" ]; then
    print_status "ok" "Git repository detected"
else
    print_status "warning" "Not in a git repository - GitHub Copilot works best with git repos"
fi

# Check memory-bank directory
if [ -d "memory-bank" ]; then
    print_status "ok" "memory-bank directory exists"
    
    # Check for required files
    required_files=("activeContext.md" "productContext.md" "progress.md" "decisionLog.md")
    
    for file in "${required_files[@]}"; do
        if [ -f "memory-bank/$file" ]; then
            print_status "ok" "memory-bank/$file exists"
            
            # Check if file has content
            if [ -s "memory-bank/$file" ]; then
                print_status "ok" "memory-bank/$file has content"
            else
                print_status "warning" "memory-bank/$file is empty"
            fi
        else
            print_status "error" "memory-bank/$file missing"
        fi
    done
    
    # Check for optional systemPatterns.md
    if [ -f "memory-bank/systemPatterns.md" ]; then
        print_status "ok" "memory-bank/systemPatterns.md exists"
    else
        print_status "warning" "memory-bank/systemPatterns.md missing (recommended)"
    fi
else
    print_status "error" "memory-bank directory missing - run setup script first"
fi

# Check .github directory
if [ -d ".github" ]; then
    print_status "ok" ".github directory exists"
else
    print_status "error" ".github directory missing - run setup script first"
fi

# Check copilot-instructions.md
if [ -f ".github/copilot-instructions.md" ]; then
    print_status "ok" ".github/copilot-instructions.md exists"
    
    # Check for required content
    if grep -q "Memory Bank Integration" .github/copilot-instructions.md; then
        print_status "ok" "Copilot instructions contain Memory Bank integration"
    else
        print_status "error" "Copilot instructions missing Memory Bank content"
    fi
    
    # Check for memory bank file references
    memory_bank_refs=("productContext.md" "activeContext.md" "decisionLog.md" "progress.md")
    for ref in "${memory_bank_refs[@]}"; do
        if grep -q "$ref" .github/copilot-instructions.md; then
            print_status "ok" "References $ref in instructions"
        else
            print_status "warning" "Missing reference to $ref in instructions"
        fi
    done
else
    print_status "error" ".github/copilot-instructions.md missing - run setup script first"
fi

# Check .vscode directory
if [ -d ".vscode" ]; then
    print_status "ok" ".vscode directory exists"
else
    print_status "warning" ".vscode directory missing - workspace settings not configured"
fi

# Check VS Code settings
settings_configured=false
if [ -f ".vscode/settings.json" ]; then
    print_status "ok" ".vscode/settings.json exists"
    
    # Check for Copilot configuration
    if grep -q "github.copilot" .vscode/settings.json; then
        print_status "ok" "GitHub Copilot settings found"
        settings_configured=true
        
        # Check specific configurations
        if grep -q "codeGeneration.instructions" .vscode/settings.json; then
            print_status "ok" "Code generation instructions configured"
        else
            print_status "warning" "Code generation instructions missing"
        fi
        
        if grep -q "commitMessageGeneration.instructions" .vscode/settings.json; then
            print_status "ok" "Commit message generation configured"
        else
            print_status "warning" "Commit message generation not configured"
        fi
        
        if grep -q "memory-bank/" .vscode/settings.json; then
            print_status "ok" "Memory Bank files referenced in settings"
        else
            print_status "warning" "Memory Bank files not referenced in settings"
        fi
    else
        print_status "warning" "GitHub Copilot settings not found in settings.json"
    fi
elif [ -f ".vscode/copilot-settings.json" ]; then
    print_status "warning" "Found .vscode/copilot-settings.json - merge into settings.json"
    settings_configured=true
else
    print_status "warning" "VS Code settings not configured for Copilot"
fi

# Check sample prompts
if [ -d ".github/prompts" ]; then
    print_status "ok" ".github/prompts directory exists"
    
    # Check for sample prompt files
    if [ -f ".github/prompts/api-endpoint.prompt.md" ]; then
        print_status "ok" "API endpoint prompt template exists"
    else
        print_status "warning" "API endpoint prompt template missing"
    fi
    
    if [ -f ".github/prompts/component.prompt.md" ]; then
        print_status "ok" "Component prompt template exists"
    else
        print_status "warning" "Component prompt template missing"
    fi
else
    print_status "warning" ".github/prompts directory missing - no sample prompts"
fi

# Check integration documentation
if [ -f ".github/COPILOT-MEMORY-BANK.md" ]; then
    print_status "ok" "Integration documentation exists"
else
    print_status "warning" "Integration documentation missing"
fi

# Check if backup files exist (indicates successful setup)
if [ -f ".github/copilot-instructions.md.backup" ]; then
    print_status "ok" "Backup of original copilot instructions created"
fi

if [ -f ".vscode/settings.json.backup" ]; then
    print_status "ok" "Backup of original VS Code settings created"
fi

# Validate JSON syntax in settings
if [ -f ".vscode/settings.json" ]; then
    if python3 -m json.tool .vscode/settings.json > /dev/null 2>&1; then
        print_status "ok" ".vscode/settings.json is valid JSON"
    elif command -v jq >/dev/null 2>&1; then
        if jq empty .vscode/settings.json > /dev/null 2>&1; then
            print_status "ok" ".vscode/settings.json is valid JSON"
        else
            print_status "error" ".vscode/settings.json has invalid JSON syntax"
        fi
    else
        print_status "warning" "Cannot validate JSON syntax - install python3 or jq"
    fi
fi

echo ""
echo "📊 Validation Summary"
echo "===================="

if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo "🎉 Perfect! Your GitHub Copilot + Memory Bank integration is complete and ready to use!"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Ensure GitHub Copilot extension is installed in VS Code"
    echo "2. Verify you have an active GitHub Copilot subscription"
    echo "3. Reload VS Code to apply new settings"
    echo "4. Test with a prompt like: 'Create a component following memory-bank/systemPatterns.md'"
elif [ $errors -eq 0 ]; then
    echo "✅ Setup looks good with $warnings minor warning(s)"
    echo "You can proceed with using GitHub Copilot + Memory Bank"
    echo ""
    if [ "$settings_configured" = false ]; then
        echo "💡 Consider configuring VS Code settings for enhanced integration"
    fi
else
    echo "❌ Found $errors error(s) and $warnings warning(s)"
    echo ""
    echo "🔧 Troubleshooting:"
    if [ $errors -gt 0 ]; then
        echo "- Run ./scripts/setup-github-copilot.sh to fix missing files"
        echo "- Ensure you're in the correct project directory"
        echo "- Initialize Memory Bank first if not already done"
    fi
fi

echo ""
echo "💡 Additional Checks:"
echo "- Ensure GitHub Copilot extension is installed and enabled in VS Code"
echo "- Verify your GitHub Copilot subscription is active"
echo "- Test prompts that reference Memory Bank files explicitly"
echo "- Check VS Code output panel for any Copilot errors"

if [ $warnings -gt 0 ]; then
    echo ""
    echo "⚠️  Warnings can be safely ignored but may impact integration quality"
fi 