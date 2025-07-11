# TopLocs Documentation Update Context

## Current Documentation State

### CLAUDE.md
```markdown
# TopLocs Workspace - Claude Code Context

This is the **toplocs-workspace** repository that orchestrates the entire TopLocs ecosystem setup and provides AI development context.

## 🚀 AI-Driven Setup Workflow

### For New Developers
1. **Clone this workspace**: `git clone git@github.com:toplocs/toplocs-workspace.git toplocs`
2. **Run Claude Code**: `cd toplocs && claude`
3. **Use the setup prompt**: Tell Claude to set up the complete ecosystem

### Auto-Setup Prompt
```
I just cloned the toplocs-workspace repository. Please help me set up the complete TopLocs ecosystem by:

1. Reading the documentation in this workspace
2. Cloning all required repositories from the toplocs GitHub organization
3. Setting up the development environment
4. Providing me with comprehensive context for AI-assisted development

I want to work on: [describe your goals - core platform, plugins, mobile, etc.]
```

## 📁 Repository Structure (After Setup)

```
toplocs/ (this workspace repository)
├── README.md            # Getting started guide
├── CLAUDE.md           # AI context (this file)
├── docs/               # Ecosystem documentation
├── docusaurus/         # 📚 Centralized documentation site
│
# Auto-cloned repositories (in .gitignore):
├── tribelike/          # ⭐ Core P2P platform
├── locations/          # Mobile app (Ionic)
├── event-plugin/       # Chat & events plugin
├── wiki-plugin/        # Wiki plugin
├── location-plugin/    # Location plugin
├── link-plugin/        # Link sharing plugin
├── demo-plugin/        # Plugin development template
├── plugin-dev-sdk/     # 🚀 Plugin Development SDK
└── tribelike.wiki/     # Project wiki
```

## 🤖 AI Development Workflow

### 1. Ecosystem Setup (One-time)
```bash
cd toplocs && claude
# Use the auto-setup prompt above
```

### 2. Daily Development
```bash
cd toplocs && claude
# Claude will have context for the entire ecosystem
# Navigate to specific repos as needed
```

### 3. Cross-Repository Work
- **This workspace** provides ecosystem overview and coordination
- **Individual repositories** contain specific implementation details
- **AI can work across repositories** with full ecosystem understanding

## 🏗️ Ecosystem Architecture

TopLocs is a **decentralized P2P community platform** built on Gun.js:

### Core Technologies
- **P2P Database**: Gun.js for real-time data sync
- **Frontend**: Vue.js 3 + TypeScript
- **Authentication**: WebAuthn/Passkeys + Gun SEA
- **Plugins**: Module Federation for dynamic loading
- **Mobile**: Ionic + Capacitor

### Repository Categories
- **🏛️ Core**: tribelike (main platform), locations (mobile)
- **🔌 Plugins**: All `*-plugin` repositories
- **🛠️ Tools**: plugin-dev-sdk (development SDK), demo-plugin (template)

## 📚 Documentation Strategy

### Centralized Documentation Hub
**🌐 Live Site**: https://toplocs.github.io/toplocs-workspace/

The `docusaurus/` folder contains our unified documentation site that aggregates all TopLocs documentation:
- **Multi-source**: Pulls docs from workspace, tribelike, and plugin repositories
- **Searchable**: Full-text search across all documentation
- **Auto-deployed**: GitHub Actions deploys on every push to main
- **Local development**: `cd docusaurus && pnpm start`

[Learn more about the documentation system →](./docusaurus/README.md)

### Workspace-Level Documentation (This Repository)
- **Setup automation**: AI-driven ecosystem setup
- **Architecture overview**: High-level ecosystem understanding
- **Project coordination**: Roadmap and team coordination

### Repository-Specific Documentation
- **Individual READMEs**: Repository-specific context and setup
- **Repository CLAUDE.md files**: Repository-specific AI context
- **Implementation guides**: Repository-specific technical details

## 🎯 Development Scenarios

### Scenario 1: Core Platform Development
```bash
# Claude reads workspace context, then focuses on tribelike/
cd tribelike
pnpm dev
```

**📖 Tribelike-Specific Resources:**
- **[Tribelike Development Guide](./tribelike/docs/DEVELOPMENT.md)** - Technical details, data architecture, Gun.js patterns, and development workflows
- **[Tribelike README](./tribelike/README.md)** - Repository overview and quick setup

### Scenario 2: Plugin Development
```bash
# Modern approach with Plugin Development SDK
npm install git+https://github.com/toplocs/plugin-dev-sdk.git
# Set up your plugin with SDK

