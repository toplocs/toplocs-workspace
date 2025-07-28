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
├── plugin-sdk/         # 🚀 Plugin Development SDK v1.1.0
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

> **"A home for Communities"**
> 
> **"Find likeminded people and interact based on interests and locations"**

### Core Vision
TopLocs addresses fundamental human needs for connection and community:
- **Travel**: "While traveling I want to find communities in any new location and connect easily"
- **Local Discovery**: "I want to find friends and activities around me based on my interests"
- **Community Building**: "I want to build a sustainable community"

### Core Technologies
- **P2P Database**: Gun.js for real-time data sync
- **Frontend**: Vue.js 3 + TypeScript
- **Authentication**: WebAuthn/Passkeys + Gun SEA (multi-layer auth strategy)
- **Plugins**: Module Federation for dynamic loading
- **Mobile**: Ionic + Capacitor

### Key Concepts
- **Multiple Profiles**: Users can create profiles for different contexts ("Sports", "Work", "Family", "Private")
- **Interest-Location Matrix**: Local communities around interests + global interest-based communities
- **Community Governance**: Liquid democracy, trust networks, and transparent contribution-based ownership
- **Plugin Architecture**: "Enable people to organize their communities simpler than ever"

### Repository Categories
- **🏛️ Core**: tribelike (main platform), locations (mobile)
- **🔌 Plugins**: All `*-plugin` repositories (link, event, wiki, location)
- **🛠️ Tools**: plugin-sdk (SDK v1.1.0), demo-plugin (template)

### Data Architecture
- **Universal Relations System**: Connects all entities through typed relationships
- **Multi-Layer Authentication**: Guest → Email → WebAuthn → Gun.js P2P identity
- **Decentralized Governance**: Trust networks enable community self-governance

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

### Enhanced Documentation Resources
- **[🔐 Authentication Strategy](./docs/development/authentication-strategy.md)** - Multi-layer auth from guest to P2P identity
- **[🔗 Data Relationships](./docs/project/data-relationships.md)** - Universal relations system and entity connections
- **[🏛️ Community Governance](./use-cases/2-community-governance.md)** - Liquid democracy and trust networks
- **[🔌 Plugin Development](./docs/development/plugin-development.md)** - Complete plugin development guide
- **[📦 Plugin SDK v1.1.0](./docs/development/plugin-sdk-v1.1.0.md)** - Latest SDK documentation
- **[📚 Plugin Registry](./docs/project/plugin-registry.md)** - Current status of all plugins

### Scenario 2: Plugin Development
```bash
# Modern approach with Plugin SDK v1.1.0
npm install git+https://github.com/toplocs/plugin-sdk.git
# Set up your plugin with SDK

# Alternative: Use demo-plugin as template
cd demo-plugin  # Use as template
cd [your-plugin] # Work on specific plugin
```

**📦 Plugin SDK v1.1.0 Features:**
- **Standardized Info Pages**: PluginInfoPage component for consistent plugin information
- **Development Environment**: Interactive testing with hot reload
- **TypeScript Support**: Full type definitions and interfaces
- **GitHub Pages Ready**: Built-in deployment configuration
- **Vite + Module Federation**: Optimized build setup

**🔌 Current Plugin Status:**
- **link-plugin**: ✅ SDK 1.1.0, deployed, fully functional
- **event-plugin**: ✅ SDK 1.1.0, deployed, chat & events working
- **wiki-plugin**: 🔧 SDK 1.1.0, deployment fixes in progress
- **location-plugin**: 🚧 Under development, SDK integration pending

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

## 📋 Use Cases & User Scenarios

The platform addresses diverse community needs through structured use cases:

### Core Use Cases
- **[🏠 TopLocs Platform](./use-cases/1-toplocs.md)** - Travel, local discovery, community building with multiple profiles
- **[🏛️ Community Governance](./use-cases/2-community-governance.md)** - Liquid democracy, trust networks, transparent ownership
- **[🤝 Meetup Alternative](./use-cases/3-meetup.md)** - Local event organization and community building
- **[🎓 Skool Alternative](./use-cases/4-skool.md)** - Online learning communities and course management

### User Journey Patterns
- **Progressive Identity**: Guest → Email → WebAuthn → P2P identity
- **Community Evolution**: Individual interest → Local community → Global network
- **Governance Maturation**: Informal → Structured → Democratic governance

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

## 🛠 Development Preferences

- **Package Manager**: 
  - In own projects, always use pnpm, not npm

## 📝 Common Plugin Development Tasks

### Creating a New Plugin with SDK v1.1.0
```bash
mkdir my-plugin && cd my-plugin
pnpm init -y
pnpm add git+https://github.com/toplocs/plugin-sdk.git
# Follow the Plugin SDK documentation
```

### Updating Existing Plugin to SDK v1.1.0
1. Update dependency: `pnpm add git+https://github.com/toplocs/plugin-sdk.git`
2. Add info page using PluginInfoPage component
3. Update imports from `@toplocs/plugin-dev-sdk` to `@toplocs/plugin-sdk`
4. Test with `pnpm dev` and deploy with `pnpm build`

### Plugin Deployment Checklist
- [ ] Build succeeds with `pnpm build`
- [ ] `dist/assets/plugin.js` is generated
- [ ] GitHub Actions workflow is configured
- [ ] GitHub Pages is enabled in repository settings
- [ ] Plugin URL in config matches deployment URL

## 🚀 Latest Updates (July 2025)

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

### Documentation Improvements
- New Plugin SDK v1.1.0 guide added
- Plugin Registry created to track all plugins
- Enhanced plugin development guide with SDK examples

---

**Next Steps**: Use the auto-setup prompt to let Claude orchestrate your complete development environment! 🚀