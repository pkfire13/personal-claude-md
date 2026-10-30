#!/usr/bin/env bash
# Symlink this repo's .claude/CLAUDE.md into ~/.claude and set up user-level MCP servers.
# Usage: ./install.sh [--no-mcp]
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target_dir="$HOME/.claude"
target="$target_dir/CLAUDE.md"
skip_mcp=false
[ "${1:-}" = "--no-mcp" ] && skip_mcp=true

mkdir -p "$target_dir"

if [ -e "$target" ] && [ ! -L "$target" ]; then
  backup="$target.backup.$(date +%Y%m%d%H%M%S)"
  mv "$target" "$backup"
  echo "Backed up existing CLAUDE.md to $backup"
fi

ln -sfn "$repo_dir/.claude/CLAUDE.md" "$target"
echo "Linked $target -> $repo_dir/.claude/CLAUDE.md"

$skip_mcp && exit 0

# codebase-memory-mcp: local code knowledge graph (https://github.com/DeusData/codebase-memory-mcp)
export PATH="$HOME/.local/bin:$PATH"
if ! command -v codebase-memory-mcp >/dev/null 2>&1; then
  echo "Installing codebase-memory-mcp binary to ~/.local/bin"
  # --skip-config: install only the binary; we register it with Claude Code below.
  curl -fsSL https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.sh | bash -s -- --skip-config
fi

if ! command -v claude >/dev/null 2>&1; then
  echo "Claude Code CLI not found; skipping MCP registration. Re-run after installing it."
  exit 0
fi

if claude mcp get codebase-memory-mcp >/dev/null 2>&1; then
  echo "codebase-memory-mcp already registered with Claude Code"
else
  claude mcp add --scope user codebase-memory-mcp -- "$(command -v codebase-memory-mcp)"
  echo "Registered codebase-memory-mcp with Claude Code (user scope)"
fi
