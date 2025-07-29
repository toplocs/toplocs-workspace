# TopLocs Plugin Registry

## Overview

This document maintains the current status of all TopLocs plugins, their features, and deployment status as of July 2025.

## Official Plugins

### 1. Link Plugin
- **Repository**: https://github.com/toplocs/link-plugin
- **Status**: ✅ Active
- **SDK Version**: 1.1.0
- **Deployment**: https://toplocs.github.io/link-plugin/
- **Entry Point**: https://toplocs.github.io/link-plugin/plugin.js
- **Description**: Share and organize links within TopLocs communities
- **Features**:
  - Link submission and sharing
  - Metadata extraction
  - Category organization
  - Community link collections

### 2. Event Plugin
- **Repository**: https://github.com/toplocs/event-plugin
- **Status**: ✅ Active
- **SDK Version**: 1.1.0
- **Deployment**: https://toplocs.github.io/event-plugin/
- **Entry Point**: https://toplocs.github.io/event-plugin/plugin.js
- **Description**: Chat, events, and community organization
- **Features**:
  - Real-time chat
  - Event creation and management
  - RSVP system
  - Activity coordination

### 3. Wiki Plugin
- **Repository**: https://github.com/toplocs/wiki-plugin
- **Status**: 🔧 In Development
- **SDK Version**: 1.1.0
- **Deployment**: https://toplocs.github.io/wiki-plugin/ (pending fixes)
- **Entry Point**: https://toplocs.github.io/wiki-plugin/plugin.js
- **Description**: Community wikis and knowledge sharing
- **Features**:
  - Collaborative wiki pages
  - Rich text editing with TipTap
  - Interest and location-based wikis
  - P2P data storage with Gun.js
- **Current Issues**:
  - TypeScript errors being resolved
  - Build process temporarily bypasses type checking

### 4. Location Plugin
- **Repository**: https://github.com/toplocs/location-plugin
- **Status**: 🚧 Under Development
- **SDK Version**: Not yet updated
- **Deployment**: Not yet deployed
- **Entry Point**: https://toplocs.github.io/location-plugin/plugin.js (when deployed)
- **Description**: Location-based features and mapping
- **Features** (Planned):
  - Location mapping
  - Proximity-based discovery
  - Local community organization
  - Geospatial data integration

### 5. Demo Plugin
- **Repository**: https://github.com/toplocs/demo-plugin
- **Status**: 📚 Template/Example
- **SDK Version**: Legacy (pre-SDK)
- **Description**: Template for plugin development
- **Purpose**:
  - Reference implementation
  - Advanced plugin patterns
  - Custom build configurations
  - Testing ground for new features

## Plugin Development Tools

### Plugin SDK
- **Repository**: https://github.com/toplocs/plugin-sdk
- **Current Version**: 1.1.0
- **Status**: ✅ Active
- **NPM Package**: @toplocs/plugin-sdk
- **Documentation**: [Plugin SDK v1.1.0 Guide](../development/plugin-sdk-v1.1.0.md)

### Key Features in SDK v1.1.0:
1. **Standardized Components**:
   - PluginInfoPage for consistent information display
   - Reusable UI components
   - TypeScript interfaces

2. **Development Environment**:
   - Hot module replacement
   - Interactive testing interface
   - Module Federation support

3. **Build Tools**:
   - Vite configuration templates
   - GitHub Pages deployment
   - Asset optimization

## Plugin Architecture

### Module Federation
All plugins use Webpack/Vite Module Federation for dynamic loading:
- **Exposed Components**: Main, Sidebar, Settings views
- **Shared Dependencies**: Vue 3, Vue Router, Tailwind CSS
- **Runtime Loading**: Plugins load dynamically without page refresh

### Data Layer
- **Gun.js Integration**: All plugins share the same P2P data layer
- **Namespacing**: Each plugin uses its own namespace in Gun
- **Real-time Sync**: Changes propagate instantly across peers

### Deployment
- **GitHub Pages**: All plugins deploy to GitHub Pages
- **CDN Ready**: Plugin files can be hosted on any CDN
- **CORS Support**: Proper headers for cross-origin loading

## Plugin Categories

### 1. Communication Plugins
- **Event Plugin**: Chat and real-time messaging
- **Future**: Forums, video chat, notifications

### 2. Content Sharing
- **Link Plugin**: URL sharing and bookmarking
- **Wiki Plugin**: Collaborative documentation
- **Future**: Media galleries, file sharing

### 3. Organization Tools
- **Event Plugin**: Event management and RSVPs
- **Future**: Task management, calendars, polls

### 4. Location-Based
- **Location Plugin**: Maps and proximity features
- **Future**: Local discovery, check-ins

## Development Status Legend

- ✅ **Active**: Fully functional and deployed
- 🔧 **In Development**: Actively being worked on
- 🚧 **Under Development**: Early development stage
- 📚 **Template/Example**: Reference implementation
- 🔜 **Planned**: On the roadmap

## Plugin Requirements

### Technical Requirements
1. **Vue 3** with Composition API
2. **TypeScript** for type safety
3. **Module Federation** for dynamic loading
4. **Gun.js** for data persistence
5. **Tailwind CSS** for styling

### Functional Requirements
1. **P2P First**: All data stored in Gun.js
2. **Offline Capable**: Work without server connection
3. **Community Focused**: Enable community interactions
4. **Privacy Respecting**: User owns their data
5. **Mobile Friendly**: Responsive design required

## How to Create a Plugin

1. **Use the SDK**:
   ```bash
   npm install git+https://github.com/toplocs/plugin-sdk.git
   ```

2. **Follow the Guide**:
   - [Plugin Development Guide](../development/plugin-development.md)
   - [Plugin SDK Documentation](../development/plugin-sdk-v1.1.0.md)

3. **Reference Examples**:
   - Link Plugin: Best example of SDK usage
   - Event Plugin: Complex interactions
   - Wiki Plugin: Rich content editing

4. **Deploy**:
   - Build with `pnpm build`
   - Deploy to GitHub Pages
   - Register in Gun.js plugin registry

## Future Plugins

### Planned for Development
1. **Forum Plugin**: Structured discussions
2. **Marketplace Plugin**: Community commerce
3. **Governance Plugin**: Voting and decisions
4. **Calendar Plugin**: Shared schedules
5. **Task Plugin**: Project management

### Community Suggestions
- Media gallery plugin
- Recipe sharing plugin
- Skill exchange plugin
- Resource library plugin

## Contributing

To contribute a new plugin:
1. Fork the plugin-sdk repository
2. Create your plugin following the guide
3. Test thoroughly with the SDK
4. Submit to the TopLocs organization
5. Update this registry

## Support

- **Documentation**: https://toplocs.github.io/toplocs-workspace/
- **Issues**: File in respective plugin repositories
- **Community**: Join TopLocs community discussions