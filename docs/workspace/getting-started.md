# Getting Started with TopLocs Ecosystem

Welcome to TopLocs! This guide helps you set up the complete ecosystem in 30 seconds using AI automation, or manually if you prefer traditional setup.

## 🚀 Option 1: AI-Automated Setup (Recommended)

**Perfect for**: New team members, quick environment setup, AI-guided development

### Prerequisites
- **Git** with SSH keys configured for GitHub
- **Claude Code** (recommended) or any AI assistant that can execute commands
- **Node.js** >= 20 (for development after setup)
- **pnpm** >= 8 (recommended) or npm

### Setup Steps

1. **Clone the workspace**:
   ```bash
   git clone git@github.com:toplocs/toplocs-workspace.git toplocs
   cd toplocs
   ```

2. **Start AI assistance**:
   ```bash
   claude  # or your preferred AI assistant
   ```

3. **Use the setup prompt**:
   ```
   I just cloned the toplocs-workspace repository. Please help me set up the complete TopLocs ecosystem by:

   1. Reading the documentation in this workspace (docs/ and CLAUDE.md)
   2. Cloning all required repositories from the toplocs GitHub organization
   3. Setting up the development environment
   4. Providing comprehensive context for AI-assisted development

   I want to work on: [describe your goals - core platform, plugins, mobile, etc.]
   ```

4. **AI handles everything automatically**:
   - ✅ Reads workspace documentation and context
   - ✅ Clones all ecosystem repositories
   - ✅ Sets up development environments
   - ✅ Provides ecosystem context and guidance
   - ✅ Guides you to your specific development goals

## ⚡ Option 2: Quick Manual Setup

**Perfect for**: Experienced developers, specific repository focus, offline setup

### Prerequisites
- **Git** with SSH keys configured for GitHub
- **Node.js** >= 20
- **pnpm** >= 8 (recommended) or npm

### Setup Commands

Copy and paste these commands to clone the complete ecosystem:

```bash
# Create workspace and navigate
git clone git@github.com:toplocs/toplocs-workspace.git toplocs
cd toplocs

# Core Platform (Start Here)
git clone git@github.com:toplocs/tribelike.git
git clone git@github.com:toplocs/locations.git

# Plugin Ecosystem
git clone git@github.com:toplocs/event-plugin.git
git clone git@github.com:toplocs/wiki-plugin.git
git clone git@github.com:toplocs/location-plugin.git
git clone git@github.com:toplocs/link-plugin.git
git clone git@github.com:toplocs/demo-plugin.git

# Development Tools & Documentation
git clone git@github.com:toplocs/tribelike.wiki.git

```

### Quick Start Development

After cloning, immediately start developing:

```bash
# Core Platform Development
cd tribelike && pnpm install && pnpm dev
# Opens http://localhost:3000

# Plugin Development
cd demo-plugin && pnpm install && pnpm dev
# Plugin development environment

# Mobile Development
cd locations && npm install && npm run dev
# Mobile web development
```

## 📁 Expected Result

After setup, your folder structure will be:

```
toplocs/ (workspace managed by toplocs-workspace repository)
├── 📋 Workspace Management
│   ├── README.md           # Quick start guide
│   ├── CLAUDE.md          # AI development context
│   └── docs/              # 📚 Centralized documentation hub
│       ├── README.md      # Documentation navigation
│       ├── project/       # Core platform architecture & ecosystem
│       ├── development/   # Plugin development & debugging guides  
│       ├── workspace/     # Workspace setup & management
│       └── automation/    # GitHub Actions & AI system docs
│
├── 🏛️ Core Platform (AI-cloned repositories)
│   ├── tribelike/         # ⭐ Main P2P community platform
│   ├── locations/         # Mobile app (Ionic + Vue.js)
│   └── tribelike.wiki/    # Project wiki & documentation
│
├── 🔌 Plugin Ecosystem
│   ├── event-plugin/      # Real-time chat & event management
│   ├── wiki-plugin/       # Collaborative knowledge sharing
│   ├── location-plugin/   # Location management & mapping
│   ├── link-plugin/       # Link sharing & bookmarking
│   └── demo-plugin/       # Plugin development framework
│
```

## 🎯 What to Do Next

After AI setup, you can immediately start working:

### Core Platform Development
```bash
cd tribelike
pnpm install && pnpm dev
# Opens http://localhost:3000
```

### Plugin Development
```bash
cd demo-plugin
pnpm install && pnpm dev
# Plugin development environment
```

### Mobile App Development
```bash
cd locations
npm install && npm run dev
# Web development, or ionic cap run ios
```

## 🤖 AI-First Development Workflow

### Daily Development Pattern
1. **Start from workspace**: `cd toplocs && claude`
2. **Ask AI for guidance**: Claude has full ecosystem context
3. **Navigate to specific repo**: AI will guide you based on your goals
4. **Cross-repo coordination**: AI understands dependencies and patterns

