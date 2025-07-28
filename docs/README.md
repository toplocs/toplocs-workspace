# TopLocs Documentation

Welcome to the TopLocs ecosystem documentation. This documentation is organized into **two clear sections** to help you find what you need quickly.

## 📚 Documentation Structure

### 🎯 [Project Documentation](./project/)
**For understanding, setup, and getting oriented with TopLocs**

- **Architecture & Design** - How TopLocs works as a P2P system
- **Ecosystem Overview** - All repositories and their relationships
- **Workspace Setup** - Complete environment setup guide
- **AI Automation** - How AI orchestrates the multi-repository setup
- **Getting Started** - Orientation for new developers

### 🔧 [Development Documentation](./development/)
**For technical implementation and active development**

- **Plugin Development** - Creating plugins with Module Federation
- **Plugin SDK v1.1.0** - Latest SDK documentation and API reference
- **GunDB Developer Guide** - Data modeling and database patterns
- **Authentication Strategy** - Multi-layer authentication implementation
- **Debug Guide** - Debugging techniques and console commands
- **Debug Tools** - Implementation guides for monitoring tools

## 🎯 Quick Start

### I'm New to TopLocs
→ **Start with [Project Documentation](./project/)**
1. [Getting Started](./project/getting-started.md) - Get oriented
2. [Architecture](./project/architecture.md) - Understand the P2P design
3. [Workspace Setup](./project/workspace-setup.md) - Set up your environment

### I Want to Build Something
→ **Go to [Development Documentation](./development/)**
1. [Plugin SDK v1.1.0](./development/plugin-sdk-v1.1.0.md) - Start with the SDK
2. [Plugin Development](./development/plugin-development.md) - Build plugins
3. [Plugin Registry](./project/plugin-registry.md) - See existing plugins
4. [GunDB Guide](./development/gundb-guide.md) - Work with the database
5. [Debug Guide](./development/debug-guide.md) - Debug issues

### I Want to Understand the Workspace
→ **Check [Project Documentation](./project/)**
1. [Workspace Overview](./project/workspace-overview.md) - Understand the concept
2. [AI Setup Guide](./project/ai-setup-guide.md) - How AI orchestrates setup
3. [Automation](./project/automation.md) - GitHub Actions automation

## 🤔 What is TopLocs?

TopLocs is a **decentralized P2P community platform** built on Gun.js that enables:
- **User-owned data** through cryptographic keys
- **Real-time synchronization** across all peers
- **Offline-first functionality** with automatic sync
- **Plugin-based architecture** for extensibility
- **No central authority** - truly peer-to-peer

## 🤔 What is the "Workspace"?

The TopLocs **workspace** is a meta-repository that:
- **Orchestrates** 10+ repositories in the ecosystem
- **Provides AI context** for development across all repositories
- **Automates setup** of complex multi-repository environments
- **Centralizes documentation** while maintaining individual repository docs

Think of it as "mission control" for the entire TopLocs ecosystem.

## 📁 Complete Structure

```
docs/
├── README.md          # This overview (START HERE)
├── project/           # Project understanding & setup
│   ├── README.md               # Project docs navigation
│   ├── architecture.md         # P2P architecture & design
│   ├── ecosystem.md           # Repository relationships
│   ├── getting-started.md     # Quick orientation
│   ├── workspace-setup.md     # Complete setup guide
│   ├── ai-setup-guide.md      # AI automation explained
│   ├── workspace-overview.md  # Workspace concept
│   └── automation.md         # GitHub Actions automation
└── development/       # Technical development guides
    ├── README.md               # Development docs navigation
    ├── plugin-development.md  # Creating plugins
    ├── gundb-guide.md        # GunDB data modeling
    ├── debug-guide.md        # Debugging techniques
    └── debug-tools.md        # Debug tools implementation
```

## 📦 Latest Updates (July 2025)

### Plugin SDK v1.1.0 Released
- Standardized PluginInfoPage component for all plugins
- Enhanced TypeScript support with better type exports
- Built-in GitHub Pages deployment configuration
- Improved development environment with hot reload

### Plugin Status Updates
- **link-plugin**: Fully migrated to SDK 1.1.0 with info page
- **event-plugin**: Updated to SDK 1.1.0, chat functionality working
- **wiki-plugin**: TypeScript fixes in progress, temporary build workaround
- **All plugins**: Now deploy to GitHub Pages automatically

## 🔗 External Resources

- **Live Documentation**: https://toplocs.github.io/toplocs-workspace/
- **Main Repository**: https://github.com/toplocs/tribelike
- **Plugin SDK v1.1.0**: https://github.com/toplocs/plugin-sdk
- **Demo Plugin**: https://github.com/toplocs/demo-plugin
- **Plugin Examples**:
  - [Link Plugin](https://github.com/toplocs/link-plugin) - Best SDK example
  - [Event Plugin](https://github.com/toplocs/event-plugin) - Chat & events
  - [Wiki Plugin](https://github.com/toplocs/wiki-plugin) - Rich text editing

---

**Choose your path**: [Project Documentation](./project/) for understanding and setup, or [Development Documentation](./development/) for technical implementation.