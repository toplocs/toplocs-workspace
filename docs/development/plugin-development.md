# Plugin Development Guide

## Overview

TopLocs uses a plugin-based architecture that allows developers to extend the platform's functionality without modifying the core codebase. Plugins are loaded dynamically using Module Federation and integrate seamlessly with the Gun.js data layer.

### Plugin Philosophy

**"Enable people to organize their communities simpler than ever."**

Plugins are designed to:
- **Enable Community Interactions**: Allow people to share activities and organize communities
- **Support Diverse Activities**: From simple communication to complex governance systems
- **Integrate Seamlessly**: Work with existing interests and locations
- **Preserve P2P Principles**: Maintain decentralized, user-owned data

### Community-Centric Design

Plugins should focus on:
- **Community Building**: Create tools that help people connect and collaborate
- **Local + Global**: Support both local communities (interest + location) and global communities (interest-only)
- **Real-Life Integration**: Bridge digital interactions with physical activities
- **User Empowerment**: Give users control over their data and community interactions

## Plugin Architecture

### Module Federation System
Plugins use **Webpack Module Federation** to enable runtime loading:

```typescript
// vite.config.ts
import { federation } from '@module-federation/vite'

export default defineConfig({
  plugins: [
    vue(),
    federation({
      name: 'your-plugin-name',
      filename: 'plugin.js',
      exposes: {
        './Main': './src/components/Main.vue',
        './Settings': './src/components/Settings.vue',
        './Sidebar': './src/components/Sidebar.vue'
      },
      shared: {
        vue: { singleton: true },
        'tailwindcss': { singleton: true }
      }
    })
  ]
})
```

### Plugin Integration Points

TopLocs uses an **Entity/Page/Slot** architecture:

1. **Entities**: `Topic` or `Location` - the context where plugins operate
2. **Pages**: `Info` or `Settings` - the page within an entity
3. **Slots**: `Content` or `Sidebar` - the specific area on a page

**Available Slots:**
- `Topic/Info/Content` - Main content area for topic information
- `Topic/Info/Sidebar` - Sidebar for topic-related tools
- `Topic/Settings/Content` - Topic settings and configuration
- `Topic/Settings/Sidebar` - Topic settings navigation
- `Location/Info/Content` - Location information display
- `Location/Info/Sidebar` - Location-specific tools
- `Location/Settings/Content` - Location settings
- `Location/Settings/Sidebar` - Location settings navigation

## Getting Started

### 1. Use the Plugin Development SDK (Recommended)

The TopLocs Plugin Development SDK provides a comprehensive development environment:

```bash
# Install the SDK
npm install git+https://github.com/toplocs/plugin-dev-sdk.git

# Or create a new plugin from scratch
mkdir my-new-plugin && cd my-new-plugin
npm init -y
npm install git+https://github.com/toplocs/plugin-dev-sdk.git
```

### 2. Alternative: Use the Demo Plugin Template

For advanced users or custom setups, the `demo-plugin` repository serves as a template:

```bash
cd /path/to/toplocs
cp -r demo-plugin my-new-plugin
cd my-new-plugin
```

### 3. Plugin Structure (SDK-based)

```
my-plugin/
├── src/
│   ├── views/
│   │   ├── info/
│   │   │   └── Sidebar.vue   # Info page sidebar
│   │   └── settings/
│   │       └── Content.vue   # Settings page content
│   ├── components/           # Reusable components
│   ├── composables/
│   │   └── pluginProvider.ts # Plugin data management
│   └── index.ts              # Plugin configuration
├── index.ts                  # Development entry point
├── index.html                # Development HTML
├── package.json
├── vite.config.ts
└── tailwind.config.js
```

### 4. Plugin Configuration

#### Plugin Configuration File (src/index.ts)
```typescript
import type { BasePluginConfig } from '@toplocs/plugin-dev-sdk';

const pluginConfig: BasePluginConfig = {
  id: 'my_plugin',
  name: 'My Plugin',
  url: 'http://localhost:3006/assets/plugin.js',
  version: '1.0.0',
  description: 'Description of my plugin',
  author: 'Your Name',
  slots: [
    { entity: 'Topic', page: 'Info', slot: 'Sidebar', component: 'Sidebar' },
    { entity: 'Topic', page: 'Settings', slot: 'Content', component: 'Content' },
    { entity: 'Location', page: 'Info', slot: 'Sidebar', component: 'Sidebar' },
    { entity: 'Location', page: 'Settings', slot: 'Content', component: 'Content' }
  ]
};

export default pluginConfig;
```

