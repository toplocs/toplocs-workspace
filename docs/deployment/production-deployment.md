# Production Deployment

**Manual deployment process for TopLocs platform**

This document outlines the production deployment process based on the original deployment workflow, updated for the current P2P architecture.

## Overview

TopLocs deployment consists of:
- **Client**: Vue.js frontend built as static files
- **Server**: Minimal Express server running Gun.js relay
- **Database**: PostgreSQL for user authentication (optional)
- **Reverse Proxy**: Nginx for HTTPS and routing

## Prerequisites

### Server Requirements
- **Operating System**: Ubuntu 20.04+ or similar Linux distribution
- **Node.js**: Version 18+ with npm/pnpm
- **Database**: PostgreSQL 12+ (optional, for enhanced auth)
- **Web Server**: Nginx for reverse proxy
- **Process Manager**: PM2 for process management

### Domain and SSL
- Domain name pointing to server IP
- SSL certificate (Let's Encrypt recommended)
- DNS configuration for subdomains if needed

## Deployment Steps

### 1. Build the Application

**On Development Machine:**
```bash
# Navigate to tribelike directory
cd tribelike

# Install dependencies
pnpm install

# Build the client
pnpm run build-only

# The build creates dist/ directory with static files
```

### 2. Create Server Archive

**Package Server Code:**
```bash
# Navigate to server directory
cd server

# Create archive excluding node_modules
tar -czf ../tribelike-server.tar.gz \
  --exclude='node_modules' \
  --exclude='ra-data' \
  --exclude='*.log' \
  .

# Move to parent directory
cd ..

# Archive should now be in tribelike/
```

### 3. Upload to Server

**Transfer Files:**
```bash
# Upload server archive
scp tribelike-server.tar.gz root@your-server-ip:/uploads/

# Upload client build
scp -r client/dist root@your-server-ip:/uploads/client-dist/
```

### 4. Server Setup

**Connect to Server:**
```bash
ssh root@your-server-ip
```

**Extract and Setup:**
```bash
# Create application directory
mkdir -p /var/www/toplocs
cd /var/www/toplocs

# Extract server files
tar -xzf /uploads/tribelike-server.tar.gz

# Copy client files
cp -r /uploads/client-dist/* ./public/

# Install dependencies
npm install
```

### 5. Database Setup (Optional)

**For Enhanced Authentication:**
```bash
# Install PostgreSQL
sudo apt update
sudo apt install postgresql postgresql-contrib

# Configure PostgreSQL
sudo -i -u postgres
psql
ALTER USER postgres PASSWORD 'your_secure_password';
\q
exit
```

**Environment Configuration:**
```bash
# Create .env file
cat > .env << EOF
DATABASE_URL="postgresql://postgres:your_secure_password@localhost:5432/toplocs"
NODE_ENV=production
PORT=3000
EOF
```

**Database Migration:**
```bash
# Run database migrations (if using Prisma)
npx prisma migrate deploy

# Or initialize database
npx prisma db push
```

### 6. Build and Start Application

**Build Server:**
```bash
# Build TypeScript (if applicable)
npm run build

# Test the application
npm start
```

**Verify Application:**
```bash
# Check if application is running
curl http://localhost:3000

# Should return the TopLocs application
```

### 7. Process Management

**Install PM2:**
```bash
npm install -g pm2
```

**Start Application with PM2:**
```bash
# Start the application
pm2 start 'npm run start' --name toplocs

# Save PM2 configuration
pm2 save

# Setup PM2 startup
pm2 startup
# Follow the generated command
```

**Monitor Application:**
```bash
# View application status
pm2 status

# View logs
pm2 logs toplocs

# Restart application
pm2 restart toplocs
```

### 8. Nginx Configuration

**Install Nginx:**
```bash
sudo apt install nginx
```

**Configure Nginx:**
```bash
# Create configuration file
sudo nano /etc/nginx/sites-available/toplocs

# Add configuration:
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

**Enable Configuration:**
```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/toplocs /etc/nginx/sites-enabled/

# Test configuration
sudo nginx -t

# Restart Nginx
sudo systemctl restart nginx
```

### 9. SSL Configuration

**Install Certbot:**
```bash
sudo apt install certbot python3-certbot-nginx
```

**Obtain SSL Certificate:**
```bash
# Get certificate
sudo certbot --nginx -d your-domain.com

# Verify auto-renewal
sudo certbot renew --dry-run
```

## Gun.js P2P Configuration

### Relay Configuration

**Server Configuration:**
```javascript
// server/src/gun.ts
import Gun from 'gun'
import 'gun/sea'
import 'gun/axe'

// Configure Gun.js relay
const gun = Gun({
  web: app,
  peers: [
    'https://gun-manhattan.herokuapp.com/gun',
    'https://gun-us.herokuapp.com/gun'
  ]
})

export default gun
```

**Client Configuration:**
```javascript
// client/src/services/gun.ts
import Gun from 'gun'
import 'gun/sea'
import 'gun/axe'

// Production Gun.js configuration
const gun = Gun({
  peers: [
    'https://your-domain.com/gun',
    'https://gun-manhattan.herokuapp.com/gun'
  ]
})

export default gun
```

### P2P Network Health

**Monitor Gun.js:**
```bash
# Check Gun.js endpoint
curl https://your-domain.com/gun

# Should return Gun.js peer information
```

## Environment Variables

**Server Environment:**
```bash
# .env file
NODE_ENV=production
PORT=3000
DATABASE_URL=postgresql://...
GUN_PEERS=https://gun-manhattan.herokuapp.com/gun,https://gun-us.herokuapp.com/gun
```

**Client Environment:**
```bash
# Build-time environment variables
VITE_GUN_PEERS=https://your-domain.com/gun,https://gun-manhattan.herokuapp.com/gun
VITE_API_URL=https://your-domain.com/api
```

## Security Configuration

### Firewall Setup
```bash
# Configure UFW firewall
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 'Nginx Full'
sudo ufw allow 3000  # If direct access needed
```

### File Permissions
```bash
# Set proper permissions
chown -R www-data:www-data /var/www/toplocs
chmod -R 755 /var/www/toplocs
```

## Monitoring and Maintenance

### Log Management
```bash
# View application logs
pm2 logs toplocs

# View Nginx logs
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log

# View system logs
journalctl -u nginx
```

### Backup Strategy
```bash
# Backup database (if using PostgreSQL)
pg_dump toplocs > backup-$(date +%Y%m%d).sql

# Backup Gun.js data
tar -czf gun-data-$(date +%Y%m%d).tar.gz /var/www/toplocs/radata/
```

### Updates and Maintenance
```bash
# Update system packages
sudo apt update && sudo apt upgrade

# Update Node.js dependencies
npm update

# Restart application
pm2 restart toplocs
```

## Troubleshooting

### Common Issues

**Application Won't Start:**
```bash
# Check logs
pm2 logs toplocs

# Check port usage
netstat -tlnp | grep :3000

# Check environment variables
cat .env
```

**Database Connection Issues:**
```bash
# Test database connection
psql -h localhost -U postgres -d toplocs

# Check database service
sudo systemctl status postgresql
```

**Nginx Issues:**
```bash
# Test Nginx configuration
sudo nginx -t

# Check Nginx status
sudo systemctl status nginx

# Restart Nginx
sudo systemctl restart nginx
```

### Performance Optimization

**PM2 Cluster Mode:**
```bash
# Start in cluster mode
pm2 start ecosystem.config.js

# ecosystem.config.js
module.exports = {
  apps: [{
    name: 'toplocs',
    script: './dist/app.js',
    instances: 'max',
    exec_mode: 'cluster',
    env: {
      NODE_ENV: 'production'
    }
  }]
}
```

**Nginx Optimization:**
```nginx
# Add to nginx configuration
gzip on;
gzip_types text/plain text/css application/json application/javascript;

# Cache static files
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
    expires 1y;
    add_header Cache-Control "public, no-transform";
}
```

## Scaling Considerations

### Multiple Servers
- Use load balancer for multiple server instances
- Shared database for authentication
- Gun.js P2P network provides data sync

### CDN Integration
- Serve static assets from CDN
- Cache Gun.js data at edge locations
- Reduce server load and improve performance

### Plugin Deployment
- Deploy plugins as separate services
- Use Gun.js for plugin registration
- Enable dynamic plugin loading

This deployment guide provides a **production-ready setup** for TopLocs while maintaining the **P2P architecture** and **user data ownership** principles.