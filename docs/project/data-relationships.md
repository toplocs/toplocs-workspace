# Data Relationships

**Comprehensive relationship matrix for the TopLocs ecosystem**

TopLocs implements a **universal relations system** that connects all entities through typed relationships. This document preserves the original relationship design and shows how it maps to the current Gun.js implementation.

## Core Entity Types

- **Profile**: User profiles representing different contexts (Sports, Work, Family, etc.)
- **Location**: Geographic locations and places of interest
- **Interest**: Topics, hobbies, activities, and areas of focus

## Relationship Matrix

### Profile-to-Profile Relations (n:m)
**Social connections between users**

| Relation Type | Description | Current Implementation |
|---------------|-------------|----------------------|
| **Friend** | Mutual friendship connection | `relations/{profileId}/friend/{friendId}` |
| **Follow** | Asymmetric following relationship | `relations/{profileId}/follow/{targetId}` |
| **Family** | Family member connection | `relations/{profileId}/family/{familyId}` |
| **Partner** | Romantic partnership | `relations/{profileId}/partner/{partnerId}` |
| **Colleague** | Professional relationship | `relations/{profileId}/colleague/{colleagueId}` |

### Profile-to-Location Relations (n:m)
**User's connection to places**

| Relation Type | System Type | Description | Current Implementation |
|---------------|-------------|-------------|----------------------|
| **Created** | Sys | User created this location | `relations/{profileId}/created/{locationId}` |
| **Favorite** | Rel | Favorite place | `relations/{profileId}/favorite/{locationId}` |
| **Current** | Rel | Currently at this location | `relations/{profileId}/current/{locationId}` |
| **Been** | Rel | Has visited this location | `relations/{profileId}/been/{locationId}` |
| **Want to go** | Rel | Plans to visit | `relations/{profileId}/want-to-go/{locationId}` |
| **Curious** | Rel | Interested in visiting | `relations/{profileId}/curious/{locationId}` |
| **Value** | Rel | Values this location | `relations/{profileId}/value/{locationId}` |
| **Supporting** | Rel | Supports this location | `relations/{profileId}/supporting/{locationId}` |
| **Limit** | Rel | Limits interaction with location | `relations/{profileId}/limit/{locationId}` |
| **Living** | Rel | Lives at this location | `relations/{profileId}/living/{locationId}` |
| **Working** | Rel | Works at this location | `relations/{profileId}/working/{locationId}` |
| **Visiting** | Rel | Visiting this location | `relations/{profileId}/visiting/{locationId}` |
| **Traveling** | Rel | Traveling to this location | `relations/{profileId}/traveling/{locationId}` |
| **Admin** | Gov | Administrative control | `relations/{profileId}/admin/{locationId}` |

### Profile-to-Interest Relations (n:m)
**User's connection to topics and activities**

| Relation Type | System Type | Description | Current Implementation |
|---------------|-------------|-------------|----------------------|
| **Created** | Sys | User created this interest | `relations/{profileId}/created/{interestId}` |
| **Into** | Sys | General interest | `relations/{profileId}/into/{interestId}` |
| **Doing** | Rel | Actively practicing | `relations/{profileId}/doing/{interestId}` |
| **Expert** | Rel | Expert level knowledge | `relations/{profileId}/expert/{interestId}` |
| **Learning** | Rel | Currently learning | `relations/{profileId}/learning/{interestId}` |
| **Curious** | Rel | Curious to learn more | `relations/{profileId}/curious/{interestId}` |
| **Watching** | Rel | Passively following | `relations/{profileId}/watching/{interestId}` |
| **Value** | Rel | Values this interest | `relations/{profileId}/value/{interestId}` |
| **Supporting** | Rel | Supports this interest | `relations/{profileId}/supporting/{interestId}` |
| **Limit** | Rel | Limits engagement | `relations/{profileId}/limit/{interestId}` |
| **Giving** | Rel | Gives/teaches this interest | `relations/{profileId}/giving/{interestId}` |
| **Receiving** | Rel | Receives/learns this interest | `relations/{profileId}/receiving/{interestId}` |
| **Admin** | Gov | Administrative control | `relations/{profileId}/admin/{interestId}` |

### Location-to-Location Relations (n:m)
**Geographic and hierarchical relationships**

| Relation Type | System Type | Description | Current Implementation |
|---------------|-------------|-------------|----------------------|
| **In** | Rel | One location is within another | `relations/{locationId}/in/{parentId}` |
| **Child** | Rel | Parent-child relationship | `relations/{locationId}/child/{childId}` |
| **IsA** | Cat | Categorical relationship | `relations/{locationId}/category/{categoryId}` |

