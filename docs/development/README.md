# Development Documentation

This directory contains **technical development guides** for developers actively building with TopLocs.

## 📚 What's Here

### 🔧 Core Development
- **[Plugin Development](./plugin-development.md)** - Complete guide for creating plugins with Module Federation, SDK usage, and best practices
- **[GunDB Developer Guide](./gundb-guide.md)** - Comprehensive GunDB documentation covering data modeling, patterns, and TopLocs-specific implementations

### 🐛 Debugging & Troubleshooting
- **[Debug Guide](./debug-guide.md)** - Browser console commands and debugging techniques for TopLocs
- **[Debug Tools](./debug-tools.md)** - Implementation guide for debug tools and monitoring systems

## 🎯 Quick Navigation

### I Want to Build a Plugin
1. **[Plugin Development](./plugin-development.md)** - Start here
2. Use the Plugin Development SDK for modern development
3. Reference existing plugins for examples

### I'm Working with GunDB
1. **[GunDB Developer Guide](./gundb-guide.md)** - Comprehensive guide
2. Focus on data modeling patterns and best practices
3. Use TopLocs-specific examples and patterns

### I Have a Bug or Issue
1. **[Debug Guide](./debug-guide.md)** - Console commands and techniques
2. **[Debug Tools](./debug-tools.md)** - Advanced monitoring and debugging
3. Follow the systematic debugging approach

## 🔀 When to Use This vs Project Docs

### Use **Development Docs** (this directory) when:
- ✅ You're actively coding or building
- ✅ You need technical implementation details
- ✅ You're debugging issues
- ✅ You need API references or code examples

### Use **Project Docs** ([../project/](../project/)) when:
- ✅ You're new to TopLocs and need orientation
- ✅ You need to understand the architecture
- ✅ You're setting up the workspace
- ✅ You want to understand the ecosystem

## 📁 Documentation Structure

```
docs/
├── project/           # Project understanding & setup
│   ├── architecture.md         # P2P architecture & design
│   ├── ecosystem.md           # Repository relationships
│   ├── workspace-setup.md     # Complete setup guide
│   └── ...                   # Setup and understanding
└── development/       # Technical development guides (THIS DIRECTORY)
    ├── plugin-development.md  # Creating plugins
    ├── gundb-guide.md        # GunDB data modeling
    ├── debug-guide.md        # Debugging techniques
    └── debug-tools.md        # Debug tools implementation
```

## 🚀 Getting Started with Development

### First Time Setup
1. **[Project Setup](../project/workspace-setup.md)** - Set up your environment first
2. **[Architecture](../project/architecture.md)** - Understand the P2P design
3. **Come back here** for technical implementation guides

### Development Workflow
1. **Choose your development area**:
   - Plugin development → [Plugin Development](./plugin-development.md)
   - Data modeling → [GunDB Developer Guide](./gundb-guide.md)
   - Debugging → [Debug Guide](./debug-guide.md)
2. **Follow the technical guides** in this directory
3. **Use the existing codebase** as reference

---

*This directory focuses on technical implementation. For project setup and understanding, see [../project/](../project/).*