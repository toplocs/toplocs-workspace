# Plugin SDK v1.1.0 Documentation

## Overview

The TopLocs Plugin SDK v1.1.0 is the official development kit for creating plugins for the TopLocs decentralized community platform. This version introduces significant improvements including standardized info pages, enhanced development environment, and better TypeScript support.

## Key Features

### 🎯 Development Environment
- **Interactive Plugin Testing**: Live development environment with entity/page/slot selection
- **Hot Module Replacement**: Real-time updates during development
- **Module Federation Support**: Test federated loading and component isolation
- **TypeScript First**: Full type safety with exported interfaces

### 🎨 UI Components
- **PluginInfoPage Component**: Standardized plugin information display
- **Pre-configured Tailwind CSS**: Consistent styling across all plugins
- **Responsive Design**: Mobile-first development approach
- **Reusable Components**: Header, section, feature grid, code blocks, and links

### 🔧 Build Tools
- **Vite Configuration**: Optimized build setup with Module Federation
- **Multi-entry Points**: Support for both plugin and landing pages
- **GitHub Pages Ready**: Built-in support for static deployment
- **Asset Optimization**: Proper handling of static assets and relative paths

## Installation

```bash
# Install from GitHub (recommended)
npm install git+https://github.com/toplocs/plugin-sdk.git

# Or using pnpm
pnpm add git+https://github.com/toplocs/plugin-sdk.git
```

## Quick Start

### 1. Create a New Plugin

```bash
mkdir my-plugin && cd my-plugin
npm init -y
npm install git+https://github.com/toplocs/plugin-sdk.git
```

### 2. Basic Plugin Structure

```
my-plugin/
├── src/
│   ├── views/
│   │   ├── MainView.vue      # Main content view
│   │   ├── SidebarView.vue   # Sidebar view
│   │   └── SettingsView.vue  # Settings view
│   ├── InfoPage.vue          # Plugin info page
│   └── index.ts              # Plugin configuration
├── index.ts                  # Development entry
├── index.html               # Development HTML
├── landing.html             # Landing page HTML
├── vite.config.ts           # Vite configuration
└── package.json
```

### 3. Plugin Configuration (src/index.ts)

```typescript
import type { BasePluginConfig } from '@toplocs/plugin-sdk'

const pluginConfig: BasePluginConfig = {
  id: 'my_plugin',
  name: 'My Plugin',
  url: 'http://localhost:3000/assets/plugin.js',
  version: '1.0.0',
  description: 'A plugin for TopLocs',
  author: 'Your Name',
  slots: [
    { entity: 'Topic', page: 'Info', slot: 'Content', component: 'MainView' },
    { entity: 'Topic', page: 'Info', slot: 'Sidebar', component: 'SidebarView' },
    { entity: 'Topic', page: 'Settings', slot: 'Content', component: 'SettingsView' }
  ]
}

export default pluginConfig
```

### 4. Development Entry (index.ts)

```typescript
import { createPluginDevelopmentEnvironment, type PluginDevConfig } from '@toplocs/plugin-sdk'
import '@toplocs/plugin-sdk/style.css'

import pluginConfig from './src/index'
import MainView from './src/views/MainView.vue'
import SidebarView from './src/views/SidebarView.vue'
import SettingsView from './src/views/SettingsView.vue'

const devConfig: PluginDevConfig = {
  pluginConfig,
  components: {
    MainView,
    SidebarView,
    SettingsView
  }
}

const app = createPluginDevelopmentEnvironment(devConfig)
app.mount('#plugin-dev')
```

## Info Page Component

The SDK provides a standardized `PluginInfoPage` component for creating consistent plugin information pages:

### Usage Example (src/InfoPage.vue)

```vue
<template>
  <PluginInfoPage
    :plugin-config="pluginConfig"
    icon="🔗"
    :about="about"
    :features="features"
    :endpoints="endpoints"
    :development="development"
    :slot-descriptions="slotDescriptions"
  />
</template>

<script setup lang="ts">
import { PluginInfoPage } from '@toplocs/plugin-sdk'
import pluginConfig from './index'

const about = `
My Plugin enables powerful functionality within TopLocs communities.
It integrates seamlessly with the P2P architecture.
`

const features = [
  {
    icon: '📝',
    title: 'Feature One',
    description: 'Description of the first feature'
  },
  {
    icon: '🔄',
    title: 'Feature Two', 
    description: 'Description of the second feature'
  }
]

const endpoints = [
  { path: '/api/endpoint1', description: 'First API endpoint' },
  { path: '/api/endpoint2', description: 'Second API endpoint' }
]

const development = {
  setup: [
    'Clone the repository',
    'Install dependencies with pnpm install',
    'Run development server with pnpm dev'
  ],
  requirements: [
    'Node.js 18+',
    'pnpm package manager',
    'TopLocs core platform'
  ]
}

const slotDescriptions = {
  MainView: 'Main content area for the plugin',
  SidebarView: 'Sidebar tools and navigation',
  SettingsView: 'Plugin configuration interface'
}
</script>
```

