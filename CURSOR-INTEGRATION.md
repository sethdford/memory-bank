# 🧠 Roo Code Memory Bank + Cursor Custom Modes

**Revolutionary AI-Assisted Development with Persistent Context**

This integration brings the powerful Roo Code Memory Bank system to Cursor's new custom mode feature, providing seamless persistent context across development sessions with specialized AI assistants for different development tasks.

## 🎯 What This Integration Provides

### ✨ Specialized AI Assistants
- **🏗️ Memory Bank Architect** - System design and initialization
- **💻 Memory Bank Code** - Implementation with full context
- **❓ Memory Bank Ask** - Information and guidance
- **🐛 Memory Bank Debug** - Context-aware troubleshooting
- **🔄 Memory Bank Update** - Comprehensive session sync

### 🔄 Persistent Context System
- **Automatic Context Loading** - Each mode reads memory bank files for complete project understanding
- **Real-time Updates** - Memory bank files update as you work
- **Session Continuity** - Perfect context preservation across Cursor sessions
- **Mode-Specific Behaviors** - Each mode has specialized tools and capabilities

## 🚀 Quick Setup

### Prerequisites
- **Cursor Version**: 0.48+ required
- **Custom Modes**: Must be enabled in Settings → Features → Chat → Custom modes

### Installation

1. **Clone and Setup**
   ```bash
   git clone https://github.com/GreatScottyMac/roo-code-memory-bank.git
   cd roo-code-memory-bank
   ./setup-cursor-memory-bank.sh
   ```

2. **Verify Installation**
   - Open Cursor
   - Check mode picker for new Memory Bank modes
   - Verify keyboard shortcuts work

## 🎮 Custom Modes Guide

### 🏗️ Memory Bank Architect Mode (`⌘⇧A`)
**Purpose**: System design and Memory Bank initialization

**Tools Available**:
- ✅ Codebase search
- ✅ Read files  
- ✅ Search tools
- ❌ File editing (markdown only)
- ❌ Terminal access

**Use When**:
- Starting new projects
- Designing system architecture  
- Making architectural decisions
- Initializing Memory Bank
- Updating documentation

**Key Features**:
- Automatically checks for memory-bank/ directory
- Creates complete Memory Bank structure if missing
- Updates decision logs and system patterns
- Focuses on high-level design decisions

### 💻 Memory Bank Code Mode (`⌘⇧C`)
**Purpose**: Implementation and coding with full context

**Tools Available**:
- ✅ Codebase search
- ✅ Read files
- ✅ Edit files
- ✅ Search tools
- ✅ Terminal access

**Use When**:
- Writing code
- Implementing features
- Refactoring
- Making code changes
- Testing implementations

**Key Features**:
- Automatically loads ALL memory bank files at session start
- Updates memory bank files as work progresses
- Maintains context of recent changes and decisions
- Full development environment access

### ❓ Memory Bank Ask Mode (`⌘⇧?`)
**Purpose**: Information and guidance with project context

**Tools Available**:
- ✅ Codebase search
- ✅ Read files
- ✅ Search tools
- ✅ Web search
- ❌ File editing
- ❌ Terminal access

**Use When**:
- Asking questions about the codebase
- Seeking guidance on implementation
- Understanding existing code
- Getting explanations
- Research and documentation help

**Key Features**:
- Read-only access prevents accidental changes
- Full project context awareness
- Web search for external information
- Recommends appropriate modes for different tasks

### 🐛 Memory Bank Debug Mode (`⌘⇧D`)
**Purpose**: Troubleshooting with persistent context

**Tools Available**:
- ✅ Codebase search
- ✅ Read files
- ✅ Search tools
- ✅ Terminal access
- ❌ File editing

**Use When**:
- Debugging issues
- Investigating problems
- Analyzing errors
- System troubleshooting
- Performance investigation

**Key Features**:
- Contextual debugging using project history
- Terminal access for investigation
- References decision log for architectural context
- Recommends Code mode for implementing fixes

