# Getting Started with TopLocs Ecosystem

This guide helps new developers set up the complete TopLocs ecosystem using AI-driven automation.

## 🚀 Quick Setup (AI-Automated)

### Prerequisites
- **Git** with SSH keys configured for GitHub
- **Claude Code** (or any AI assistant that can execute commands)
- **Node.js** >= 20 (for development after setup)
- **pnpm** >= 8 (recommended) or npm

### 1. Clone the Workspace
```bash
git clone git@github.com:toplocs/toplocs-workspace.git toplocs
cd toplocs
```

### 2. Start Claude Code
```bash
claude
```

### 3. Use the AI Setup Prompt
Copy and paste this prompt into Claude:

```
I just cloned the toplocs-workspace repository. Please help me set up the complete TopLocs ecosystem by:

1. Reading the documentation in this workspace (CLAUDE.md and docs/)
2. Cloning all required repositories from the toplocs GitHub organization
3. Setting up the development environment
4. Providing me with comprehensive context for AI-assisted development

I want to work on: [describe your goals - core platform, plugins, mobile, etc.]
```

### 4. AI Will Automatically:
- ✅ Read the workspace documentation
- ✅ Clone all repositories from GitHub
- ✅ Set up development environments
- ✅ Provide ecosystem context
- ✅ Guide you to your specific development goals

## 📁 Expected Result

After AI setup, your folder structure will be:

```
toplocs/ (toplocs-workspace repository)
├── README.md              # This workspace
├── CLAUDE.md              # AI context  
├── docs/                  # Workspace documentation
├── Funding/               # Project funding information
│
# AI-cloned repositories:
├── tribelike/             # ⭐ Core P2P platform
├── locations/             # Mobile app (Ionic)
├── event-plugin/          # Chat & events plugin
├── wiki-plugin/           # Wiki plugin
├── location-plugin/       # Location plugin
├── link-plugin/           # Link sharing plugin
├── demo-plugin/           # Plugin development framework
├── gun-sign/              # Gun.js server PoC
├── gun-playground/        # Gun.js testing
├── decentral-auth/        # Auth PoC
├── project-playground/    # Architecture testing
└── tribelike.wiki/        # Project wiki
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

## 📚 Documentation Structure

### Workspace-Level (This Repository)
- **Setup automation**: AI-driven ecosystem setup
- **Architecture overview**: High-level ecosystem understanding
- **Project coordination**: Funding, roadmap, team coordination

### Repository-Specific
- **tribelike/docs/**: Detailed development guides
- **tribelike/CLAUDE.md**: Comprehensive AI development context
- **Individual READMEs**: Repository-specific information

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

# Proof of Concepts
git clone git@github.com:toplocs/gun-sign.git
git clone git@github.com:toplocs/gun-playground.git
git clone git@github.com:toplocs/decentral-auth.git
git clone git@github.com:toplocs/project-playground.git
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