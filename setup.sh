#!/bin/bash
set -e

echo "=== EC2 Instance Setup ==="

# 1. Update and upgrade system packages
echo ">>> Updating and upgrading system packages..."
sudo apt update && sudo apt upgrade -y

# 2. Install nvm
echo ">>> Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Load nvm immediately so we can use it in this script
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# 3. Install Node.js LTS
echo ">>> Installing Node.js LTS..."
nvm install --lts
nvm use --lts

# 4. Install Codex CLI
echo ">>> Installing Codex CLI..."
npm i -g @openai/codex

# 5. Install GitHub CLI, htop, nvtop, and btop
echo ">>> Installing GitHub CLI, htop, nvtop, and btop..."
sudo apt install -y gh htop nvtop btop

# 6. Install Claude Code CLI

echo ">>> Installing Claude Code CLI..."
curl -fsSL https://claude.ai/install.sh | bash

# 8. Add aliases to ~/.bashrc
echo ">>> Adding aliases to ~/.bashrc..."
cat >> ~/.bashrc << 'EOF'

# CLI aliases
alias cdsp="claude --dangerously-skip-permissions"
alias cxdsp="codex --dangerously-bypass-approvals-and-sandbox"
EOF

# Reload bashrc
source ~/.bashrc

echo ""
echo "=== Setup complete! ==="
echo "Run 'gh auth login' to authenticate with GitHub."
