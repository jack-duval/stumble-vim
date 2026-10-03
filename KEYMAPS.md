# ⌨️ Neovim Keybindings Cheatsheet

Leader Key: `Space`

---

## Search & File Navigation
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `<leader>ff` | Find files | Normal | `plugins/telescope.lua` |
| `<leader>fg` | Live grep (search text across workspace) | Normal | `plugins/telescope.lua` |
| `<leader>fb` | Find open buffers | Normal | `plugins/telescope.lua` |
| `<leader>fh` | Help tags / Neovim docs | Normal | `plugins/telescope.lua` |
| `<leader>fr` | Recent files (`oldfiles`) | Normal | `plugins/telescope.lua` |

---

## File Explorer (`oil.nvim` & Custom Windows)
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `-` | Open parent directory in `oil.nvim` | Normal | `plugins/oil.lua` |
| `nt` | Open file explorer in new tab (current directory) | Normal | `config/keymaps.lua` |
| `nv` | Open file explorer in new vertical split (current directory) | Normal | `config/keymaps.lua` |
| `nh` | Open file explorer in new horizontal split (current directory) | Normal | `config/keymaps.lua` |

### `oil.nvim` Buffer Controls
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `<CR>` | Open selected file/directory | Normal | `plugins/oil.lua` |
| `-` | Go to parent directory | Normal | `plugins/oil.lua` |
| `_` | Open current working directory (`cwd`) | Normal | `plugins/oil.lua` |
| `g.` | Toggle hidden files | Normal | `plugins/oil.lua` |
| `gs` | Change sorting method | Normal | `plugins/oil.lua` |
| `gx` | Open file/dir with external system application | Normal | `plugins/oil.lua` |
| `g?` | Show `oil.nvim` built-in help | Normal | `plugins/oil.lua` |

---

## Split Window Navigation
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `gh` | Focus split window on the left | Normal | `config/keymaps.lua` |
| `gj` | Focus split window below | Normal | `config/keymaps.lua` |
| `gk` | Focus split window above | Normal | `config/keymaps.lua` |
| `gl` | Focus split window on the right | Normal | `config/keymaps.lua` |

---

## LSP & Code Intelligence
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `gd` | Go to symbol definition | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `K` | Hover symbol documentation | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `<leader>rn` | Rename symbol workspace-wide | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `<leader>ca` | Code action | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `<leader>th` | Toggle Inlay Hints | Normal | `plugins/lsp.lua` |

---

## Diagnostics & Warnings
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `<leader>d` | Open line diagnostic float window | Normal | `plugins/lsp.lua` |
| `[d` | Jump to previous diagnostic | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `]d` | Jump to next diagnostic | Normal | `config/keymaps.lua` / `plugins/lsp.lua` |
| `<leader>dq` | Populate Quickfix list with diagnostics | Normal | `plugins/lsp.lua` |
| `<leader>dl` | Populate Location list with diagnostics | Normal | `plugins/lsp.lua` |

---

## Git Integration & Diffing (`mini.diff` & `diffview.nvim`)
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `]h` | Jump to next Git hunk | Normal | `plugins/diff.lua` |
| `[h` | Jump to previous Git hunk | Normal | `plugins/diff.lua` |
| `<leader>hp` | Toggle inline Git diff overlay | Normal | `plugins/diff.lua` |
| `<leader>gd` | Open side-by-side Git diff split | Normal | `plugins/diffview.lua` |
| `<leader>gh` | Open current file Git history split | Normal | `plugins/diffview.lua` |
| `<leader>gH` | Open branch Git history split | Normal | `plugins/diffview.lua` |
| `<leader>gc` | Close Diffview tab | Normal | `plugins/diffview.lua` |

---

## Autocompletion (`blink.cmp`)
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `<C-space>` | Trigger completion menu / Documentation float | Insert | `plugins/blink.lua` |
| `<C-e>` | Hide completion menu | Insert | `plugins/blink.lua` |
| `<CR>` | Accept selected completion item | Insert | `plugins/blink.lua` |
| `<Tab>` | Select next completion item | Insert | `plugins/blink.lua` |
| `<S-Tab>` | Select previous completion item | Insert | `plugins/blink.lua` |

---

## Editor Helpers & Floating Cheatsheet
| Keymap | Action | Mode | Source |
| :--- | :--- | :--- | :--- |
| `<Esc>` | Clear search highlight (`:nohlsearch`) | Normal | `config/keymaps.lua` |
| `<leader>?` | Open this floating keymaps cheatsheet | Normal | `config/keymaps.lua` |
| `q` / `<Esc>` | Close floating keymaps cheatsheet window | Normal | Floating buffer |