### Example AI Interactions

**"I want to add a new plugin"**
→ AI guides you through demo-plugin template and Module Federation setup

**"I need to modify the authentication system"**
→ AI coordinates changes between tribelike core and affected plugins

**"I want to integrate mobile with core platform"**
→ AI helps bridge locations app with tribelike's Gun.js data layer

## 🏗️ Understanding the Architecture

TopLocs is a **decentralized P2P community platform**:

### Core Principles
- **No Central Server**: Data distributed across peers
- **User-Owned Data**: Cryptographic keys ensure user control
- **Offline-First**: Works without internet connectivity
- **Plugin-Based**: Extensible through Module Federation
- **Real-Time Sync**: Changes propagate instantly between peers

### Technology Stack
- **P2P Database**: Gun.js for real-time data sync
- **Frontend**: Vue.js 3 + TypeScript
- **Authentication**: WebAuthn/Passkeys + Gun SEA
- **Plugins**: Module Federation for dynamic loading
- **Mobile**: Ionic + Capacitor

## 📚 Centralized Documentation Hub

All documentation is now centralized in the workspace for better organization and maintenance:

### Documentation Structure
```
docs/
├── README.md           # 📋 Navigation and overview
├── project/            # 🏗️ Core platform architecture
│   ├── architecture.md # P2P platform technical details
│   └── ecosystem.md    # Repository relationships
├── development/        # 🛠️ Development guides
│   ├── plugin-development.md
│   ├── debug-guide.md
│   └── debug-tools.md
├── workspace/          # 📋 Workspace management
│   ├── getting-started.md (this file)
│   ├── ai-setup-guide.md
│   └── toplocs-workspace-overview.md
└── automation/         # 🤖 AI system documentation
    └── automated-context-updates.md
```

### Key Documentation
- **[📚 Documentation Hub](../README.md)** - Start here for navigation
- **[🏗️ Architecture](../project/architecture.md)** - Technical platform details
- **[🌐 Ecosystem](../project/ecosystem.md)** - Repository relationships
- **[🔌 Plugin Development](../development/plugin-development.md)** - Create plugins
- **[🤖 AI Context](../../CLAUDE.md)** - Comprehensive development context

### Benefits of Centralized Docs
- **Always Current**: Automatically synchronized with repository changes
- **Single Source**: No more hunting across multiple repositories
- **AI Enhanced**: Claude understands the complete documentation structure
- **Team Shared**: Version controlled and accessible to all developers

## 🔧 Manual Setup (If Needed)

If you prefer manual setup, here are the repositories to clone:

```bash
# Core Platform
git clone git@github.com:toplocs/tribelike.git
git clone git@github.com:toplocs/locations.git
git clone git@github.com:toplocs/tribelike.wiki.git

# Plugin Ecosystem  
git clone git@github.com:toplocs/event-plugin.git
git clone git@github.com:toplocs/wiki-plugin.git
git clone git@github.com:toplocs/location-plugin.git
git clone git@github.com:toplocs/link-plugin.git

# Development Tools
git clone git@github.com:toplocs/demo-plugin.git

```

## 🤝 Team Collaboration Benefits

This workspace approach provides:

1. **Consistent Setup**: Every team member gets identical environment
2. **AI Context Sharing**: Shared AI development guidance
3. **Version Controlled Coordination**: Workspace changes tracked in git
4. **Simplified Onboarding**: New developers productive in minutes
5. **Cross-Repo Coordination**: AI understands ecosystem dependencies

## 🆘 Troubleshooting

### AI Setup Issues
- **Missing repositories**: AI will clone them automatically
- **Permission errors**: Ensure SSH keys are configured for GitHub
- **Network issues**: Check internet connection and GitHub access

### Development Issues
- **Node.js version**: Ensure >= 20 for all repositories
- **Package manager**: Prefer pnpm for tribelike, npm for locations
- **Port conflicts**: Default ports: 3000 (tribelike), various for plugins

### Getting Help
- **AI assistance**: Claude has full ecosystem context - just ask!
- **Documentation**: Check tribelike/docs/ for detailed guides
- **GitHub Issues**: Each repository has its own issue tracker

## 🎉 Welcome to TopLocs!

You're now ready to contribute to a cutting-edge decentralized community platform! The AI-driven setup ensures you can focus on building innovative features rather than complex environment configuration.

**Key advantages of this approach:**
- ⚡ **Instant productivity**: No manual setup complexity
- 🧠 **AI-guided development**: Comprehensive ecosystem understanding
- 🤝 **Team consistency**: Everyone has the same powerful environment
- 🚀 **Focus on innovation**: Build the future of decentralized communities

---

*Ready to build? Use the AI setup prompt and start creating! 🚀*