# Alternative: Use demo-plugin as template
cd demo-plugin  # Use as template
cd [your-plugin] # Work on specific plugin
```

### Scenario 3: Cross-Ecosystem Features
```bash
# Claude coordinates changes across multiple repositories
# Understanding shared data layer (Gun.js)
# Managing plugin federation
# Coordinating mobile integration
```

## 🔧 AI Commands & Capabilities

### Repository Management
- **Clone missing repositories** from toplocs GitHub organization
- **Update all repositories** to latest main branch
- **Coordinate cross-repo changes** with understanding of dependencies

### Development Assistance
- **Architecture guidance** based on P2P Gun.js patterns
- **Plugin development** following Module Federation patterns
- **Mobile integration** with core platform understanding
- **P2P migration** assistance for plugins transitioning to Gun.js

### Documentation Maintenance
- **Keep docs synchronized** across repositories
- **Update getting-started guides** with new repository additions
- **Maintain AI context files** for optimal development assistance
- **Simplified automation** with minimal GitHub Actions (docs deployment only)
- **Manual sync workflow** for analyzing repository changes and creating update PRs

### Code Change Protocol
- **Always update documentation** when making code changes
- **Update README.md** to reflect new functionality or changes
- **Update relevant docs/** files to keep documentation current
- **Create pull requests** for all changes (never push directly to main)
- **Commit with descriptive messages** explaining what changed and why

## 🚀 Getting Started Commands

After AI setup, use these commands:

### Core Platform
```bash
cd tribelike && pnpm install && pnpm dev
# Opens http://localhost:3000
```

### Plugin Development
```bash
cd demo-plugin && pnpm install && pnpm dev
# Plugin development environment
```

### Mobile App
```bash
cd locations && npm install && npm run dev
# Web version, or ionic cap run ios for native
```

## 🤝 Team Collaboration

This workspace approach enables:
- **Consistent AI context** across all team members
- **Automated setup** for new developers
- **Coordinated development** across multiple repositories
- **Shared documentation** and project management

## 📖 Key Benefits

1. **One-command setup**: New developers get entire ecosystem instantly
2. **AI-first development**: Claude understands full ecosystem context
3. **Version controlled context**: Shared AI guidance across team
4. **Ecosystem coordination**: Single source of truth for project structure
5. **Simplified onboarding**: Focus on building, not setup complexity

---

**Next Steps**: Use the auto-setup prompt to let Claude orchestrate your complete development environment! 🚀```

### README.md
```markdown
# TopLocs Workspace

**Ecosystem setup for the TopLocs decentralized P2P community platform**

This repository orchestrates the entire TopLocs development environment through AI automation.


## 🚀 New Developer? AI Setup in 30 Seconds!

### Quick Start
```bash
git clone git@github.com:toplocs/toplocs-workspace.git toplocs
cd toplocs && claude
```

Then use this prompt:
```
I just cloned the toplocs-workspace repository. Please help me set up the complete TopLocs ecosystem by reading the documentation, cloning all repositories, and setting up the development environment. I want to work on: [your goals]
```

👉 **[Complete Getting Started Guide](./docs/workspace/getting-started.md)**

## 📁 What This Workspace Provides

```
toplocs-workspace/ (this repository)
├── README.md           # Quick start guide  
├── CLAUDE.md          # Comprehensive AI context
├── docs/              # Setup guides & documentation
├── docusaurus/        # 📚 Documentation site (Docusaurus)
└── .gitignore         # Excludes auto-cloned repos

