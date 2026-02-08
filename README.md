# WSL-Bash-Vim-Tmux (Simplified & Go-Centric)

A minimalist yet powerful development environment for WSL, optimized for **Go development** and **AI-assisted coding**. Heavy plugins and legacy C++ configurations have been removed in favor of speed and copy-paste efficiency.

---

## 🚀 Tmux Configuration & Usage

The Tmux setup focuses on a clean visual aesthetic (Molokai theme) and robust session management.

### 📦 Plugins & Tools

We use **TPM (Tmux Plugin Manager)** to manage the following core plugins:

1.  **[tpm](https://github.com/tmux-plugins/tpm)**: The foundation for all tmux plugins. It handles automatic downloading and updating of your plugin suite.
2.  **[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)**: Essential for persistence. It allows you to save and restore your entire tmux environment (tabs, panes, paths) even after a system reboot or WSL restart.
    - **Save**: `Prefix + Ctrl-s`
    - **Restore**: `Prefix + Ctrl-r`

### 🛠️ Installation

To get the Tmux environment running:

1.  **Clone TPM**:
    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
2.  **Link Config**:
    ```bash
    ln -sf ~/wsl-bash-vim-tmux/.tmux.conf ~/.tmux.conf
    ```
3.  **Install Plugins**:
    Open Tmux and press **`Prefix + I`** (Capital I) to fetch and install the plugins listed in the config.

### ⌨️ Key Bindings

- **Prefix**: `Ctrl-a` (replaces the default `Ctrl-b`)
- **🖱️ Mouse Toggle (`Prefix + m`)**:
    - **ON**: Standard mouse interaction (scrolling, selecting panes).
    - **OFF**: **AI-Friendly Mode**. Use this for native terminal selection to easily copy code blocks to your clipboard without tmux interference.
- **🔄 Reload Config**: `Prefix + r`
- **Navigation**: VI mode keys enabled. Use `Prefix + [` to enter copy mode and navigate with `h/j/k/l`.

---

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

## 🛠️ Global Setup

1. Clone this repo to your home directory.
2. Symbolic link the configs (`.bashrc`, `.vimrc`).
3. Inside Vim, run `:PlugInstall` to install plugins.

## 🔗 WSL Integration (SSH Auto-start)

1. Put `startservice.vbs` in the Windows Startup folder:
   `C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
2. Put `init.wsl` in `/etc/init.wsl` on Linux and configure your sudoers to allow running it.
