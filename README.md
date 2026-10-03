# Custom Neovim Configuration

Stumble Vim is a minimalist Neovim setup; intended for use on large codebases (and actually writing code).

It uses native LSP features, instead of Mason.

See CHEATSHEET.md for keybindings!

---

## System Requirements

Ensure the following tools are installed on your system path.

### Core Dependencies
* **Neovim 0.11+**
* **Git**
* **C Compiler** (`gcc` or `clang`)
* **ripgrep** (for fast Telescope search)
* **fd** or **fzf** (for fuzzy path searching)

---

## Language Server Dependencies (LSP)

The LSP configuration auto-resolves binary locations across default system paths (`/usr/bin`, `/usr/local/bin`, `/opt/homebrew/bin`, `~/.cargo/bin`, `~/.local/bin`, and `~/.zvm/bin`).

### 1. Lua
* **LSP:** `lua-language-server`
* **Supported Paths:** Installed via Homebrew or system package manager on `$PATH`.

### 2. Rust
* **LSP:** `rust-analyzer`
* **Requirements:** Installed via `rustup` (`rustup component add rust-analyzer`).

### 3. Zig
* **LSP:** `zls`
* **Requirements:** Managed via system path or **ZVM (Zig Version Manager)**.

### 4. Python
* **LSP:** `basedpyright`
* **Requirements:** Installed globally or per-user via `pip` or `pipx`.

### 5. C / C++
* **LSP:** `clangd`
* **Requirements:** Installed via `llvm` / `clang-tools` on macOS or `clangd` package on Ubuntu/Debian.

---

1. **Clone the repository** to your Neovim config folder:
   ```bash
   git clone <your-repository-url> ~/.config/nvim