Auto-cloned repositories (after AI setup):
├── tribelike/         # ⭐ Core P2P platform
├── locations/         # Mobile app (Ionic)
├── *-plugin/          # Plugin repositories
└── [others]           # Development tools & docs
```

## 📚 Documentation Hub

**Live Documentation**: https://toplocs.github.io/toplocs-workspace/

The `docusaurus/` folder contains our centralized documentation site that aggregates docs from all TopLocs repositories. 

- **Local Development**: `cd docusaurus && pnpm start`
- **Auto-deploys**: Via GitHub Actions on push to main
- **Multi-source**: Pulls docs from workspace, tribelike, and plugins

[Learn more about the documentation system →](./docusaurus/README.md)

## 🎯 Why AI-Driven Setup?

### Traditional Approach Problems
- ❌ Complex multi-repo setup
- ❌ Outdated documentation  
- ❌ Inconsistent environments
- ❌ Hours of configuration

### AI-Driven Approach Benefits
- ✅ **30-second setup**: AI handles everything
- ✅ **Always current**: AI reads latest documentation
- ✅ **Consistent environments**: Same setup for everyone
- ✅ **Intelligent guidance**: AI understands your goals

## 🏗️ Architecture Overview

TopLocs is a **decentralized P2P community platform** built on Gun.js:

- **No Central Server**: Data distributed across peers
- **User-Owned Data**: Cryptographic keys ensure control
- **Offline-First**: Works without internet
- **Plugin-Based**: Extensible through Module Federation
- **Real-Time Sync**: Instant updates between peers

## 🤖 AI Development Features

### Automated Setup
- Clone all repositories from GitHub
- Install dependencies and configure environments
- Provide ecosystem context and guidance

### Development Assistance  
- Cross-repository coordination
- Architecture guidance for P2P patterns
- Plugin development with Module Federation
- P2P migration assistance for legacy code

### Documentation Maintenance
- Keep docs synchronized across repos
- Update AI context as ecosystem evolves  
- Maintain getting-started guides
- Simplified GitHub Actions (deploy docs only)
- Manual sync workflow for repository analysis and documentation updates

## 📚 Centralized Documentation Hub

### Workspace Documentation (This Repository)
- **[📋 Documentation Hub](./docs/README.md)** - Complete navigation and overview
- **[🚀 Getting Started](./docs/workspace/getting-started.md)** - AI-driven setup guide
- **[🤖 AI Context](./CLAUDE.md)** - Comprehensive development context
- **[🔧 Workspace Overview](./docs/workspace/toplocs-workspace-overview.md)** - System documentation

### Project Documentation (Centralized)
- **[🏗️ Architecture](./docs/project/architecture.md)** - P2P platform technical details
- **[🌐 Ecosystem](./docs/project/ecosystem.md)** - Repository relationships
- **[🔌 Plugin Development](./docs/development/plugin-development.md)** - Create and maintain plugins
- **[🐛 Debug Guide](./docs/development/debug-guide.md)** - Troubleshooting and tools
- **[🤖 Automation](./docs/automation/)** - AI-powered maintenance system

## 🚀 Next Steps

### For New Developers
1. Use the AI setup prompt above
2. Follow AI guidance for your specific goals
3. Start building amazing P2P features!

### For Team Members
1. Clone this workspace
2. Let AI coordinate your development environment
3. Focus on innovation, not configuration

## 🤝 Contributing

This workspace approach enables:
- **Consistent onboarding** for all contributors
- **AI-guided development** with full ecosystem context
- **Simplified coordination** across multiple repositories
- **Focus on building** rather than setup complexity

## 📄 License & Community

**Open Source**: MIT License  
**Community**: Building the future of decentralized social platforms  
**Contributions**: Always welcome - AI will help you get started!

---

**Ready to build the future?** Use the AI setup prompt and start contributing to decentralized communities! 🚀```

### docs/project/ecosystem.md
```markdown
# TopLocs Ecosystem Overview

This document provides a high-level overview of the entire TopLocs ecosystem, including all repositories and their relationships.

## Repository Overview

TopLocs is organized as a collection of independent repositories that work together to create a decentralized community platform:

```
toplocs/ (workspace managed by toplocs-workspace repository)
├── 📋 Workspace Management
│   ├── docs/                # 📚 Centralized documentation hub
│   ├── CLAUDE.md           # 🤖 AI development context
│   └── automation/         # 🔄 GitHub Actions workflows
├── 🏛️  Core Platform
│   ├── tribelike/           # Main community platform & plugin host
│   ├── locations/           # Location-based mobile app (Ionic)
│   └── tribelike.wiki/      # Documentation wiki
├── 🔌 Plugin Ecosystem
│   ├── event-plugin/        # Plugin: Real-time chat & event management
│   ├── wiki-plugin/         # Plugin: Knowledge sharing & documentation
│   ├── location-plugin/     # Plugin: Location management & mapping
│   └── link-plugin/         # Plugin: Link sharing & bookmarking
└── 🛠️  Development Tools
    └── demo-plugin/         # Plugin development framework