## Vite Configuration

The SDK requires specific Vite configuration for Module Federation:

```typescript
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { federation } from '@originjs/vite-plugin-federation'
import topLevelAwait from 'vite-plugin-top-level-await'

export default defineConfig({
  plugins: [
    vue(),
    topLevelAwait(),
    federation({
      name: 'my-plugin',
      filename: 'plugin.js',
      exposes: {
        './PluginConfig': './src/index.ts',
        './MainView': './src/views/MainView.vue',
        './SidebarView': './src/views/SidebarView.vue',
        './SettingsView': './src/views/SettingsView.vue'
      },
      shared: {
        vue: { singleton: true, requiredVersion: '^3.0.0' },
        'vue-router': { singleton: true, requiredVersion: '^4.0.0' },
        tailwindcss: { singleton: true }
      }
    })
  ],
  base: './',
  build: {
    target: 'esnext',
    assetsDir: 'assets',
    rollupOptions: {
      input: {
        main: path.resolve(__dirname, 'index.html'),
        landing: path.resolve(__dirname, 'landing.html')
      }
    }
  }
})
```

## Package.json Scripts

Standard scripts for plugin development:

```json
{
  "scripts": {
    "dev": "vite --port 3006 --open",
    "build": "vite build && mv dist/landing.html dist/index.html && touch dist/.nojekyll",
    "preview": "vite preview",
    "type-check": "vue-tsc --build --force",
    "lint": "eslint . --fix"
  }
}
```

## TypeScript Types

The SDK exports the following TypeScript interfaces:

### BasePluginConfig
```typescript
interface BasePluginConfig {
  id: string
  name: string
  url: string
  version?: string
  description?: string
  author?: string
  slots: Array<PluginSlot>
}
```

### PluginSlot
```typescript
interface PluginSlot {
  entity: 'Topic' | 'Location'
  page: 'Info' | 'Settings'
  slot: 'Content' | 'Sidebar'
  component: string
}
```

### PluginDevConfig
```typescript
interface PluginDevConfig {
  pluginConfig?: BasePluginConfig
  components?: Record<string, any>
  importPaths?: {
    configPath?: string
    sidebarPath?: string
    contentPath?: string
  }
}
```

### PluginInfoProps
```typescript
interface PluginInfoProps {
  pluginConfig: BasePluginConfig
  icon?: string
  about?: string
  features?: Array<{
    icon: string
    title: string
    description: string
  }>
  endpoints?: Array<{
    path: string
    description: string
  }>
  development?: {
    setup?: string[]
    requirements?: string[]
  }
  slotDescriptions?: Record<string, string>
}
```

## GitHub Pages Deployment

The SDK includes built-in support for GitHub Pages deployment:

### GitHub Actions Workflow (.github/workflows/deploy.yml)

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: pnpm/action-setup@v2
        with:
          version: 8
      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: 'pnpm'
      - run: pnpm install
      - run: pnpm build
      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./dist

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    steps:
      - uses: actions/deploy-pages@v4
        id: deployment
```

## Best Practices

### 1. Use TypeScript
- Always define proper types for your plugin data
- Use the exported interfaces from the SDK
- Enable strict mode in tsconfig.json

### 2. Component Organization
- Keep views in `src/views/` directory
- Reusable components in `src/components/`
- Composables in `src/composables/`

### 3. Gun.js Integration
- Use proper namespacing for plugin data
- Clean up listeners with `.off()` in `onUnmounted`
- Handle offline scenarios gracefully

### 4. Styling
- Use Tailwind CSS classes provided by the SDK
- Follow the design system for consistency
- Ensure responsive design for all screen sizes

### 5. Performance
- Lazy load heavy components
- Use computed properties for derived state
- Implement proper loading states

## Migration from v1.0.0

### Breaking Changes
- None - v1.1.0 is fully backward compatible

### New Features
1. **PluginInfoPage Component**: Standardized info pages
2. **Enhanced TypeScript Support**: Better type exports
3. **Improved Build Configuration**: Better asset handling
4. **GitHub Pages Support**: Built-in deployment configuration

### Migration Steps
1. Update SDK dependency to v1.1.0
2. Add info page using PluginInfoPage component
3. Update build scripts for GitHub Pages deployment
4. Verify TypeScript types are properly imported

## Troubleshooting

### Common Issues

#### Module Federation Loading Errors
- Ensure the plugin URL in config matches the deployed location
- Check that shared dependencies versions match
- Verify CORS headers if hosting on different domain

#### TypeScript Errors
- Import types from '@toplocs/plugin-sdk'
- Ensure tsconfig extends the SDK configuration
- Check that all components have proper type definitions

#### Build Issues
- Use Node.js 18 or higher
- Clear node_modules and reinstall
- Check vite.config.ts matches SDK requirements

## Support

- **GitHub Issues**: https://github.com/toplocs/plugin-sdk/issues
- **Documentation**: https://toplocs.github.io/toplocs-workspace/
- **Examples**: See link-plugin, event-plugin, wiki-plugin repositories