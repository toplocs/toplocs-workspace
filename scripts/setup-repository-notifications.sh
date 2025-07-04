#!/bin/bash

# TopLocs Repository Notification Setup Script
# This script sets up automatic workspace notifications for all TopLocs repositories

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
WORKSPACE_REPO="toplocs/toplocs-workspace"
WORKFLOW_FILE="notify-workspace.yml"

# List of repositories to set up
REPOSITORIES=(
    "toplocs/tribelike"
    "toplocs/locations"
    "toplocs/event-plugin"
    "toplocs/wiki-plugin"
    "toplocs/location-plugin"
    "toplocs/link-plugin"
    "toplocs/demo-plugin"
    "toplocs/tribelike.wiki"
)

# Functions
print_header() {
    echo -e "${BLUE}=================================="
    echo -e "TopLocs Repository Notification Setup"
    echo -e "==================================${NC}"
    echo ""
}

print_step() {
    echo -e "${YELLOW}📋 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

check_requirements() {
    print_step "Checking requirements..."
    
    # Check if gh CLI is installed
    if ! command -v gh &> /dev/null; then
        print_error "GitHub CLI (gh) is not installed"
        echo "Please install it from: https://cli.github.com/"
        exit 1
    fi
    
    # Check if user is authenticated
    if ! gh auth status &> /dev/null; then
        print_error "Not authenticated with GitHub CLI"
        echo "Please run: gh auth login"
        exit 1
    fi
    
    print_success "Requirements check passed"
}

create_workflow_content() {
    cat << 'EOF'
name: Notify Workspace on Changes

on:
  push:
    branches: [main, master]
  pull_request:
    types: [closed]
    branches: [main, master]

jobs:
  notify-workspace:
    if: github.event_name == 'push' || (github.event_name == 'pull_request' && github.event.pull_request.merged == true)
    runs-on: ubuntu-latest
    
    steps:
    - name: Notify toplocs-workspace
      uses: peter-evans/repository-dispatch@v2
      with:
        token: ${{ secrets.WORKSPACE_DISPATCH_TOKEN }}
        repository: toplocs/toplocs-workspace
        event-type: repository-updated
        client-payload: |
          {
            "repository": "${{ github.repository }}",
            "ref": "${{ github.ref }}",
            "sha": "${{ github.sha }}",
            "event_type": "${{ github.event_name }}",
            "timestamp": "${{ github.event.head_commit.timestamp || github.event.pull_request.merged_at }}",
            "pusher": "${{ github.event.pusher.name || github.event.pull_request.user.login }}",
            "commit_message": "${{ github.event.head_commit.message || github.event.pull_request.title }}"
          }
EOF
}

setup_repository() {
    local repo=$1
    local temp_dir="/tmp/toplocs-setup-$(basename $repo)"
    
    print_step "Setting up notifications for $repo..."
    
    # Clean up any existing temp directory
    rm -rf "$temp_dir"
    
    # Clone repository
    if ! git clone "git@github.com:$repo.git" "$temp_dir" &> /dev/null; then
        print_error "Failed to clone $repo"
        return 1
    fi
    
    cd "$temp_dir"
    
    # Create .github/workflows directory if it doesn't exist
    mkdir -p .github/workflows
    
    # Create the workflow file
    create_workflow_content > ".github/workflows/$WORKFLOW_FILE"
    
    # Check if file was created successfully
    if [ ! -f ".github/workflows/$WORKFLOW_FILE" ]; then
        print_error "Failed to create workflow file for $repo"
        cd - > /dev/null
        rm -rf "$temp_dir"
        return 1
    fi
    
    # Add, commit, and push the changes
    git add ".github/workflows/$WORKFLOW_FILE"
    
    # Check if there are changes to commit
    if git diff --staged --quiet; then
        print_info "Workflow already exists for $repo"
    else
        git commit -m "Add workspace notification workflow

        - Automatically notify toplocs-workspace on main branch changes
        - Enables AI-driven documentation updates
        - Supports both push and merged PR events"
        
        if git push origin HEAD &> /dev/null; then
            print_success "Workflow added to $repo"
        else
            print_error "Failed to push workflow to $repo"
            cd - > /dev/null
            rm -rf "$temp_dir"
            return 1
        fi
    fi
    
    # Clean up
    cd - > /dev/null
    rm -rf "$temp_dir"
    
    return 0
}

setup_secrets() {
    print_step "Setting up repository secrets..."
    
    # Check if we can access the workspace repository
    if ! gh repo view "$WORKSPACE_REPO" &> /dev/null; then
        print_error "Cannot access workspace repository: $WORKSPACE_REPO"
        return 1
    fi
    
    print_info "Please ensure each repository has the WORKSPACE_DISPATCH_TOKEN secret configured"
    print_info "This token should have workflow permissions for the workspace repository"
    echo ""
    print_info "You can set up the secret with:"
    echo "  gh secret set WORKSPACE_DISPATCH_TOKEN --repo [REPOSITORY] --body [TOKEN]"
    echo ""
    
    # List repositories that need the secret
    print_info "Repositories that need the WORKSPACE_DISPATCH_TOKEN secret:"
    for repo in "${REPOSITORIES[@]}"; do
        echo "  - $repo"
    done
}

main() {
    print_header
    
    check_requirements
    echo ""
    
    # Track success/failure
    local successful=0
    local failed=0
    local failed_repos=()
    
    # Set up each repository
    for repo in "${REPOSITORIES[@]}"; do
        if setup_repository "$repo"; then
            ((successful++))
        else
            ((failed++))
            failed_repos+=("$repo")
        fi
        echo ""
    done
    
    # Summary
    print_header
    echo -e "${GREEN}Setup Summary:${NC}"
    echo "  ✅ Successful: $successful repositories"
    echo "  ❌ Failed: $failed repositories"
    
    if [ $failed -gt 0 ]; then
        echo ""
        echo -e "${RED}Failed repositories:${NC}"
        for repo in "${failed_repos[@]}"; do
            echo "  - $repo"
        done
    fi
    
    echo ""
    setup_secrets
    
    echo ""
    print_success "Repository notification setup complete!"
    print_info "Don't forget to configure the WORKSPACE_DISPATCH_TOKEN secret for each repository"
}

# Handle command line arguments
case "${1:-}" in
    --help|-h)
        echo "TopLocs Repository Notification Setup"
        echo ""
        echo "Usage: $0 [options]"
        echo ""
        echo "Options:"
        echo "  --help, -h     Show this help message"
        echo "  --dry-run      Show what would be done without making changes"
        echo ""
        echo "This script sets up GitHub Actions workflows in all TopLocs repositories"
        echo "to automatically notify the workspace when changes are made."
        exit 0
        ;;
    --dry-run)
        echo "DRY RUN MODE - No changes will be made"
        echo ""
        echo "Would set up notification workflows for:"
        for repo in "${REPOSITORIES[@]}"; do
            echo "  - $repo"
        done
        echo ""
        echo "Workflow file would be: .github/workflows/$WORKFLOW_FILE"
        exit 0
        ;;
    "")
        main
        ;;
    *)
        echo "Unknown option: $1"
        echo "Use --help for usage information"
        exit 1
        ;;
esac