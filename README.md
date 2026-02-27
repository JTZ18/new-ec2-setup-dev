# EC2 Setup Script

One-command setup for a fresh EC2 instance with my standard dev tools.

## Usage

```bash
git clone https://github.com/JTZ18/new-ec2-setup-dev.git
cd new-ec2-setup-dev
./setup.sh
```

After setup completes, authenticate with GitHub:

```bash
gh auth login
```

## What it installs

| Tool | Description |
|------|-------------|
| nvm | Node version manager |
| Node.js LTS | Latest LTS version via nvm |
| Codex CLI | OpenAI's coding agent (`@openai/codex`) |
| Claude Code CLI | Anthropic's coding agent |
| GitHub CLI (`gh`) | GitHub from the terminal |
| htop | Interactive process viewer |
| nvtop | GPU process monitor |
| btop | Resource monitor |

## Aliases added to `~/.bashrc`

| Alias | Command |
|-------|---------|
| `cdsp` | `claude --dangerously-skip-permissions` |
| `cxdsp` | `codex --dangerously-bypass-approvals-and-sandbox` |
