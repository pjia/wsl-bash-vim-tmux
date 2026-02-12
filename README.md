# WSL-Bash-Vim-Tmux (Simplified & Go-Centric)

A minimalist yet powerful development environment for WSL, optimized for **Go development** and **AI-assisted coding**. Heavy plugins and legacy configurations have been removed in favor of speed and efficiency.

---

## 🚀 Tmux Configuration & Usage

The Tmux setup focuses on a clean visual aesthetic (Molokai theme) and robust session management.

### 📦 Plugins & Tools

We use **TPM (Tmux Plugin Manager)** to manage the following core plugins:

1.  **[tpm](https://github.com/tmux-plugins/tpm)**: The foundation for all tmux plugins.
2.  **[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)**: Allows you to manually save and restore your entire tmux environment.
3.  **[tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)**: **Continuous saving** of tmux environment.
    - **Auto-Save**: Automatically saves your session every 15 minutes.
    - **Auto-Restore**: Automatically restores your last session when tmux starts.
    - **Storage**: Sessions are saved in `~/.tmux/resurrect/`.

### 📂 Session & Window Management

- **Sessions**: A collection of windows.
    - `Prefix + s`: List and switch between sessions.
    - `Prefix + d`: Detach from the current session.
- **Windows**: Tabs within a session.
    - `Prefix + c`: Create a new window.
    - `Prefix + ,`: Rename current window.
    - `Prefix + n / p`: Next/previous window.
- **Panes**: Split screens within a window.
    - `Prefix + %`: Vertical split.
    - `Prefix + "`: Horizontal split.
    - `Prefix + x`: Close current pane.

### 💾 Persistence & Control

- **Manual Save**: `Prefix + Ctrl-s`.
- **Manual Restore**: `Prefix + Ctrl-r`.
- **🔄 Reload Config**: `Prefix + r`.
- **🐚 Reload Bash**: `Prefix + B` (Reloads `.bashrc` in **all** panes simultaneously).

### ⌨️ Key Bindings

- **Prefix**: `Ctrl-a`
- **🖱️ Mouse Toggle (`Prefix + m`)**:
    - **ON**: Easy scrolling/resizing.
    - **OFF**: **AI-Friendly Mode** (Native terminal selection for easy copy-pasting).

---

## ✍️ Vim Essentials

A lightweight Vim setup with essential tools:

- **Key Mappings**:
    - `jj`: Exit insert mode.
    - `H / L`: Jump to start/end of line.
    - `Ctrl + h/j/k/l`: Switch between split panes.
- **Plugins**:
    - **NERDTree** (`,t`): File explorer.
    - **Signify** (`,d`): Git diff in the gutter.
    - **ALE**: Asynchronous linting for Go (`govet`) and Python (`pylint`).
- **Clipboard**: `set clipboard+=unnamed` for system integration.

---

## 🐚 Bash Features

- **Prompt**: Shows Git branch and clean path.
- **Go Environment**: Pre-configured `GOPATH` and `PATH`.
- **Tools**: Integrated `nvm` and automatic `.api_keys` loading.
- **Aliases**: `ll`, `la`, `tmux` (force 256 colors), `tworks` (attach to 'works' session).

---

## 🛠️ Global Setup

1. Clone this repo to your home directory.
2. Symbolic link the configs (`.bashrc`, `.vimrc`, `.tmux.conf`).
3. **Tmux**: Clone TPM `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`, then press `Prefix + I` in tmux to install plugins.
4. **Vim**: Install [vim-plug](https://github.com/junegunn/vim-plug), then run `:PlugInstall` inside Vim.