#### Development Entry Point (index.ts)
```typescript
import { createPluginDevelopmentEnvironment, type PluginDevConfig } from '@toplocs/plugin-dev-sdk';
import '@toplocs/plugin-dev-sdk/style.css';

// Import plugin configuration and components
import pluginConfig from './src/index';
import SidebarComponent from './src/views/info/Sidebar.vue';
import ContentComponent from './src/views/settings/Content.vue';

// Create development environment
const devConfig: PluginDevConfig = {
  pluginConfig,
  components: {
    Sidebar: SidebarComponent,
    Content: ContentComponent
  }
};

const app = createPluginDevelopmentEnvironment(devConfig);
app.mount('#app');
```

### 5. Core Components

#### Info Sidebar Component (src/views/info/Sidebar.vue)
```vue
<template>
  <div class="plugin-sidebar">
    <h3>{{ pluginName }}</h3>
    <!-- Info-specific sidebar content -->
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useGun } from '@/composables/gun'

const pluginName = ref('My Plugin')
const gun = useGun()

onMounted(() => {
  // Initialize plugin data
  gun.get('plugins').get('my-plugin').on((data) => {
    console.log('Plugin data:', data)
  })
})
</script>
```

#### Settings Content Component (src/views/settings/Content.vue)
```vue
<template>
  <div class="plugin-settings">
    <h2>Plugin Settings</h2>
    <!-- Configuration UI -->
  </div>
</template>

<script setup lang="ts">
// Plugin settings implementation
</script>
```

## Data Integration

### Gun.js Integration
All plugins share the same Gun.js instance and can access the distributed database:

```typescript
// composables/pluginProvider.ts
import { gun } from '@/services/gun'

export function usePluginData() {
  const savePluginData = (data: any) => {
    gun.get('plugins').get('my-plugin').put(data)
  }

  const loadPluginData = (callback: (data: any) => void) => {
    gun.get('plugins').get('my-plugin').on(callback)
  }

  return {
    savePluginData,
    loadPluginData
  }
}
```

### Plugin Data Namespaces
Recommended data organization:
```javascript
gun.get('plugins').get('plugin-name')           // Plugin registry
gun.get('plugin-data').get('plugin-name')       // Plugin-specific data
gun.get('user-plugin').get(userId).get('plugin-name')  // User-specific plugin data
```

## Plugin Registration

### 1. Register with Core Platform
```typescript
// main.ts
import { gun } from '@/services/gun'

// Register plugin metadata
gun.get('plugins').get('my-plugin').put({
  name: 'My Plugin',
  version: '1.0.0',
  description: 'Plugin description',
  author: 'Your Name',
  components: {
    main: './Main',
    settings: './Settings',
    sidebar: './Sidebar'
  }
})
```

### 2. Plugin Discovery
The core platform automatically discovers plugins registered in Gun.js:

```typescript
// Core platform plugin loader
gun.get('plugins').on((plugins) => {
  Object.keys(plugins).forEach(async (pluginName) => {
    const plugin = plugins[pluginName]
    if (plugin.components?.main) {
      await loadPluginComponent(pluginName, plugin.components.main)
    }
  })
})
```

## Backend Integration (Optional)

### Server Setup
If your plugin needs a backend, create a simple Express server:

```javascript
// server/index.js
const express = require('express')
const app = express()

app.use('/api/my-plugin', require('./api/routes'))

app.listen(3001, () => {
  console.log('Plugin server running on port 3001')
})
```

### API Routes
```javascript
// server/api/routes.js
const express = require('express')
const router = express.Router()

router.get('/data', (req, res) => {
  // Return plugin data
  res.json({ data: 'Plugin data' })
})

router.post('/save', (req, res) => {
  // Save plugin data
  res.json({ success: true })
})

module.exports = router
```

## Styling and UI

### Tailwind CSS
Plugins inherit the core platform's Tailwind CSS configuration:

```vue
<template>
  <div class="bg-white rounded-lg shadow-md p-6">
    <h2 class="text-xl font-bold mb-4">Plugin Title</h2>
    <button class="btn btn-primary">Action Button</button>
  </div>
</template>
```

### Component Library
Use the core platform's component library:

```vue
<script setup lang="ts">
import { Button, Card, Input } from '@/components/common'
</script>

<template>
  <Card>
    <Input v-model="inputValue" placeholder="Enter text" />
    <Button @click="handleClick">Submit</Button>
  </Card>
</template>
```

## Real-time Features

