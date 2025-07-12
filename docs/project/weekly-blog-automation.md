# Weekly Blog Automation

The TopLocs ecosystem includes an automated weekly blog generation system that analyzes development activity and creates comprehensive blog posts using Claude AI.

## 🎯 Overview

Every Saturday at 9 AM UTC, the system:
1. **Analyzes** all TopLocs repositories for the past week's activity
2. **Evaluates** commits, pull requests, and contributor activity
3. **Generates** a comprehensive blog post using Claude AI
4. **Creates** a pull request with the new blog post
5. **Highlights** contributors with specific praise for their work

## ⚙️ Setup Requirements

### GitHub Secrets

The workflow requires one secret to be configured in the repository settings:

#### `ANTHROPIC_API_KEY`
- **Purpose**: Enables Claude AI to generate blog posts
- **Setup**: 
  1. Go to [Anthropic Console](https://console.anthropic.com/)
  2. Create an API key
  3. Add it to GitHub repository secrets at: `Settings > Secrets and variables > Actions > New repository secret`
  4. Name: `ANTHROPIC_API_KEY`
  5. Value: Your Anthropic API key

### GitHub Permissions

The workflow uses `GITHUB_TOKEN` (automatically available) with these permissions:
- `contents: write` - To create and modify files
- `pull-requests: write` - To create pull requests
- `issues: write` - For issue management
- `repository-projects: write` - For project management

## 📅 Schedule and Triggers

### Automatic Schedule
- **When**: Every Saturday at 9:00 AM UTC
- **Cron**: `0 9 * * 6`
- **Purpose**: Weekly roundup of development activity

### Manual Triggers
The workflow can be manually triggered with options:

#### Week Override
- **Purpose**: Generate blog for specific week period
- **Format**: `YYYY-MM-DD to YYYY-MM-DD`
- **Example**: `2025-07-05 to 2025-07-12`

#### Force Publish
- **Purpose**: Generate blog even with minimal activity
- **Use case**: Important weeks with strategic updates but low commit volume

## 🔍 Activity Analysis

### Repositories Monitored
The system analyzes activity across all TopLocs repositories:
- `toplocs-workspace` - Ecosystem coordination
- `tribelike` - Core P2P platform
- `locations` - Mobile application
- All plugin repositories (`*-plugin`)
- Development tools and SDKs
- Experimental repositories

### Metrics Collected
- **Commits**: Number and details of commits
- **Pull Requests**: Created, updated, and merged PRs
- **Contributors**: Active developers and their contributions
- **Code Impact**: Lines added/removed, files changed
- **Technical Focus**: Feature development, bug fixes, documentation

### Activity Threshold
Blog posts are generated when:
- **5+ commits** across the ecosystem, OR
- **2+ pull requests** activity, OR
- **Force publish** is manually enabled

## 🤖 AI Blog Generation

### Claude AI Prompt Structure
The system provides Claude with:
1. **Week summary** with metrics and activity
2. **Repository details** with commit messages and PR titles
3. **Contributor information** for recognition
4. **Technical context** about the TopLocs ecosystem
5. **Output format** requirements for Docusaurus

### Blog Post Structure
Generated posts include:
- **Executive summary** of the week's highlights
- **Feature releases** and major updates
- **Plugin ecosystem** developments
- **Infrastructure improvements** and DevOps updates
- **Technical learnings** and architectural insights
- **Contributor highlights** with specific praise
- **Forward-looking** content and upcoming priorities
- **Community impact** assessment

### Content Quality
- **800-1200 words** comprehensive coverage
- **Technical accuracy** with code metrics
- **Contributor recognition** with specific achievements
- **Accessible tone** for technical and non-technical readers
- **SEO optimization** with proper tags and metadata

## 📝 Blog Post Format

### Docusaurus Integration
Generated blog posts include:
- **Frontmatter** with metadata, authors, tags, and date
- **Slug generation** for SEO-friendly URLs
- **Author attribution** based on weekly contributors
- **Tag categorization** for content organization
- **Proper markdown** formatting for Docusaurus

### File Naming
- **Pattern**: `YYYY-MM-DD-weekly-update-YYYY-MM-DD.md`
- **Location**: `docusaurus/blog/`
- **Example**: `2025-07-12-weekly-update-2025-07-12.md`

## 🔄 Pull Request Process

### Automated PR Creation
The system creates pull requests with:
- **Descriptive title** including the blog post title
- **Comprehensive body** with week summary and metrics
- **Ready for review** status with all necessary metadata
- **Proper attribution** to Claude AI and GitHub Actions

### Review Process
1. **Automated creation** every Saturday
2. **Team review** for accuracy and tone
3. **Edit if needed** using GitHub's web editor
4. **Merge** to publish the blog post
5. **Auto-deployment** via Docusaurus build

## 📊 Monitoring and Troubleshooting

### Workflow Status
Monitor workflow execution at:
- `Actions` tab in GitHub repository
- Weekly run logs every Saturday
- Manual trigger logs when needed

### Common Issues

#### Low Activity Weeks
- **Symptom**: No blog post generated
- **Cause**: Less than 5 commits and 2 PRs
- **Solution**: Use manual trigger with `force_publish: true`

#### API Key Issues
- **Symptom**: Workflow fails at blog generation step
- **Cause**: Missing or invalid `ANTHROPIC_API_KEY`
- **Solution**: Verify secret configuration in repository settings

#### Content Quality
- **Issue**: Blog post needs editing
- **Solution**: Edit PR content before merging
- **Best practice**: Team review process for accuracy

### Success Metrics
- **Consistency**: Weekly blog posts published
- **Quality**: Comprehensive coverage of development activity
- **Accuracy**: Correct attribution and technical details
- **Engagement**: Community response to blog content

## 🚀 Benefits

### Development Team
- **Recognition**: Automatic contributor highlighting
- **Documentation**: Historical record of development progress
- **Motivation**: Regular celebration of achievements
- **Transparency**: Public visibility of development activity

### Community
- **Engagement**: Regular updates on project progress
- **Learning**: Technical insights and development practices
- **Trust**: Transparent development process
- **Involvement**: Understanding of contribution opportunities

### Project Management
- **Historical record**: Automated documentation of progress
- **Milestone tracking**: Regular assessment of development velocity
- **Team coordination**: Shared understanding of weekly achievements
- **Strategic planning**: Data-driven insights for future planning

## 🛠️ Customization

### Workflow Modifications
Edit `.github/workflows/weekly-blog-generator.yml` to:
- **Change schedule**: Modify cron expression
- **Adjust repositories**: Add/remove repositories from analysis
- **Modify thresholds**: Change activity requirements
- **Customize prompts**: Enhance Claude AI instructions

### Blog Template Changes
Modify the Claude prompt to:
- **Change structure**: Adjust blog post sections
- **Modify tone**: Technical depth or accessibility
- **Add sections**: New analysis areas or metrics
- **Enhance recognition**: More detailed contributor praise

This automation system ensures consistent, high-quality blog content that celebrates development achievements and keeps the community informed about TopLocs progress.