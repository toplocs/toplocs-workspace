# GunDB Developer Guide for TopLocs

## Overview

GunDB is a decentralized, real-time graph database that powers the TopLocs ecosystem. This guide provides comprehensive information for developers working with GunDB in the TopLocs platform, covering everything from basic concepts to advanced patterns and best practices.

## Table of Contents

1. [Core Concepts](#core-concepts)
2. [Getting Started](#getting-started)
3. [Data Modeling Patterns](#data-modeling-patterns)
4. [TopLocs Implementation Patterns](#toplocs-implementation-patterns)
5. [Best Practices](#best-practices)
6. [Common Pitfalls](#common-pitfalls)
7. [API Reference](#api-reference)
8. [Performance Optimization](#performance-optimization)
9. [Security & Authentication](#security--authentication)
10. [Debugging & Development Tools](#debugging--development-tools)

## Core Concepts

### What is GunDB?

GunDB is a **decentralized, real-time graph database** that enables:
- **Peer-to-peer data synchronization** across multiple devices and browsers
- **Real-time updates** without polling
- **Offline-first** functionality with automatic sync when online
- **Graph-based data modeling** for complex relationships
- **Built-in security** with cryptographic user authentication

### Key Features

- **Decentralized**: No single point of failure
- **Real-time**: Instant data synchronization
- **Offline-first**: Works without internet connection
- **Cryptographic**: Built-in security with Gun SEA
- **Cross-platform**: Works in browsers, Node.js, and mobile apps
- **Flexible schema**: Graph-based data modeling

### Graph Database Fundamentals

GunDB uses a **graph model** where:
- **Nodes** represent entities (users, posts, locations, etc.)
- **Edges** represent relationships between nodes
- **Properties** store data on nodes
- **References** create links between nodes

## Getting Started

### Installation

```bash
npm install gun
```

### Basic Setup

```javascript
import Gun from 'gun';
import 'gun/sea'; // For user authentication
import 'gun/lib/unset'; // For data deletion
import 'gun/lib/radix'; // For indexing
import 'gun/lib/radisk'; // For storage
import 'gun/lib/store'; // For indexed storage
import 'gun/lib/rindexed'; // For IndexedDB + RAD

// Initialize Gun with peers
const gun = Gun({
  peers: ['http://localhost:3000/gun'],
  rad: true // Enable RAD (Radix Atomic Database) for better performance
});
```

### Basic Operations

```javascript
// Create/Update data
gun.get('users').get('user1').put({
  name: 'John Doe',
  email: 'john@example.com'
});

// Read data (one-time)
gun.get('users').get('user1').once(data => {
  console.log('User:', data);
});

// Subscribe to real-time updates
gun.get('users').get('user1').on(data => {
  console.log('User updated:', data);
});

// Remove data
gun.get('users').get('user1').get('email').put(null);
```

## Data Modeling Patterns

### 1. Entity Pattern

Model entities with consistent structure including internal fields for organization:

```javascript
// User entity following GunDB best practices
const user = {
  uuid: 'user-123',        // Internal ID for tracking
  type: 'user',           // Internal type for categorization
  name: 'John Doe',
  email: 'john@example.com',
  avatar: 'https://...',
  created_at: Date.now(),
  // Relationships as sets
  posts: {},              // Set of posts
  followers: {},          // Set of followers
  following: {},          // Set of following
  profile: {}             // Link to profile
};

// Store entity with proper namespacing
gun.get('users').get('user-123').put(user);
```

### 1.1 Entity Best Practices

**Internal Fields**: Always include `uuid` and `type` fields for internal organization and queries.

**Consistent Structure**: Use consistent naming conventions and structure across all entities.

**Proper Namespacing**: Use clear namespaces to organize different entity types.

### 2. Set Pattern

Use sets for collections of related items:

```javascript
// Add items to a set
gun.get('users').get('user-123').get('posts').get('post-456').put(true);
gun.get('users').get('user-123').get('posts').get('post-789').put(true);

// Read all items in a set
gun.get('users').get('user-123').get('posts').map().once((data, key) => {
  if (data) {
    console.log('User has post:', key);
  }
});
```

### 3. Link Pattern

Create references between entities:

```javascript
// Create a post with author reference
const post = {
  uuid: 'post-456',
  type: 'post',
  title: 'My Post',
  content: 'Post content...',
  author: gun.get('users').get('user-123'), // Link to user
  created_at: Date.now()
};

gun.get('posts').get('post-456').put(post);

// Follow the link
gun.get('posts').get('post-456').get('author').once(author => {
  console.log('Post author:', author);
});
```

### 4. Link Node Pattern

For relationships that need properties, use link nodes. This pattern is essential for complex relationships:

```javascript
// Book Review as a Link Node (from AJ Meyghani's data modeling guide)
const bookReview = {
  uuid: 'review-123',
  type: 'book_review',      // Link node type
  name: 'Review of "The Great Gatsby"',
  rating: 4,               // 1-5 stars
  content: 'Excellent classic novel with deep themes...', // max 375 characters
  created_at: Date.now(),
  // Links to related entities
  book: gun.get('books').get('book-456'),
  reader: gun.get('readers').get('reader-123')
};

gun.get('book_reviews').get('review-123').put(bookReview);

// Add to both entities' review sets
gun.get('books').get('book-456').get('reviews').get('review-123').put(true);
gun.get('readers').get('reader-123').get('reviews').get('review-123').put(true);
```

### 4.1 Link Node Best Practices

**Rich Relationships**: Use link nodes when relationships need properties (rating, timestamp, status).

**Bidirectional References**: Add the link node to both entities' sets for efficient querying.

**Descriptive Naming**: Use clear, descriptive names for link node types.

### 5. Hierarchical Pattern

Model hierarchical data with parent-child relationships:

```javascript
// Location hierarchy
const location = {
  uuid: 'location-123',
  type: 'location',
  name: 'Berlin',
  parent: gun.get('locations').get('location-germany'),
  children: {}, // Set of child locations
  level: 1 // Hierarchy level
};

gun.get('locations').get('location-123').put(location);

// Add to parent's children
gun.get('locations').get('location-germany').get('children').get('location-123').put(true);
```

## TopLocs Implementation Patterns

### 1. Plugin Architecture

TopLocs uses a plugin-based architecture where each plugin has its own Gun instance:

```javascript
// Plugin Gun instance
import Gun from 'gun';
import 'gun/sea';

const gun = Gun(['http://localhost:3000/gun']);

// Plugin-specific namespace
const pluginData = gun.get('plugin-my-plugin');

// Plugin registration
pluginData.get('config').put({
  name: 'My Plugin',
  version: '1.0.0',
  author: 'Developer',
  capabilities: ['read', 'write']
});
```

### 2. Security Extensions

TopLocs extends Gun with security utilities:

```javascript
// Verify plugin signatures
gun.secure = {
  async verifyPlugin(pluginData) {
    const { data, signature, author } = pluginData;
    const verified = await gun.SEA.verify(signature, author);
    return verified === data;
  },

  async createCID(data) {
    const contentString = JSON.stringify(data);
    const hash = await crypto.subtle.digest('SHA-256', 
      new TextEncoder().encode(contentString));
    return Array.from(new Uint8Array(hash))
      .map(b => b.toString(16).padStart(2, '0'))
      .join('');
  }
};
```

### 3. User Authentication Pattern

```javascript
// User registration
const user = await gun.user().create(alias, password);

// User login
const auth = await gun.user().auth(alias, password);

// Check if user is authenticated
if (gun.user().is) {
  console.log('User authenticated');
}

// Store user data
gun.user().get('profile').put({
  name: 'John Doe',
  bio: 'Software developer'
});
```

### 4. Namespace Pattern

Organize data with consistent namespacing:

```javascript
// Core platform namespaces
const users = gun.get('users');
const locations = gun.get('locations');
const posts = gun.get('posts');
const plugins = gun.get('plugins');

// Plugin-specific namespaces
const chatPlugin = gun.get('plugin-chat');
const wikiPlugin = gun.get('plugin-wiki');
const linkPlugin = gun.get('plugin-links');
```

## Best Practices

### 1. Data Structure Design

**✅ Do:**
- Use consistent entity structure with `uuid` and `type` fields for organization
- Design for unidirectional relationships by default (GunDB creates one-way relationships)
- Use sets for collections of related items
- Include timestamps for temporal data
- Plan for offline-first scenarios
- Use link nodes for relationships that need properties
- Implement proper namespacing for different entity types
- Keep entity structures flat when possible

**❌ Don't:**
- Store large binary data directly in Gun
- Create circular references without careful consideration
- Use arrays for frequently changing collections
- Store sensitive data without encryption
- Force bidirectional relationships unless necessary
- Create deeply nested object structures

### 2. Performance Optimization

**✅ Do:**
- Use `.once()` for one-time reads
- Use `.on()` for real-time subscriptions
- Implement pagination for large datasets
- Use indexing for searchable data
- Batch operations when possible

**❌ Don't:**
- Subscribe to large datasets without filtering
- Create deeply nested structures
- Use synchronous operations
- Ignore memory management

### 3. Real-time Subscriptions

```javascript
// Good: Specific subscription
gun.get('users').get('user-123').get('status').on(status => {
  updateUI(status);
});

// Bad: Broad subscription
gun.get('users').map().on((user, key) => {
  // This will fire for every user change
});

// Better: Filtered subscription
gun.get('users').map().on((user, key) => {
  if (user && user.active) {
    updateUserList(user);
  }
});
```

### 4. Error Handling

```javascript
// Always handle errors
gun.get('users').get('user-123').once((data, key) => {
  if (data) {
    console.log('User found:', data);
  } else {
    console.log('User not found');
  }
});

// Handle network errors
gun.on('hi', peer => {
  console.log('Connected to peer:', peer);
});

gun.on('bye', peer => {
  console.log('Disconnected from peer:', peer);
});
```

## Common Pitfalls

### 1. Circular References

```javascript
// ❌ Avoid circular references
const user = { name: 'John' };
const post = { title: 'My Post', author: user };
user.posts = [post]; // Circular reference

// ✅ Use references instead
gun.get('users').get('user-123').put({ name: 'John' });
gun.get('posts').get('post-456').put({
  title: 'My Post',
  author: gun.get('users').get('user-123')
});
```

### 2. Synchronous Expectations

```javascript
// ❌ Don't expect synchronous behavior
const user = gun.get('users').get('user-123');
console.log(user); // Won't have data immediately

// ✅ Use callbacks or promises
gun.get('users').get('user-123').once(user => {
  console.log(user); // Will have data
});
```

### 3. Memory Leaks

```javascript
// ❌ Forgetting to unsubscribe
const subscription = gun.get('users').get('user-123').on(data => {
  updateUI(data);
});

// ✅ Unsubscribe when done
subscription.off();
```

### 4. Large Data Sets

```javascript
// ❌ Loading entire sets at once
gun.get('users').map().once((user, key) => {
  // This loads ALL users
});

// ✅ Implement pagination
let count = 0;
gun.get('users').map().once((user, key) => {
  if (count < 10) {
    displayUser(user);
    count++;
  }
});
```

## API Reference

### Core Methods

#### `.get(key)`
Get a reference to a node by key.

```javascript
const user = gun.get('users').get('user-123');
```

#### `.put(data)`
Store data at the current reference.

```javascript
gun.get('users').get('user-123').put({
  name: 'John',
  email: 'john@example.com'
});
```

#### `.once(callback)`
Read data once and execute callback.

```javascript
gun.get('users').get('user-123').once(data => {
  console.log(data);
});
```

#### `.on(callback)`
Subscribe to real-time updates.

```javascript
gun.get('users').get('user-123').on(data => {
  console.log('Updated:', data);
});
```

#### `.map(callback)`
Iterate over a set of nodes.

```javascript
gun.get('users').map().once((user, key) => {
  console.log(key, user);
});
```

#### `.set(data)`
Add data to a set (creates unique key).

```javascript
gun.get('posts').set({
  title: 'New Post',
  content: 'Content...'
});
```

### User/Authentication Methods

#### `.user()`
Get the user namespace.

```javascript
const user = gun.user();
```

#### `.create(alias, password)`
Create a new user account.

```javascript
gun.user().create('john', 'password123');
```

#### `.auth(alias, password)`
Authenticate a user.

```javascript
gun.user().auth('john', 'password123');
```

#### `.is`
Check if user is authenticated.

```javascript
if (gun.user().is) {
  console.log('User is authenticated');
}
```

### Advanced Methods

#### `.back()`
Go back to parent reference.

```javascript
gun.get('users').get('user-123').get('name').back(); // Returns to user-123
```

#### `.path(path)`
Navigate to a path.

```javascript
gun.path(['users', 'user-123', 'name']);
```

#### `.then()`
Convert to promise.

```javascript
const user = await gun.get('users').get('user-123').then();
```

## Performance Optimization

### 1. Indexing Strategy

```javascript
// Create indexes for searchable fields
gun.get('users-by-email').get(email).put(userId);
gun.get('posts-by-tag').get(tag).set(postId);

// Use compound indexes for complex queries
gun.get('posts-by-author-date').get(`${authorId}-${date}`).put(postId);
```

### 2. Pagination Implementation

```javascript
// Implement cursor-based pagination
async function getUsers(cursor = null, limit = 10) {
  const users = [];
  let count = 0;
  let skip = cursor ? true : false;
  
  return new Promise(resolve => {
    gun.get('users').map().once((user, key) => {
      if (!skip && cursor && key === cursor) {
        skip = true;
        return;
      }
      
      if (skip && count < limit) {
        users.push({ id: key, ...user });
        count++;
        
        if (count === limit) {
          resolve({ users, nextCursor: key });
        }
      }
    });
  });
}
```

### 3. Batch Operations

```javascript
// Batch multiple operations
const batch = [];
batch.push(gun.get('users').get('user-1').put(userData1));
batch.push(gun.get('users').get('user-2').put(userData2));
batch.push(gun.get('users').get('user-3').put(userData3));

// Execute batch
Promise.all(batch).then(() => {
  console.log('Batch completed');
});
```

## Security & Authentication

### 1. User Management

```javascript
// Secure user registration
async function registerUser(alias, password, profile) {
  try {
    const user = await gun.user().create(alias, password);
    
    // Store encrypted profile
    gun.user().get('profile').put(profile);
    
    return { success: true, user };
  } catch (error) {
    return { success: false, error: error.message };
  }
}

// Secure login
async function loginUser(alias, password) {
  try {
    const auth = await gun.user().auth(alias, password);
    return { success: true, auth };
  } catch (error) {
    return { success: false, error: error.message };
  }
}
```

### 2. Data Encryption

```javascript
// Encrypt sensitive data
async function encryptData(data, recipientPub) {
  const encrypted = await gun.SEA.encrypt(data, recipientPub);
  return encrypted;
}

// Decrypt data
async function decryptData(encryptedData, recipientSecret) {
  const decrypted = await gun.SEA.decrypt(encryptedData, recipientSecret);
  return decrypted;
}
```

### 3. Access Control

```javascript
// Check user permissions
function hasPermission(userPub, resource, action) {
  return gun.get('permissions')
    .get(userPub)
    .get(resource)
    .get(action)
    .then(permission => !!permission);
}

// Set permissions
function setPermission(userPub, resource, action, granted) {
  gun.get('permissions')
    .get(userPub)
    .get(resource)
    .get(action)
    .put(granted);
}
```

## Debugging & Development Tools

### 1. Development Extensions

```javascript
// Add debugging utilities in development
if (process.env.NODE_ENV === 'development') {
  gun.debug = {
    // Show all data at a path
    show: (path) => {
      gun.get(path).map().once((data, key) => {
        console.log(`${path}.${key}:`, data);
      });
    },
    
    // Clear all data at a path
    clear: (path) => {
      gun.get(path).map().once((data, key) => {
        gun.get(path).get(key).put(null);
      });
    },
    
    // Show connection status
    status: () => {
      console.log('Gun status:', {
        peers: gun.back(-1).opt().peers,
        user: gun.user().is
      });
    }
  };
}
```

### 2. Data Inspection

```javascript
// Inspect data structure
gun.inspect = function(path) {
  const data = {};
  gun.get(path).map().once((value, key) => {
    data[key] = value;
  });
  return data;
};

// Usage
const userData = gun.inspect('users.user-123');
console.log(userData);
```

### 3. Performance Monitoring

```javascript
// Monitor performance
gun.monitor = {
  operations: 0,
  startTime: Date.now(),
  
  track: function(operation) {
    this.operations++;
    console.log(`Operation ${this.operations}: ${operation}`);
  },
  
  stats: function() {
    const runtime = Date.now() - this.startTime;
    console.log(`Stats: ${this.operations} operations in ${runtime}ms`);
  }
};
```

## Advanced Topics

### 1. Graph Database Modeling Principles

**Understand GunDB's Graph Nature**: GunDB is fundamentally a graph database where nodes represent entities and edges represent relationships. This differs from traditional relational databases.

**Relationship Direction**: GunDB creates relationships in one direction by default. You have complete control over which edges need properties and which entities need bidirectional relationships.

**Node Properties**: Each node can have properties, and you can decide which properties are needed for your specific use case.

### 2. Social Library Example (Real-world Pattern)

This example from the AJ Meyghani guide demonstrates comprehensive GunDB modeling:

```javascript
// Book entity
const book = {
  uuid: 'book-456',
  type: 'book',
  title: 'The Great Gatsby',
  subtitle: 'A Classic American Novel',
  isbn: '978-0-7432-7356-5',
  reviews: {},      // Set of review link nodes
  categories: {},   // Set of category references
  authors: {},      // Set of author references
  publisher: {}     // Link to publisher
};

// Reader entity
const reader = {
  uuid: 'reader-123',
  type: 'reader',
  name: 'John Smith',
  book_reviews: {},    // Set of reviews written
  following: {},       // Set of readers being followed
  followers: {},       // Set of followers
  favorite_books: {}   // Set of favorite books
};

// Author entity
const author = {
  uuid: 'author-789',
  type: 'author',
  name: 'F. Scott Fitzgerald',
  books: {},          // Set of books written
  followers: {}       // Set of readers following this author
};
```

### 3. Custom Indexes

```javascript
// Create custom indexes for complex queries
class GunIndex {
  constructor(gun, indexName) {
    this.gun = gun;
    this.indexName = indexName;
  }
  
  add(key, value, id) {
    this.gun.get(this.indexName).get(key).get(value).set(id);
  }
  
  query(key, value) {
    return new Promise(resolve => {
      const results = [];
      this.gun.get(this.indexName).get(key).get(value).map().once((data, id) => {
        if (data) results.push(id);
      });
      setTimeout(() => resolve(results), 100);
    });
  }
}

// Usage
const locationIndex = new GunIndex(gun, 'location-index');
locationIndex.add('country', 'Germany', 'location-123');
```

### 2. Conflict Resolution

```javascript
// Handle conflicts in distributed data
function resolveConflict(localData, remoteData) {
  // Last-write-wins strategy
  if (remoteData.timestamp > localData.timestamp) {
    return remoteData;
  }
  
  // Merge strategy for non-conflicting fields
  return {
    ...localData,
    ...remoteData,
    timestamp: Math.max(localData.timestamp, remoteData.timestamp)
  };
}
```

### 3. Plugin Development

```javascript
// Create Gun plugins
Gun.on('create', function(root) {
  this.to.next(root);
  
  // Add custom methods
  root.custom = {
    myMethod: function() {
      console.log('Custom method called');
      return this;
    }
  };
});

// Usage
gun.custom.myMethod();
```

## Key Takeaways from Data Modeling Research

### AJ Meyghani's Data Modeling Principles

Based on comprehensive research of GunDB data modeling best practices:

1. **Graph Model Design**: GunDB uses a graph approach where entities are nodes with specific properties, including internal fields like `uuid` and `type` for organization.

2. **Relationship Freedom**: GunDB creates relationships in one direction by default and gives you complete freedom to decide which edges need properties and which entities need bidirectional relationships.

3. **Link Node Pattern**: Use link nodes to describe properties for relationships. This is especially useful for complex relationships like reviews, ratings, or connections that need metadata.

4. **Set-Based Collections**: Use sets (empty objects `{}`) to represent collections of related items, such as `reviews: {}`, `followers: {}`, or `categories: {}`.

5. **Practical Examples**: The Social Library application demonstrates real-world patterns for modeling books, readers, authors, and their complex relationships.

### Query Patterns

GunDB provides several query patterns for working with sets:

- `map().on()` for subscribing to changes on every record
- `map().once()` for getting each record once
- `once().map().on()` for getting record list once, then subscribing to changes on each

## Conclusion

This guide provides a comprehensive overview of GunDB for TopLocs developers, incorporating knowledge from the official wiki, research papers, and expert articles on data modeling. The key to success with GunDB is understanding its graph-based nature, embracing its real-time capabilities, and following proven data modeling patterns.

Remember:
- Design for decentralization from the start
- Use consistent entity patterns with `uuid` and `type` fields
- Embrace unidirectional relationships by default
- Use link nodes for rich relationships
- Implement proper error handling
- Monitor performance and optimize queries
- Keep security in mind for all operations

For more advanced topics and specific use cases, refer to the official GunDB documentation and the TopLocs codebase examples.

---

*This guide is part of the TopLocs developer documentation. For questions or contributions, please refer to the project's GitHub repository.*