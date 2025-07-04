# TopLocs Documentation Site

This Docusaurus site aggregates and presents documentation from across the entire TopLocs ecosystem in a unified, searchable interface.

🌐 **Live Site**: https://toplocs.github.io/toplocs-workspace/

## 📚 Documentation Sources

This site pulls documentation from multiple repositories:

### 1. Workspace Documentation (`/docs`)
- **Source**: `toplocs-workspace/docs/` 
- **Route**: `/docs`
- **Content**: 
  - Getting started guides
  - Ecosystem overview
  - Development workflows
  - Automation documentation

### 2. Core Platform Documentation (`/tribelike`)
- **Source**: `tribelike/docs/`
- **Route**: `/tribelike`
- **Content**:
  - P2P architecture details
  - Platform-specific guides
  - Debug tools documentation
  - Plugin development

### 3. Future Plugin Documentation
Additional plugin documentation can be added by configuring new instances in `docusaurus.config.ts`:
```typescript
{
  id: 'plugin-name',
  path: '../plugin-name/docs',
  routeBasePath: 'plugins/plugin-name',
  // ...
}
```

## 🏗️ Repository Structure

```
toplocs/
├── docusaurus/              # This Docusaurus site
│   ├── docs/               # (not used - docs come from other repos)
│   ├── src/                # Custom components and pages
│   ├── static/             # Static assets (images, etc.)
│   └── docusaurus.config.ts # Multi-instance docs configuration
├── docs/                    # Workspace documentation (from toplocs-workspace)
├── tribelike/
│   └── docs/               # Core platform documentation
└── [other-repos]/
    └── docs/               # Plugin-specific documentation
```

## 🚀 Local Development

### Prerequisites
- Node.js >= 20
- pnpm (package manager)

### Setup
```bash
# Install dependencies
pnpm install

# Start development server
pnpm start
# Opens at http://localhost:3000/toplocs-workspace/

# Build for production
pnpm build

# Test production build locally
pnpm serve
```

## 🎨 Customization

### Theme
- **Colors**: Based on TopLocs cyan branding (#00d4ff)
- **Dark Mode**: Header/footer always dark, content toggleable
- **Logo**: TopLocs logo in navbar
- **CSS**: Custom styles in `src/css/custom.css`

### Adding New Documentation Sources
1. Clone the repository with docs to the parent directory
2. Add configuration to `docusaurus.config.ts`:
```typescript
plugins: [
  [
    '@docusaurus/plugin-content-docs',
    {
      id: 'new-repo',
      path: '../new-repo/docs',
      routeBasePath: 'new-repo',
      sidebarPath: './sidebars.ts',
      editUrl: 'https://github.com/toplocs/new-repo/tree/main/',
    },
  ],
]
```
3. Add navigation in the navbar section

## 📦 GitHub Pages Deployment

### Automatic Deployment
The site automatically deploys to GitHub Pages when changes are pushed to the `main` branch.

### GitHub Actions Workflow
Located at `.github/workflows/deploy-docs.yml`:

```yaml
name: Deploy Docusaurus to GitHub Pages

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - Checkout code
      - Setup Node.js 20
      - Install pnpm
      - Install dependencies
      - Build Docusaurus
      - Upload artifact

  deploy:
    needs: build
    steps:
      - Deploy to GitHub Pages
```

### Manual Deployment
```bash
# Build the site
pnpm build

# Deploy (requires GitHub Pages configuration)
GIT_USER=<Your GitHub username> pnpm deploy
```

### GitHub Pages Configuration
1. Go to Settings → Pages in the toplocs-workspace repository
2. Source: GitHub Actions
3. The site will be available at: https://toplocs.github.io/toplocs-workspace/

## 🔧 Configuration Files

- **`docusaurus.config.ts`**: Main configuration, multi-instance docs setup
- **`sidebars.ts`**: Sidebar generation (currently auto-generated)
- **`src/css/custom.css`**: Custom styling and theme colors
- **`src/pages/index.tsx`**: Homepage component
- **`src/components/HomepageFeatures/`**: Feature cards on homepage

## 🤝 Contributing

### Adding/Updating Documentation
1. Documentation lives in the source repositories (not in this repo)
2. Make changes in the respective repository's `docs/` folder
3. Changes will be reflected when this site is rebuilt

### Updating the Documentation Site
1. Fork and clone this repository
2. Make changes to components, styling, or configuration
3. Test locally with `pnpm start`
4. Submit a pull request

## 🐛 Troubleshooting

### "The docs folder does not exist"
- Ensure all source repositories are cloned at the same level as the docusaurus folder
- Check that the paths in `docusaurus.config.ts` match your local structure

### Build Failures
- Run `pnpm install` to ensure all dependencies are installed
- Check that Node.js version is >= 20
- Clear cache: `rm -rf .docusaurus build`

### GitHub Pages Not Updating
- Check GitHub Actions tab for build status
- Ensure GitHub Pages is configured to use "GitHub Actions" as source
- Verify the `baseUrl` in config matches your GitHub Pages URL

## 📄 License

MIT License - Part of the TopLocs ecosystem

---

**Questions?** Check the [main documentation](https://toplocs.github.io/toplocs-workspace/) or open an issue!