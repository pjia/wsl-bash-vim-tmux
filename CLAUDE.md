# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

This repository primarily contains configuration files (dotfiles). Standard development commands are limited:

- **Apply configuration**: Most changes require sourcing the file or restarting the application.
  - Bash: `source ~/.bashrc`
  - Tmux: `tmux source-file ~/.tmux.conf` (or press `,r` as configured)
  - Vim: `:source ~/.vimrc`
- **WSL Service Initialization**:
  - `startservice.vbs`: Run on Windows startup to start Linux services.
  - `init.wsl`: Script placed in `/etc` to manage SSH service via `sudo /etc/init.wsl start`.
- **Vim AsyncTask commands** (configured in `tasks.ini`):
  - Build current file: Press `<F9>` in Vim (runs `g++`, `gcc`, or `go build` based on filetype).
  - Run current file: Press `<F5>` in Vim.

## Architecture & Structure

This is a configuration-centric repository focused on setting up a productive development environment on WSL (Windows Subsystem for Linux).

- **Shell (.bashrc)**: Customizes Bash with colored prompts, git branch visibility, and specific aliases for Tmux and directory navigation.
- **Terminal Multiplexer (.tmux.conf)**: Configures Tmux with Molokai-inspired colors, VI mode keys, and integration with the Tmux Plugin Manager (TPM). Prefix is set to `C-a`.
- **Editor (.vimrc)**: A comprehensive Vim setup using `vim-plug`. Key plugins include:
  - `YouCompleteMe`: Code completion.
  - `ALE`: Asynchronous linting (configured for C, C++, Python, and Go).
  - `asynctasks.vim`: Integration with `tasks.ini` for build/run workflows.
  - `Signify`: Shows git diff in the gutter.
  - `molokai`: Primary colorscheme.
- **Cross-OS Integration**: `startservice.vbs` (Windows) and `init.wsl` (Linux) work together to ensure SSH is available immediately after Windows login.
- **Language Support**: Linting and building are specifically tuned for C, C++, Go, and Python.