### Gun.js Real-time Updates
```typescript
// Real-time data synchronization
export function useRealTimeData() {
  const data = ref({})
  
  gun.get('plugin-data').get('my-plugin').on((newData) => {
    data.value = newData
  })
  
  const updateData = (newData: any) => {
    gun.get('plugin-data').get('my-plugin').put(newData)
  }
  
  return { data, updateData }
}
```

### WebSocket Integration (Optional)
```typescript
// For real-time features requiring WebSocket
import { io } from 'socket.io-client'

const socket = io('http://localhost:3001')

socket.on('plugin-update', (data) => {
  // Handle real-time updates
})
```

## Testing

### Unit Testing
```typescript
// tests/plugin.test.ts
import { describe, it, expect } from 'vitest'
import { mount } from '@vue/test-utils'
import Main from '@/components/Main.vue'

describe('Plugin Main Component', () => {
  it('renders correctly', () => {
    const wrapper = mount(Main)
    expect(wrapper.text()).toContain('My Plugin')
  })
})
```

### Integration Testing
Use the Plugin Development SDK for interactive testing:

```bash
# Development mode with hot reload
npm run dev

# Preview mode to test federation
npm run build && npm run preview
```

The SDK provides:
- **Entity/Page Selection**: Test components in different contexts
- **Hot Reload**: Instant feedback during development
- **Federation Testing**: Validate module federation loading
- **Slot Validation**: Visual indicators for provided vs. missing slots

## Deployment

### Build Plugin
```bash
pnpm build  # Creates dist/ with plugin.js
```

### Deploy to Gun.js
```typescript
// Deploy plugin to Gun.js network
gun.get('plugins').get('my-plugin').put({
  // Plugin metadata
  url: 'https://your-cdn.com/plugin.js'
})
```

## Best Practices

### 1. Data Management
- Use Gun.js for all persistent data
- Implement proper error handling
- Handle offline scenarios gracefully

### 2. Component Design
- Keep components focused and reusable
- Use TypeScript for type safety
- Follow Vue 3 composition API patterns

### 3. Performance
- Lazy load heavy components
- Implement proper cleanup in `onUnmounted`
- Use Gun.js `.off()` to prevent memory leaks

### 4. Security
- Validate all user inputs
- Use Gun.js SEA for sensitive data
- Implement proper authentication checks

## Core Plugin Categories

### Communication Plugins
**Enable simple and complex communication patterns**

**Chat/Threads**: Allow communities to communicate
- **1:1 Communication**: Direct messaging between users
- **Community Chat**: Group discussions within interest-based communities
- **Local Community Chat**: Location-specific community discussions
- **Integration**: Consider Matrix chat protocol for federated messaging

**Discussion Forums**: Structured conversations and decision-making
- **Threaded Discussions**: Organize complex conversations
- **Decision Support**: Help communities make collective decisions
- **Governance Integration**: Connect discussions to voting and consensus processes

### Knowledge Sharing Plugins
**Enable collaborative knowledge creation and sharing**

**Wiki Systems**: Share knowledge with interest and location context
- **Interest-Specific Wikis**: "How-to" guides for specific topics
- **Location-Specific Wikis**: "Recommended car sharing in Ponto do sol"
- **Integration**: Consider XWiki for advanced wiki functionality
- **Collaborative Editing**: Real-time collaborative document editing

**Learning Platforms**: Educational content and skill sharing
- **Skill Exchange**: Connect learners with experts
- **Tutorial Creation**: Community-generated learning content
- **Progress Tracking**: Track learning journeys and achievements

### Activity Coordination Plugins
**Bridge digital and physical community activities**

**Event Management**: Organize real-world activities
- **Event Creation**: "Beach cleaning", "Dog sitting", "Tree planting"
- **RSVP Systems**: Manage event attendance and capacity
- **Integration**: Meetup.com-like functionality for communities
- **Activity Coordination**: Organize group activities and gatherings

**Project Collaboration**: Coordinate community projects
- **Project Management**: "Nomad village", "Community garden", "Local initiatives"
- **Task Distribution**: Assign and track project tasks
- **Resource Sharing**: Coordinate tools, space, and materials

### Content Sharing Plugins
**Enable rich media and content sharing**

**Media Sharing**: Photos, videos, and files
- **Activity Documentation**: Share photos from group activities
- **Community Archives**: Build collective memory through shared media
- **File Sharing**: Share documents and resources within communities

