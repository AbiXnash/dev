# dev

Scripts that set up my Arch Linux development machine. `setup.sh` checks that it's on Arch, then runs the scripts in
`scripts/` in order.

| Step | Script | What it does |
|------|--------|--------------|
| 1 | `scripts/pacman.sh` | `pacman -Syu`, then man pages and the basics: VLC, tmux, tree, stow, Neovim, lsd, btop, git, GitHub CLI, Docker |
| 2 | (in `setup.sh`) | Builds and installs [paru](https://github.com/Morganamilo/paru) from the AUR if it's missing |
| 3 | `scripts/paru.sh` | Updates AUR packages, then asks one by one: Eclipse, Postman, JetBrains Toolbox, Notion, Spotify, Discord, and the terminals WezTerm, kitty, Ghostty, Alacritty |
| 4 | `scripts/lang.sh` | Asks one by one: Python (pip, pyenv, LuaRocks, Lua 5.1), Node.js and npm, Java (JDK 21, Maven, docs), Rust (rustup), Go |

## Run it

```bash
git clone https://github.com/AbiXnash/dev.git
cd dev
./setup.sh
```

It uses `sudo` and installs packages with `--noconfirm`, so read the scripts first. Steps 3 and 4 ask before each
optional install.

My current setup is macOS: see [dotfiles](https://github.com/AbiXnash/dotfiles/tree/mac).
