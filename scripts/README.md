# Memory Bank Scripts

This directory contains setup and validation scripts for Memory Bank integrations.

## 🚀 Quick Start

**New to Memory Bank?** Start here:

```bash
./scripts/setup-memory-bank.sh
```

This interactive script will help you choose the right integration for your workflow.

## 📁 Available Scripts

### Setup Scripts

| Script | Purpose | Use Case |
|--------|---------|----------|
| `setup-memory-bank.sh` | **Universal setup** | Interactive menu to choose integration |
| `setup-cursor-memory-bank.sh` | **Cursor integration** | Set up Memory Bank with Cursor custom modes |
| `setup-github-copilot.sh` | **GitHub Copilot integration** | Configure Memory Bank for GitHub Copilot |
| `setup-windsurf.sh` | **Windsurf integration** | Configure Memory Bank for Windsurf IDE |

### Validation Scripts

| Script | Purpose | Use Case |
|--------|---------|----------|
| `validate-cursor-setup.sh` | **Cursor validation** | Verify Cursor custom modes setup |
| `validate-github-copilot.sh` | **Copilot validation** | Verify GitHub Copilot integration |
| `validate-windsurf.sh` | **Windsurf validation** | Verify Windsurf IDE integration |

## 🎯 Integration Options

### 🏗️ Cursor Custom Modes
- **Best for**: Cursor IDE users
- **Features**: Specialized AI assistants, custom modes, keyboard shortcuts
- **Setup**: `./scripts/setup-cursor-memory-bank.sh`
- **Docs**: [CURSOR-INTEGRATION.md](../CURSOR-INTEGRATION.md)

### 🤖 GitHub Copilot
- **Best for**: VS Code users with Copilot subscription
- **Features**: Repository custom instructions, enhanced code generation
- **Setup**: `./scripts/setup-github-copilot.sh`
- **Docs**: [GITHUB-COPILOT-INTEGRATION.md](../GITHUB-COPILOT-INTEGRATION.md)

### 🏄 Windsurf IDE
- **Best for**: Windsurf IDE users
- **Features**: Cascade AI integration, rules-based behavior, agentic workflows
- **Setup**: `./scripts/setup-windsurf.sh`
- **Docs**: [WINDSURF-INTEGRATION.md](../WINDSURF-INTEGRATION.md)

### 🚀 All Integrations
- **Best for**: Multi-IDE workflows, teams with diverse preferences
- **Features**: Complete Memory Bank experience across all platforms
- **Setup**: Choose option 4 in `./scripts/setup-memory-bank.sh`

## 📋 Prerequisites

Before running any setup script:

1. **Git repository** (recommended)
2. **Memory Bank directory** will be created automatically
3. **Target IDE** installed and configured

## 🔧 Usage Examples

### First-time Setup
```bash
# Interactive setup with guidance
./scripts/setup-memory-bank.sh

# Direct setup for specific integration
./scripts/setup-cursor-memory-bank.sh
./scripts/setup-github-copilot.sh
./scripts/setup-windsurf.sh
```

### Validation and Troubleshooting
```bash
# Validate specific integration
./scripts/validate-cursor-setup.sh
./scripts/validate-github-copilot.sh
./scripts/validate-windsurf.sh

# Validate all integrations
./scripts/setup-memory-bank.sh  # Choose option 6
```

### Re-configuration
```bash
# Re-run setup to update configuration
./scripts/setup-memory-bank.sh

# Or run specific setup again
./scripts/setup-windsurf.sh
```

## 🗂️ What Gets Created

Each setup script creates:

### Common Files
- `memory-bank/` directory with core files
- `memory-bank/activeContext.md`
- `memory-bank/productContext.md`
- `memory-bank/progress.md`
- `memory-bank/decisionLog.md`
- `memory-bank/systemPatterns.md`

### Integration-Specific Files

**Cursor:**
- Custom mode configurations
- Cursor-specific patterns

**GitHub Copilot:**
- `.github/copilot-instructions.md`
- Sample workspace settings
- Custom prompt templates

**Windsurf:**
- `.windsurfrules` file
- `.windsurf/memory-bank-memories.md`
- Windsurf-specific patterns

## 🚦 Troubleshooting

### Common Issues

1. **Permission Errors**
   ```bash
   chmod +x scripts/*.sh
   ```

2. **Memory Bank Not Found**
   - Run universal setup first: `./scripts/setup-memory-bank.sh`
   - Or manually create `memory-bank/` directory

3. **Integration Not Working**
   - Run validation script for your integration
   - Check integration-specific documentation
   - Re-run setup script

### Getting Help

- **Universal Issues**: Check [README.md](../README.md)
- **Cursor Issues**: Check [CURSOR-INTEGRATION.md](../CURSOR-INTEGRATION.md)
- **Copilot Issues**: Check [GITHUB-COPILOT-INTEGRATION.md](../GITHUB-COPILOT-INTEGRATION.md)
- **Windsurf Issues**: Check [WINDSURF-INTEGRATION.md](../WINDSURF-INTEGRATION.md)

## 🤝 Contributing

Help improve Memory Bank scripts:

1. **Test scripts** on different systems
2. **Report issues** with specific error messages
3. **Suggest improvements** for setup processes
4. **Share usage patterns** that work well

## 📖 Further Reading

- [Memory Bank Overview](../README.md)
- [Developer Primer](../developer-primer.md)
- [Project Brief](../projectBrief.md)

---

Choose your integration and start building with persistent AI context! 🧠✨ 