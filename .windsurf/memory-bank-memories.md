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
