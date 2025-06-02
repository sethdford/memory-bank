#!/bin/bash

# Memory Bank - Windsurf Setup Validation Script
# Validates Windsurf integration with Memory Bank

echo "🔍 Memory Bank - Windsurf Setup Validation"
echo "=========================================="

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
    print_status "warning" "Not in a git repository - Windsurf works best with git repos"
fi

# Check for .windsurfrules file
if [ -f ".windsurfrules" ]; then
    print_status "ok" ".windsurfrules file exists"
    
    # Check if it contains Memory Bank rules
    if grep -q "Memory Bank" .windsurfrules; then
        print_status "ok" ".windsurfrules contains Memory Bank integration rules"
    else
        print_status "warning" ".windsurfrules exists but doesn't contain Memory Bank rules"
    fi
    
    # Check for key trigger commands
    if grep -q "Update Memory Bank" .windsurfrules; then
        print_status "ok" "Trigger commands configured in .windsurfrules"
    else
        print_status "warning" "Trigger commands not found in .windsurfrules"
    fi
else
    print_status "error" ".windsurfrules file not found"
    echo "   Run: ./scripts/setup-windsurf.sh to create it"
fi

# Check Memory Bank directory structure
if [ -d "memory-bank" ]; then
    print_status "ok" "memory-bank/ directory exists"
    
    # Check for core Memory Bank files
    core_files=("activeContext.md" "productContext.md" "progress.md" "decisionLog.md")
    for file in "${core_files[@]}"; do
        if [ -f "memory-bank/$file" ]; then
            print_status "ok" "memory-bank/$file exists"
        else
            print_status "error" "memory-bank/$file missing"
        fi
    done
    
    # Check for systemPatterns.md (optional but recommended)
    if [ -f "memory-bank/systemPatterns.md" ]; then
        print_status "ok" "memory-bank/systemPatterns.md exists"
        
        # Check if it contains Windsurf patterns
        if grep -q "Windsurf" memory-bank/systemPatterns.md; then
            print_status "ok" "Windsurf patterns documented in systemPatterns.md"
        else
            print_status "warning" "No Windsurf-specific patterns in systemPatterns.md"
        fi
    else
        print_status "warning" "memory-bank/systemPatterns.md not found (recommended)"
    fi
else
    print_status "error" "memory-bank/ directory not found"
    echo "   Run: ./scripts/setup-memory-bank.sh to initialize"
fi

# Check for Windsurf integration documentation
if [ -f "WINDSURF-INTEGRATION.md" ]; then
    print_status "ok" "WINDSURF-INTEGRATION.md documentation exists"
else
    print_status "warning" "WINDSURF-INTEGRATION.md documentation not found"
fi

# Check for .windsurf directory and memories
if [ -d ".windsurf" ]; then
    print_status "ok" ".windsurf/ directory exists"
    
    if [ -f ".windsurf/memory-bank-memories.md" ]; then
        print_status "ok" "Windsurf memories configuration exists"
    else
        print_status "warning" "Windsurf memories configuration not found"
    fi
else
    print_status "warning" ".windsurf/ directory not found (optional)"
fi

# Check file permissions
echo ""
echo "📁 Checking file permissions..."

if [ -d "memory-bank" ]; then
    if [ -w "memory-bank" ]; then
        print_status "ok" "memory-bank/ directory is writable"
    else
        print_status "error" "memory-bank/ directory is not writable"
    fi
    
    # Check individual file permissions
    for file in memory-bank/*.md; do
        if [ -f "$file" ]; then
            if [ -w "$file" ]; then
                print_status "ok" "$(basename "$file") is writable"
            else
                print_status "error" "$(basename "$file") is not writable"
            fi
        fi
    done
fi

# Check for common issues
echo ""
echo "🔧 Checking for common issues..."

# Check if .windsurfrules is in the correct location
if [ -f ".windsurfrules" ]; then
    # Check if it's in project root (current directory should be project root)
    if [ "$(pwd)" = "$(git rev-parse --show-toplevel 2>/dev/null || pwd)" ]; then
        print_status "ok" ".windsurfrules is in project root"
    else
        print_status "warning" ".windsurfrules may not be in project root"
    fi
fi

# Check for backup files
if [ -f ".windsurfrules.backup" ]; then
    print_status "ok" "Backup of previous .windsurfrules found"
fi

# Summary
echo ""
echo "📊 Validation Summary"
echo "===================="
echo "Errors: $errors"
echo "Warnings: $warnings"

if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo ""
    echo "🎉 Perfect! Your Windsurf + Memory Bank integration is fully configured!"
    echo ""
    echo "🚀 Ready to use:"
    echo "1. Open Windsurf and load your project"
    echo "2. Start a Cascade session"
    echo "3. Tell Cascade: 'Follow the protocol in your rules'"
    echo "4. Begin development with persistent context!"
elif [ $errors -eq 0 ]; then
    echo ""
    echo "✅ Good! Setup is functional with minor warnings."
    echo "Consider addressing warnings for optimal experience."
else
    echo ""
    echo "❌ Issues found that need attention."
    echo "Run ./scripts/setup-windsurf.sh to fix configuration issues."
fi

echo ""
echo "📚 For help:"
echo "- Read WINDSURF-INTEGRATION.md for complete guide"
echo "- Run ./scripts/setup-windsurf.sh to reconfigure"
echo "- Check Windsurf documentation at https://docs.windsurf.com"

exit $errors 