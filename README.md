# WSL-Bash-Vim-Tmux (Simplified & Go-Centric)

A minimalist yet powerful development environment for WSL, optimized for **Go development** and **AI-assisted coding**. Heavy plugins and legacy C++ configurations have been removed in favor of speed and copy-paste efficiency.

---

## 🚀 Tmux Configuration & Usage

The Tmux setup focuses on a clean visual aesthetic (Molokai theme) and robust session management.

### 📦 Plugins & Tools

We use **TPM (Tmux Plugin Manager)** to manage the following core plugins:

1.  **[tpm](https://github.com/tmux-plugins/tpm)**: The foundation for all tmux plugins.
2.  **[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)**: Allows you to manually save and restore your entire tmux environment.
3.  **[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)**: **Continuous saving** of tmux environment. It works with `tmux-resurrect`.
    - **Auto-Save**: Automatically saves your session every 15 minutes (configurable).
    - **Auto-Restore**: Automatically restores your last session when tmux starts.

### 📂 Session & Window Management

- **Sessions**: A collection of windows. Great for separating different projects.
    - `Prefix + s`: List and switch between sessions.
    - `Prefix + d`: Detach from the current session (it keeps running in the background).
- **Windows**: Tabs within a session.
    - `Prefix + c`: Create a new window.
    - `Prefix + ,`: Rename the current window.
    - `Prefix + n / p`: Move to the next/previous window.
    - `Prefix + 0-9`: Switch directly to a window by number.
- **Panes**: Split screens within a window.
    - `Prefix + %`: Vertical split.
    - `Prefix + "`: Horizontal split.
    - `Prefix + o`: Cycle through panes.
    - `Prefix + x`: Close current pane.

### 💾 Persistence (Save & Restore)

While `tmux-continuum` handles things in the background, you can still control it manually:
- **Manual Save**: `Prefix + Ctrl-s` (Forces an immediate save).
- **Manual Restore**: `Prefix + Ctrl-r` (Forces a restore from the last save).

### 🛠️ Installation

1.  **Clone TPM**:
    ```bash
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ```
2.  **Install Plugins**:
    Open Tmux and press **`Prefix + I`** (Capital I) to install `resurrect` and `continuum`.

### ⌨️ Key Bindings

- **Prefix**: `Ctrl-a`
- **🖱️ Mouse Toggle (`Prefix + m`)**:
    - **ON**: Easy scrolling/resizing.
    - **OFF**: **AI-Friendly Mode** (Native terminal selection for easy copy-pasting).
- **🔄 Reload Config**: `Prefix + r`

---

## ✍️ Vim Essentials

- **Clipboard**: `set clipboard+=unnamed` (Yank in Vim -> Paste in System).
- **jj**: Exit insert mode quickly.
- **H / L**: Start/End of line.
- **,t**: Toggle NERDTree.
- **Go Support**: Lightweight linting via `ALE`.

## 🐚 Bash Features

- **Prompt**: Shows Git branch and clean path.
- **Go Environment**: Pre-configured `GOPATH` and `PATH`.

---

## 🛠️ Global Setup

1. Clone this repo to your home directory.
2. Symbolic link the configs (`.bashrc`, `.vimrc`).
3. Inside Vim, run `:PlugInstall` to install plugins.

## 🔗 WSL Integration (SSH Auto-start)

1. Put `startservice.vbs` in the Windows Startup folder.
2. Put `init.wsl` in `/etc/init.wsl` on Linux.