```

## Core Architecture

TopLocs (Topic + Location) is a **decentralized peer-to-peer community platform** built on Gun.js:

### Key Principles
- **No Central Authority**: No single server controls the data
- **User-Owned Data**: Users control their data through cryptographic keys
- **Offline-First**: Works without internet connectivity
- **Real-Time Sync**: Changes propagate instantly between connected peers
- **Plugin-Based**: Extensible through Module Federation

### Technology Stack
- **Frontend**: Vue.js 3 + TypeScript + Gun.js
- **Backend**: Minimal Express relay (Gun.js only)
- **Authentication**: WebAuthn/Passkeys + Gun SEA
- **Plugins**: Module Federation for dynamic loading
- **Mobile**: Ionic + Capacitor for native apps

## Repository Categories

### 🏛️ Production Repositories
These are the main repositories for the production platform:

- **tribelike** - Core community platform and plugin host
- **locations** - Mobile application for location-based interactions
- **tribelike.wiki** - Project documentation and specifications

### 🔌 Plugin Repositories
All repositories ending in `-plugin` are plugins for the platform:

- **event-plugin** - Real-time chat and event management
- **wiki-plugin** - Collaborative knowledge sharing
- **location-plugin** - Location management and mapping
- **link-plugin** - Link sharing and bookmarking


### 🛠️ Development Tools
- **demo-plugin** - Template and framework for plugin development

## Plugin Architecture

The platform uses **Module Federation** to load plugins dynamically:

```typescript
// Plugin configuration
federation({
  name: 'your-plugin',
  filename: 'plugin.js',
  exposes: {
    './Main': './src/components/Main.vue',
    './Settings': './src/components/Settings.vue'
  },
  shared: ['vue', 'tailwindcss']
})
```

Plugins integrate through:
1. **Gun.js shared data layer** - All plugins access the same decentralized database
2. **Component federation** - Runtime loading without rebuilding core
3. **Standard interfaces** - Main, Settings, Sidebar components
4. **Universal relations** - Connect any entities through typed relationships

## Data Architecture

### Gun.js Namespaces
```javascript
gun.get('credentials').get(email)         // Authentication
gun.get('profile/{id}')                   // User profiles
gun.get('location/{id}')                  // Geographic locations
gun.get('topic/{id}/{space}')            // Topics (local/global)
gun.get('sphere/{id}/{space}')           // Community spheres
gun.get('relations/{from}/{type}/{to}')  // Universal relations
gun.get('plugins')                        // Plugin registry
```

### Relationship System
- **Profile-Interest**: `favorite`, `doing`, `expert`, `learning`, `curious`
- **Profile-Location**: `living`, `working`, `traveling`, `visiting`, `current`
- **Profile-Profile**: `following`, `friend`, `family`, `partner`
- **Content relationships**: Categories, tags, hierarchies

## Development Workflow

### 1. Core Platform Development
```bash
cd tribelike
pnpm install
pnpm dev  # Starts client and server
```

### 2. Plugin Development
```bash
cd demo-plugin
pnpm install
pnpm dev  # Starts plugin development environment
```

### 3. Mobile Development
```bash
cd locations
npm install
npm run dev  # Web development
ionic cap run ios  # Native iOS
```


## Repository Relationships

### Data Flow
```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│   Plugins   │◄──►│  tribelike  │◄──►│  locations  │
│ (federated) │    │  (core)     │    │  (mobile)   │
└─────────────┘    └─────────────┘    └─────────────┘
      ▲                    ▲                    ▲
      │                    │                    │
      └────────────────────┼────────────────────┘
                           ▼
                   ┌─────────────┐
                   │   Gun.js    │
                   │ (P2P data)  │
                   └─────────────┘
```

### Development Dependencies
- **Plugins** depend on tribelike for core types and components
- **demo-plugin** provides templates for all plugin development
- **locations** is independent but may integrate with core platform

## Getting Started

### For Core Development
1. Start with **tribelike** - the main platform
2. Follow `tribelike/CLAUDE.md` for detailed guidance
3. Use `tribelike/docs/` for comprehensive documentation

### For Plugin Development
1. Use **demo-plugin** as your starting template
2. Follow the plugin development guide in `tribelike/docs/plugin-development.md`
3. Test integration with the demo framework

### For Mobile Development
1. Work in **locations** repository
2. Use Ionic/Capacitor for cross-platform development
3. Consider integration points with the core platform


## Documentation Structure

### Central Documentation
- **tribelike/docs/** - Complete ecosystem documentation
- **tribelike/CLAUDE.md** - AI development context
- **tribelike/README.md** - Core platform overview

### Repository-Specific Documentation
- Each repository has its own README.md
- Plugin repositories link back to central docs
- PoC repositories document experimental findings

## Maintenance Strategy

### Documentation Updates
1. **Primary**: Update tribelike/docs/ for ecosystem changes
2. **Secondary**: Update individual repository READMEs
3. **Links**: Maintain cross-references between repositories

### Version Management
- Each repository is independently versioned
- Plugin compatibility is managed through shared interfaces
- Core platform changes may require plugin updates

## Contributing

1. **Understand the ecosystem** - Review this document and tribelike/docs/
2. **Choose your area** - Core platform, plugins, mobile, or research
3. **Follow the patterns** - Use existing repositories as guides
4. **Test thoroughly** - Use appropriate development environments
5. **Document changes** - Update relevant documentation

This ecosystem approach allows for:
- **Independent development** of different components
- **Flexible deployment** of only needed parts
- **Experimental features** without affecting core stability
- **Community contributions** through the plugin system```

