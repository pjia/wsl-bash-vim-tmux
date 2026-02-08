# WSL-Bash-Vim-Tmux (Simplified & Go-Centric)

A minimalist yet powerful development environment for WSL, optimized for **Go development** and **AI-assisted coding**. Heavy plugins and legacy C++ configurations have been removed in favor of speed and copy-paste efficiency.

## 🚀 Tmux Usage

The Tmux configuration features a beautiful Molokai-style status line and is optimized for cross-window workflows.

- **Prefix**: `Ctrl-a` (replaces the default `Ctrl-b`)
- **🖱️ Mouse Toggle (`Prefix + m`)**:
    - **ON**: Easy scrolling and pane resizing.
    - **OFF**: Best for **native terminal selection and copy-pasting** to AI chat or other apps.
- **💾 Session Management** (via `tmux-resurrect`):
    - `Prefix + Ctrl-s`: Save current session.
    - `Prefix + Ctrl-r`: Restore last saved session.
- **🔄 Reload Config**: `Prefix + r`
- **Navigation**: VI mode keys enabled for scrollback (`Prefix + [`).

## ✍️ Vim Essentials

Optimized for speed and system integration.

- **Clipboard**: `set clipboard+=unnamed` is enabled. Content `y`anked in Vim is immediately available in your system clipboard.
- **Key Mappings**:
    - `jj`: Quick `Esc` to exit insert mode.
    - `H` / `L`: Jump to start/end of line.
    - `Ctrl + h/j/k/l`: Quick pane navigation.
    - `,t`: Toggle NERDTree (file explorer).
    - `,d`: Show Git diff (Signify).
- **Go Support**: Lightweight linting via `ALE` (using `govet`).

## 🐚 Bash Features

- **Prompt**: Shows current Git branch and clean path.
- **Aliases**: `ll`, `la`, `l` for quick directory listing.
- **Go Environment**: Pre-configured `GOPATH` and `PATH`.

---

## 🛠️ Installation

1. Clone this repo to your home directory.
2. Symbolic link the configs:
   ```bash
   ln -sf ~/wsl-bash-vim-tmux/.bashrc ~/.bashrc
   ln -sf ~/wsl-bash-vim-tmux/.vimrc ~/.vimrc
   ln -sf ~/wsl-bash-vim-tmux/.tmux.conf ~/.tmux.conf
   ```
3. Install plugins:
   - **Vim**: Run `:PlugInstall` inside Vim.
   - **Tmux**: Press `Prefix + I` (Capital i) inside Tmux to install TPM and plugins.

## 🔗 WSL Integration (SSH Auto-start)

1. Put `startservice.vbs` in the Windows Startup folder:
   `C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
2. Put `init.wsl` in `/etc/init.wsl` on Linux and configure your sudoers to allow running it.