**Social Features**: Posts, feeds, and social interactions
- **Community Feeds**: Aggregate community updates and activities
- **Social Posts**: Text, photo, and video sharing
- **Interaction**: Like, comment, and share functionality

### Governance Plugins
**Enable democratic community management**

**Decision Making**: Community governance tools
- **Discussion Facilitation**: Structure community debates and discussions
- **Voting Systems**: Implement various voting mechanisms
- **Consensus Building**: Tools for reaching community agreements

**Trust and Reputation**: Community trust networks
- **Reputation Systems**: Track community contributions and trust
- **Delegation**: Liquid democracy and trust delegation
- **Transparency**: Make governance processes visible and accountable

### Marketplace Plugins
**Economic interactions within communities**

**Community Marketplace**: Local economic exchange
- **Goods Exchange**: Buy, sell, and trade within communities
- **Service Marketplace**: Offer and request services
- **Resource Sharing**: Community tool libraries and resource sharing

**Mutual Aid**: Support and assistance networks
- **Skill Sharing**: Offer and request help with specific skills
- **Resource Exchange**: Share tools, space, and materials
- **Community Support**: Organize mutual aid and support networks

### Integration Plugins
**Connect with existing platforms and services**

**Existing Project Integrations**: Leverage existing tools
- **Solid Project**: Integrate with the Solid ecosystem
- **Matrix**: Federated messaging integration
- **Mastodon**: Decentralized social media connection
- **Open Hospitality Network**: Travel and accommodation sharing

## Example Plugin Implementations

### Chat Plugin
```vue
<template>
  <div class="chat-plugin">
    <div class="messages">
      <div v-for="message in messages" :key="message.id">
        {{ message.text }}
      </div>
    </div>
    <input v-model="newMessage" @keyup.enter="sendMessage" />
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { gun } from '@/services/gun'

const messages = ref([])
const newMessage = ref('')

onMounted(() => {
  gun.get('chat').on((data) => {
    messages.value.push(data)
  })
})

const sendMessage = () => {
  gun.get('chat').set({
    text: newMessage.value,
    timestamp: Date.now()
  })
  newMessage.value = ''
}
</script>
```

### Wiki Plugin
```vue
<template>
  <div class="wiki-plugin">
    <div v-if="editing">
      <textarea v-model="content" class="w-full h-64"></textarea>
      <button @click="saveContent">Save</button>
    </div>
    <div v-else>
      <div v-html="renderedContent"></div>
      <button @click="editing = true">Edit</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { gun } from '@/services/gun'

const content = ref('')
const editing = ref(false)
const renderedContent = computed(() => {
  // Render markdown or HTML
  return content.value
})

const saveContent = () => {
  gun.get('wiki').get('page-id').put({
    content: content.value,
    updated: Date.now()
  })
  editing.value = false
}
</script>
```

## Plugin Registry

Maintain a registry of available plugins:

```typescript
// Plugin registry structure
interface PluginMetadata {
  name: string
  version: string
  description: string
  author: string
  repository?: string
  components: {
    main?: string
    settings?: string
    sidebar?: string
  }
  permissions?: string[]
  dependencies?: string[]
}
```

## Development Workflow

### Using the Plugin Development SDK

1. **Setup**: Install the SDK and configure your plugin
2. **Develop**: Use hot reload mode for rapid iteration
3. **Test**: Switch to preview mode to test federation  
4. **Integrate**: Test in actual TopLocs environment
5. **Deploy**: Build and deploy your plugin

### SDK Features

- **🎯 Interactive Development Environment**: Entity/page selection with live component testing
- **⚡ Hot Reload**: Real-time development with instant updates
- **🧩 Module Federation**: Test federated plugin loading and component isolation
- **🎨 Tailwind CSS**: Pre-configured styling with full design system
- **📱 Responsive Design**: Mobile-first development environment
- **🔧 TypeScript**: Full type safety and IntelliSense support

## Support and Community

- **Primary**: Use the [Plugin Development SDK](https://github.com/toplocs/plugin-dev-sdk) for new plugins
- **Reference**: Check the `demo-plugin` repository for advanced patterns
- **Examples**: See the [link-plugin](https://github.com/toplocs/link-plugin) for a complete SDK example
- **Documentation**: Visit [TopLocs Documentation](https://toplocs.github.io/toplocs-workspace/)
- **Community**: Contribute to the plugin ecosystem by sharing your plugins

This guide provides the foundation for developing plugins for the TopLocs platform using the modern SDK approach. The Plugin Development SDK simplifies the development process while maintaining the decentralized, user-owned data principles of the system.