#!/bin/bash

# Memory Bank - Cursor Setup Validation Script
# Helps troubleshoot Cursor custom modes integration

echo "🔍 Memory Bank - Cursor Setup Validation"
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

# Check .cursor directory
if [ -d ".cursor" ]; then
    print_status "ok" ".cursor directory exists"
else
    print_status "error" ".cursor directory missing - run setup script first"
fi

# Check modes.json
if [ -f ".cursor/modes.json" ]; then
    print_status "ok" ".cursor/modes.json exists"
    
    # Validate JSON syntax
    if python3 -m json.tool .cursor/modes.json > /dev/null 2>&1; then
        print_status "ok" ".cursor/modes.json is valid JSON"
    else
        print_status "error" ".cursor/modes.json has invalid JSON syntax"
    fi
    
    # Check for required modes
    if grep -q "memory-bank-architect" .cursor/modes.json; then
        print_status "ok" "Memory Bank Architect mode found"
    else
        print_status "error" "Memory Bank Architect mode missing"
    fi
    
    if grep -q "memory-bank-code" .cursor/modes.json; then
        print_status "ok" "Memory Bank Code mode found"  
    else
        print_status "error" "Memory Bank Code mode missing"
    fi
    
    if grep -q "memory-bank-ask" .cursor/modes.json; then
        print_status "ok" "Memory Bank Ask mode found"
    else
        print_status "error" "Memory Bank Ask mode missing"
    fi
    
    if grep -q "memory-bank-debug" .cursor/modes.json; then
        print_status "ok" "Memory Bank Debug mode found"
    else
        print_status "error" "Memory Bank Debug mode missing"
    fi
    
    if grep -q "memory-bank-update" .cursor/modes.json; then
        print_status "ok" "Memory Bank Update mode found"
    else
        print_status "error" "Memory Bank Update mode missing"
    fi
else
    print_status "error" ".cursor/modes.json missing - run setup script first"
fi

# Check rules directory
if [ -d ".cursor/rules" ]; then
    print_status "ok" ".cursor/rules directory exists"
else
    print_status "error" ".cursor/rules directory missing - run setup script first"
fi

# Check memory bank initialization rule
if [ -f ".cursor/rules/memory-bank-initialization.mdc" ]; then
    print_status "ok" "Memory bank initialization rule exists"
    
    # Check for required frontmatter
    if head -n 10 .cursor/rules/memory-bank-initialization.mdc | grep -q "description:"; then
        print_status "ok" "Rule has description field"
    else
        print_status "warning" "Rule missing description field"
    fi
    
    if head -n 10 .cursor/rules/memory-bank-initialization.mdc | grep -q "alwaysApply:"; then
        print_status "ok" "Rule has alwaysApply field"
    else
        print_status "warning" "Rule missing alwaysApply field"
    fi
else
    print_status "error" "Memory bank initialization rule missing"
fi

# Check memory-bank directory
if [ -d "memory-bank" ]; then
    print_status "ok" "memory-bank directory exists"
    
    # Check for required files
    required_files=("activeContext.md" "productContext.md" "progress.md" "decisionLog.md" "systemPatterns.md")
    
    for file in "${required_files[@]}"; do
        if [ -f "memory-bank/$file" ]; then
            print_status "ok" "memory-bank/$file exists"
        else
            print_status "error" "memory-bank/$file missing"
        fi
    done
else
    print_status "error" "memory-bank directory missing - run setup script first"
fi

# Check if backup was created
if [ -f ".cursor/modes.json.backup" ]; then
    print_status "ok" "Backup of original modes.json created"
fi

echo ""
echo "📊 Validation Summary"
echo "===================="

if [ $errors -eq 0 ] && [ $warnings -eq 0 ]; then
    echo "🎉 Perfect! Your Cursor Memory Bank setup is complete and ready to use!"
    echo ""
    echo "🚀 Next Steps:"
    echo "1. Open Cursor and navigate to this project"
    echo "2. Enable custom modes: Settings → Features → Chat → Custom modes"
    echo "3. Look for Memory Bank modes in your mode picker"
    echo "4. Start with 🏗️ Memory Bank Architect mode!"
elif [ $errors -eq 0 ]; then
    echo "✅ Setup looks good with $warnings minor warning(s)"
    echo "You can proceed with using the Memory Bank modes"
else
    echo "❌ Found $errors error(s) and $warnings warning(s)"
    echo ""
    echo "🔧 Troubleshooting:"
    if [ $errors -gt 0 ]; then
        echo "- Run ./setup-cursor-memory-bank.sh to fix missing files"
        echo "- Ensure you're in the correct project directory"
        echo "- Check file permissions if errors persist"
    fi
fi

echo ""
echo "💡 Additional Checks:"
echo "- Ensure Cursor version 0.48+ is installed"
echo "- Verify custom modes are enabled in Cursor settings"
echo "- Restart Cursor if modes don't appear immediately" 