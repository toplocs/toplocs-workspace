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
├── Funding/            # Grant applications & project info
│
# Auto-cloned repositories (in .gitignore):
├── tribelike/          # ⭐ Core P2P platform
├── locations/          # Mobile app (Ionic)
├── event-plugin/       # Chat & events plugin
├── wiki-plugin/        # Wiki plugin
├── location-plugin/    # Location plugin
├── link-plugin/        # Link sharing plugin
├── demo-plugin/        # Plugin development framework
├── gun-sign/           # Gun.js server PoC
├── gun-playground/     # Gun.js testing
├── decentral-auth/     # Auth PoC
├── project-playground/ # Architecture testing
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
- **🔬 Research**: gun-*, decentral-auth, project-playground
- **🛠️ Tools**: demo-plugin (development framework)

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
- **Project management**: Funding, roadmap, coordination

### Repository-Specific Documentation
- **tribelike/docs/**: Comprehensive development guides
- **Individual READMEs**: Repository-specific context
- **Plugin docs**: Plugin development and usage

## 🎯 Development Scenarios

### Scenario 1: Core Platform Development
```bash
# Claude reads workspace context, then focuses on tribelike/
cd tribelike
# Comprehensive development context in tribelike/CLAUDE.md
pnpm dev
```

### Scenario 2: Plugin Development
```bash
# Claude understands ecosystem, helps with plugin patterns
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

**Next Steps**: Use the auto-setup prompt to let Claude orchestrate your complete development environment! 🚀