## Repository Analysis
# Repository Analysis Report

**Analysis Date**: 2025-07-11 17:52:15 UTC
**Trigger**: Manual sync requested

## toplocs/tribelike

- **Latest Commit**: a43a59b by addiinnocent on 2025-07-10
- **Message**: ApiKeys and PluginManagement components added (#124)
- **Recent Activity**: 20 commits in last 30 days
- **README**: 3459 characters
- **Package**: @tribelike/root@1.0.0
- **Scripts**: build, certs, check, clear, db:migrate, dev, dev:https, generate:openapi, lint, start, test
- **Documentation**: 3 markdown files in docs/
- **Status**: 🔥 **Recent activity detected**

## toplocs/locations

- **Latest Commit**: b97d113 by addiinnocent on 2025-03-04
- **Message**: Merge pull request #45 from toplocs/rewrites
- **Recent Activity**: 0 commits in last 30 days
- **README**: 769 characters
- **Package**: locations@0.0.1
- **Scripts**: build, dev, lint, preview, sync:ios, test:e2e, test:unit, validate
- **Status**: ✅ Stable

## toplocs/event-plugin

- **Latest Commit**: 2233ba8 by addiinnocent on 2024-11-25
- **Message**: Chat plugin restored
- **Recent Activity**: 0 commits in last 30 days
- **README**: 1039 characters
- **Package**: chat-plugin@1.0.0
- **Scripts**: build, build-only, dev, format, lint, preview, test:unit, type-check
- **Status**: ✅ Stable

## toplocs/wiki-plugin

- **Latest Commit**: 248ed24 by addiinnocent on 2025-07-09
- **Message**: Merge pull request #1 from toplocs/gun
- **Recent Activity**: 1 commits in last 30 days
- **README**: 1010 characters
- **Package**: wiki-plugin@1.0.0
- **Scripts**: build, build-only, dev, format, lint, preview, test:unit, type-check
- **Status**: 🔥 **Recent activity detected**

## toplocs/location-plugin

- **Latest Commit**: a777c11 by addiinnocent on 2025-07-09
- **Message**: Plugin exposes config
- **Recent Activity**: 3 commits in last 30 days
- **README**: 1060 characters
- **Package**: location-plugin@1.0.0
- **Scripts**: build, build-only, dev, format, lint, preview, test:unit, type-check
- **Status**: 🔥 **Recent activity detected**

## toplocs/link-plugin

- **Latest Commit**: 538d9a3 by addiinnocent on 2025-07-11
- **Message**: Loop over slots and sort them by their slot type
- **Recent Activity**: 6 commits in last 30 days
- **README**: 17321 characters
- **Package**: link-plugin@1.0.0
- **Scripts**: build, dev, lint, preview, preview:plugin, test, type-check
- **Status**: 🔥 **Recent activity detected**

## toplocs/demo-plugin

- **Latest Commit**: 9c812cb by Felix Böhm on 2025-07-04
- **Message**: Update remote URL after repository rename from plugin-demo to demo-plugin
- **Recent Activity**: 2 commits in last 30 days
- **README**: 3177 characters
- **Status**: 🔥 **Recent activity detected**

## toplocs/plugin-dev-sdk

- **Latest Commit**: 1fec587 by Felix Böhm on 2025-07-11
- **Message**: docs: Comprehensive README update with detailed usage guide
- **Recent Activity**: 2 commits in last 30 days
- **README**: 10301 characters
- **Package**: @toplocs/plugin-dev-sdk@1.0.0
- **Scripts**: build, dev, preview
- **Status**: 🔥 **Recent activity detected**

## toplocs/tribelike.wiki

- **Status**: ❌ **Not accessible**

