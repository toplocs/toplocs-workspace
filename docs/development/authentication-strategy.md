# Authentication Strategy

**Multi-layer authentication approach for progressive privacy and security**

TopLocs implements a **layered authentication system** that provides different levels of access and privacy based on user needs and technical capabilities.

## Authentication Layers

### 1. Guest Access - Not Authenticated
**Public access to shared content**

**Capabilities:**
- Read public profiles, locations, and interests
- View public guest profiles
- Browse public communities and topics

**Limitations:**
- Cannot create private content
- No encrypted data access
- Limited interaction capabilities

**Use Cases:**
- Exploring the platform before registration
- Accessing public community content
- Discovery of local communities and events

### 2. Email Authentication - Magic Links
**Verified identity with server-side account**

**Process:**
1. User provides email address
2. System sends verification magic link
3. User created when email verified
4. Subsequent logins via magic link

**Capabilities:**
- Create and edit public profiles
- Read + Write public data
- Join public communities
- Basic community participation

**Limitations:**
- No private data encryption
- Profile tied to email identity
- Requires email service availability

**Use Cases:**
- Quick onboarding for new users
- Users who prioritize simplicity over privacy
- Temporary access for specific events

### 3. WebAuthn (Passkeys) - Secure Authentication
**Modern, secure authentication with biometric protection**

**Process:**
1. User creates WebAuthn credential
2. Private key stored in device's secure hardware
3. Authentication via biometric (fingerprint, Face ID, etc.)
4. Derived Gun.js credentials from WebAuthn rawId

**Capabilities:**
- Full platform access
- Secure, passwordless authentication
- Hardware-backed security
- Integration with Gun.js identity

**Benefits:**
- Phishing resistant
- No passwords to remember
- Hardware-backed security
- Cross-device synchronization (platform dependent)

**Use Cases:**
- Security-conscious users
- Long-term platform engagement
- Users with compatible devices

### 4. Gun.js - P2P Encrypted Identity
**Decentralized, encrypted identity for maximum privacy**

**Process:**
1. Creates cryptographic key pair
2. Private key stored client-side only
3. Can be accessed via password or integrated with Passkeys
4. Encrypted private data space

**Capabilities:**
- Full decentralized identity
- Create + Read + Write private encrypted data
- P2P data synchronization
- No server dependency for identity

**Integration Options:**
- **Standalone**: Password-protected Gun.js identity
- **Passkey Integration**: WebAuthn rawId derives Gun.js credentials
- **Anonymous**: Guest -> Gun.js with encrypted keypair

**Use Cases:**
- Privacy-focused users
- Decentralized identity advocates
- Users in regions with restricted internet

## User Flow Progressions

### Progressive Onboarding
Users can move through authentication layers as their needs and comfort level increase:

```
Guest Access → Email Verification → WebAuthn → Gun.js Integration
```

### Alternative Paths
Different users can choose different authentication journeys:

```
Guest → Gun.js Anonymous (privacy-first)
Guest → Email → WebAuthn (security-first)
Guest → Email → Gun.js (decentralization-first)
```

## Implementation Details

### Current Architecture
TopLocs currently implements:
- **WebAuthn (Passkeys)**: Primary authentication method
- **Gun.js Integration**: Derived credentials from WebAuthn rawId
- **Guest Access**: Public content browsing

### Historical Context
The original authentication strategy envisioned:
- **Progressive disclosure**: Users start with less commitment, upgrade as needed
- **Multiple identity types**: Different use cases require different authentication
- **P2P foundation**: Ultimate goal of decentralized identity

### Technical Integration
```javascript
// WebAuthn -> Gun.js credential derivation
const gunCredentials = deriveFromWebAuthn(webAuthnRawId);
gun.user().auth(gunCredentials.username, gunCredentials.password);
```

## Privacy Considerations

### Data Encryption Levels
- **Guest**: No private data
- **Email**: Server-side profile storage
- **WebAuthn**: Secure authentication, can enable encryption
- **Gun.js**: Client-side encrypted private data

### Identity Portability
- **Email**: Tied to email provider
- **WebAuthn**: Device-dependent but platform-portable
- **Gun.js**: Fully portable via key backup

### Anonymity Options
- **Guest**: Anonymous browsing
- **Gun.js Anonymous**: Encrypted identity without email
- **Profile Separation**: Multiple profiles for different contexts

## Security Benefits

### Layered Security
- **Guest**: No credentials to compromise
- **Email**: Server-side rate limiting and monitoring
- **WebAuthn**: Hardware security module protection
- **Gun.js**: Cryptographic identity, no server dependency

### Threat Mitigation
- **Phishing**: WebAuthn is phishing-resistant
- **Data Breaches**: Gun.js encrypted data can't be decrypted server-side
- **Identity Theft**: Hardware-backed authentication prevents credential theft
- **Censorship**: P2P identity survives server takedowns

## Future Enhancements

### Planned Features
- **Cross-device synchronization**: Secure identity sync across devices
- **Recovery mechanisms**: Social recovery for lost credentials
- **Identity bridging**: Link multiple authentication methods
- **Delegation**: Temporary access grants for specific use cases

### Research Areas
- **Zero-knowledge proofs**: Prove identity without revealing it
- **Decentralized identity standards**: W3C DID integration
- **Hardware security modules**: Enhanced security for high-value identities
- **Quantum-resistant cryptography**: Future-proof identity protection

## Developer Guidance

### Implementation Considerations
- **Progressive enhancement**: Start with simpler auth, add complexity as needed
- **Error handling**: Graceful degradation when auth methods fail
- **User education**: Clear explanations of security tradeoffs
- **Testing**: Multi-device, multi-browser authentication testing

### Security Best Practices
- **Key management**: Secure storage of cryptographic materials
- **Session management**: Proper timeout and invalidation
- **Audit logging**: Track authentication events for security monitoring
- **Backup strategies**: Help users safely backup and recover identities

This multi-layer authentication strategy provides **flexibility, security, and privacy** while supporting TopLocs' decentralized architecture and diverse user needs.