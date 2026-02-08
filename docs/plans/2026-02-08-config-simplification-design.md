# Config Simplification Design

## Goal
Simplify `.bashrc`, `.vimrc`, and `.tmux.conf` for a Go-centric development environment that primarily relies on AI for coding. Remove all C++ specific configurations and heavy plugins.

## Proposed Changes

### 1. .bashrc
- **Keep**:
    - Basic interactive shell checks
    - History settings (HISTCONTROL, HISTSIZE)
    - Color support for `ls` and `grep`
    - Basic aliases (`ll`, `la`, `l`)
    - Go environment variables (`GOPATH`, `PATH`)
    - Git branch prompt logic
- **Remove**:
    - `split_pwd` function
    - C++ color exports (`GCC_COLORS`)
    - Tmux specific aliases that are redundant
    - Commented-out sections and experiments

### 2. .vimrc
- **Keep**:
    - `vim-plug` infrastructure
    - Essential plugins: `vim-signify`, `nerdtree`, `ale` (simplified), `molokai` colorscheme
    - Core settings: encoding, indentation (4 spaces), search behavior, basic key mappings (`jj` to Esc, `H`/`L` for line ends)
    - Simple status line
- **Remove**:
    - `YouCompleteMe` (heavyweight补全)
    - C++ specific: `OmniCppComplete`, `taglist.vim`, `vim-gutentags`, `cscope` logic
    - Heavy visual plugins: `vim-airline` (use simple statusline), `minibufexpl.vim`
    - Large chunks of commented-out code

### 3. .tmux.conf
- **Keep**:
    - Prefix `C-a`
    - VI mode keys
    - Basic status line styling
    - Reload binding (`r`)
- **Remove**:
    - TPM (Tmux Plugin Manager) and all associated plugins
    - Complex mouse toggle scripts (replace with `set -g mouse on`)
    - Powerline-style symbols and complex status line elements

### 4. Cleanup
- Remove `.ycm_extra_conf.py`
- Simplify `tasks.ini` to focus on Go and Python

## Success Criteria
- Configurations are significantly shorter and easier to read.
- No C++ tools or plugins remain.
- Go development environment remains functional.
- Faster Vim startup and shell initialization.