### 🔄 Memory Bank Update Mode (`⌘⇧U`)
**Purpose**: Comprehensive memory bank synchronization

**Tools Available**:
- ✅ Codebase search
- ✅ Read files
- ✅ Edit files
- ✅ Search tools

**Use When**:
- End of coding sessions
- Before major context switches
- When memory bank needs synchronization
- Preparing for session handoffs

**Key Features**:
- Reviews complete chat history
- Updates all relevant memory bank files
- Ensures consistency across all modes
- Prepares perfect context for next session

## 📁 Memory Bank File Structure

```
memory-bank/
├── activeContext.md     # Current session state
├── productContext.md    # Project overview and architecture  
├── progress.md          # Task tracking and milestones
├── decisionLog.md       # Architectural decisions
└── systemPatterns.md    # Coding patterns and standards
```

## 🔄 Workflow Examples

### Starting a New Project
1. **🏗️ Architect Mode**: Initialize Memory Bank and design system
2. **💻 Code Mode**: Implement initial structure
3. **❓ Ask Mode**: Research best practices
4. **🔄 Update Mode**: Sync all progress

### Daily Development Session
1. **💻 Code Mode**: Load context and begin implementation
2. **🐛 Debug Mode**: Investigate any issues
3. **❓ Ask Mode**: Get guidance when needed
4. **🔄 Update Mode**: Sync session progress

### Architecture Review
1. **🏗️ Architect Mode**: Review and update system design
2. **❓ Ask Mode**: Research architectural patterns
3. **💻 Code Mode**: Implement architectural changes
4. **🔄 Update Mode**: Document decisions

## 💡 Pro Tips

### Context Management
- **Always start sessions** in Code mode to load full context
- **Use Update mode** before ending sessions
- **Switch modes** based on task type for optimal tool access
- **Read memory bank files** manually when context seems stale

### Mode Switching Strategy
- **Architect → Code**: After design decisions, implement them
- **Code → Debug**: When encountering issues
- **Debug → Code**: After identifying fixes
- **Any Mode → Update**: Before ending sessions

### Memory Bank Maintenance
- **Keep files concise** but comprehensive
- **Use timestamps** for all updates
- **Update regularly** during long sessions
- **Review periodically** for outdated information

## 🔧 Troubleshooting

### Custom Modes Not Appearing
1. Verify Cursor version (0.48+)
2. Enable custom modes in Settings → Features → Chat
3. Check `.cursor/modes.json` exists and is valid
4. Restart Cursor

### Memory Bank Not Loading
1. Verify `memory-bank/` directory exists
2. Check file permissions
3. Ensure `.cursor/rules/` directory exists
4. Try Architect mode to reinitialize

### Context Not Persisting
1. Use Update mode before ending sessions
2. Check memory bank files are being updated
3. Verify timestamp formats are correct
4. Ensure proper mode usage

## 🆚 Comparison with Original Roo Code

| Feature | Original Roo Code | Cursor Custom Modes |
|---------|------------------|-------------------|
| **Context Persistence** | ✅ Full | ✅ Enhanced |
| **Mode Switching** | ✅ Manual | ✅ Automatic + Shortcuts |
| **Tool Access Control** | ❌ Limited | ✅ Mode-specific |
| **Session Management** | ✅ Good | ✅ Superior |
| **Integration** | ✅ VS Code only | ✅ Native Cursor |
| **Workflow Efficiency** | ✅ High | ✅ Exceptional |

## 🤝 Contributing

This integration builds on the excellent foundation of the original Roo Code Memory Bank system. Contributions are welcome for:

- Additional custom modes
- Enhanced memory bank templates
- Improved workflow patterns
- Better documentation

## 📚 Further Reading

- [Original Roo Code Memory Bank](README.md)
- [Developer Primer](developer-primer.md)
- [Cursor Custom Modes Documentation](https://docs.cursor.com/chat/custom-modes)
- [Project Brief](projectBrief.md)

---

**Ready to revolutionize your AI-assisted development workflow?** 

Start with `./setup-cursor-memory-bank.sh` and experience persistent context like never before! 🚀 