### Interest-to-Interest Relations (n:m)
**Topical and categorical relationships**

| Relation Type | System Type | Description | Current Implementation |
|---------------|-------------|-------------|----------------------|
| **Parent/Child** | Rel | Hierarchical interest relationship | `relations/{interestId}/child/{childId}` |
| **IsA** | Cat | Categorical classification | `relations/{interestId}/category/{categoryId}` |
| **HasA** | Cat | Composition relationship | `relations/{interestId}/has/{componentId}` |
| **Includes** | Gov | Governance inclusion | `relations/{interestId}/includes/{includedId}` |

## Three-Way Relations

### Profile-Profile-Interest Trust (n:m:l)
**Governance and trust relationships**

| Relation Type | Description | Implementation |
|---------------|-------------|---------------|
| **Trust** | Profile A trusts Profile B on Interest C | `relations/{profileA}/trust/{profileB}/{interestC}` |

This enables:
- **Liquid democracy**: Delegate voting power to trusted experts
- **Scoped trust**: Trust someone for specific topics only
- **Governance**: Community decision-making based on trust networks

## System Types Explained

### Rel (Relationship)
**User-defined relationships** that can be created, modified, and deleted by users:
- Express personal connections and preferences
- Drive content discovery and recommendations
- Enable social features and matching

### Sys (System)
**System-managed relationships** created automatically:
- Track object creation and ownership
- Maintain data integrity and permissions
- Enable core platform functionality

### Cat (Category)
**Categorical relationships** for organization:
- Create hierarchies and taxonomies
- Enable filtering and search
- Support content organization

### Gov (Governance)
**Governance relationships** for community management:
- Define administrative powers
- Enable democratic processes
- Support community self-governance

## Gun.js Implementation

### Current Storage Pattern
```javascript
// Universal relations storage
gun.get('relations').get(fromId).get(relationType).get(toId).put(relationData);

// Example: Profile likes Location
gun.get('relations').get(profileId).get('favorite').get(locationId).put({
  created: timestamp,
  strength: 0.8,
  public: true
});
```

### Bidirectional Relations
Many relations are bidirectional and stored in both directions:
```javascript
// Profile A friends Profile B
gun.get('relations').get(profileA).get('friend').get(profileB).put(relationData);
gun.get('relations').get(profileB).get('friend').get(profileA).put(relationData);
```

### Relation Queries
```javascript
// Get all locations a profile has visited
gun.get('relations').get(profileId).get('been').map().on((data, locationId) => {
  // Process visited location
});

// Get all profiles interested in a topic
gun.get('relations').map().get('into').get(interestId).map().on((data, profileId) => {
  // Process interested profile
});
```

## Relationship Strength and Metadata

### Relation Properties
Each relation can include metadata:
- **Strength**: Numeric weight (0.0 to 1.0)
- **Created**: Timestamp of relation creation
- **Updated**: Last modification timestamp
- **Public**: Visibility setting
- **Context**: Additional contextual information

### Example Relation Object
```javascript
{
  created: 1635724800000,
  updated: 1635724800000,
  strength: 0.9,
  public: true,
  context: "Met at local hiking group",
  verified: true
}
```

## Privacy and Visibility

### Relation Visibility
- **Public**: Visible to all users
- **Friends**: Visible to friends only
- **Private**: Visible to profile owner only
- **Community**: Visible to specific community members

### Privacy Controls
Users can control:
- Which relations are visible to whom
- Granular privacy settings per relation type
- Bulk privacy controls for relation categories

## Use Cases and Applications

### Content Discovery
- **Interest-based recommendations**: Find content based on interests
- **Location-based suggestions**: Discover places based on location relations
- **Social recommendations**: Find content through friend networks

### Community Building
- **Expertise matching**: Connect experts with learners
- **Local connections**: Find nearby people with shared interests
- **Activity coordination**: Organize events based on mutual interests

### Governance and Trust
- **Democratic processes**: Vote delegation through trust networks
- **Reputation systems**: Build reputation through verified relations
- **Community management**: Administrative roles based on trust

## Future Enhancements

### Planned Features
- **Temporal relations**: Relations that change over time
- **Weighted aggregation**: Combine relation strengths for recommendations
- **Relation verification**: Proof of relationship validity
- **Bulk operations**: Efficient management of large relation sets

### Research Areas
- **Graph algorithms**: Shortest path, centrality measures
- **Machine learning**: Relation prediction and recommendation
- **Privacy-preserving**: Zero-knowledge relation proofs
- **Scalability**: Efficient storage and querying of large relation graphs

This comprehensive relationship system enables **rich, contextual connections** between all entities in the TopLocs ecosystem, supporting both social features and community governance while preserving user privacy and control.