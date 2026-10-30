# personal-claude-md

My personal, user-level [Claude Code](https://claude.com/claude-code) instructions, shared across machines.

## Setup on a new computer

```sh
git clone https://github.com/pkfire13/personal-claude-md.git ~/personal-claude-md
~/personal-claude-md/install.sh
```

`install.sh` does two things:

1. Symlinks `~/.claude/CLAUDE.md` to `.claude/CLAUDE.md` in this repo. An existing `CLAUDE.md` that isn't already a symlink is backed up first.
2. Installs [codebase-memory-mcp](https://github.com/DeusData/codebase-memory-mcp) to `~/.local/bin` if it's missing, and registers it with Claude Code at user scope (`claude mcp add --scope user`). Restart Claude Code and check `/mcp` afterwards.

Run `./install.sh --no-mcp` to skip step 2.

## Updating

Edit `.claude/CLAUDE.md` here (or via `~/.claude/CLAUDE.md`, which is the same file), commit, and push. On other machines, `git pull` is enough.
