return {
  "neovim/nvim-lspconfig",
  dependencies = { "Saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.diagnostic.config({
      virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN },
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "single",
        source = "if_many",
        header = "",
        prefix = "",
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "<leader>d", function()
          vim.diagnostic.open_float({
            scope = "line",
            border = "single",
            syntax = false,
          })
        end, { buffer = ev.buf, desc = "Line Diagnostics (Fast)" })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = ev.buf, desc = "Previous Diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = ev.buf, desc = "Next Diagnostic" })

        vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { buffer = ev.buf, desc = "Quickfix Diagnostics" })
        vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { buffer = ev.buf, desc = "Location List Diagnostics" })
      end,
    })

    -- helps find local binaries
    local function resolve_cmd(bin, fallback)
      local path = vim.fn.exepath(bin)
      if path ~= "" then
        return path
      end
      return fallback or bin
    end

    local lua_cmd = resolve_cmd("lua-language-server", "/opt/homebrew/bin/lua-language-server")
    local rust_cmd = resolve_cmd("rust-analyzer", vim.fn.expand("~/.cargo/bin/rust-analyzer"))
    local zig_cmd = resolve_cmd("zls", "/opt/homebrew/bin/zls")
    local pyright_cmd = resolve_cmd("basedpyright", "/opt/homebrew/bin/basedpyright")
    local clangd_cmd = resolve_cmd("clangd", "/usr/bin/clangd")

    -- Helper to resolve Zig stdlib directory
    local function get_zig_lib_dir()
      local handle = io.popen("zig env 2>/dev/null")
      if not handle then return nil end
      local result = handle:read("*a")
      handle:close()
      local lib_dir = result:match('lib_dir%s*=%s*"([^"]+)"')
      return lib_dir
    end

    -- BEGIN INDIVIDUAL LANGUAGE SERVERS

    -- Lua
    vim.lsp.config.lua_ls = {
      cmd = { lua_cmd },
      filetypes = { "lua" },
      root_markers = { ".git", "init.lua" },
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }

    -- Rust
    vim.lsp.config.rust_analyzer = {
      cmd = { rust_cmd },
      filetypes = { "rust" },
      root_markers = { "Cargo.toml", ".git" },
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = true,
          check = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
          cargo = {
            allFeatures = true,
            buildScripts = { enable = true },
          },
          procMacro = {
            enable = true,
          },
        },
      },
    }

    -- Zig
    vim.lsp.config.zls = {
      cmd = { zig_cmd },
      filetypes = { "zig", "zir" },
      root_markers = { "build.zig", ".git" },
      capabilities = capabilities,
      settings = {
        zls = {
          zig_exe_path = vim.fn.exepath("zig"),
          zig_lib_path = get_zig_lib_dir() or "~/.zvm/master/lib",
        },
      },
    }

    -- Python
    vim.lsp.config.basedpyright = {
      cmd = { pyright_cmd, "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "standard",
            diagnosticMode = "workspace",
          },
        },
      },
    }

    -- C / C++
    vim.lsp.config.clangd = {
      cmd = {
        clangd_cmd,
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
      },
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
      capabilities = capabilities,
    }

    -- Inlay hints toggle
    vim.keymap.set("n", "<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle inlay hints" })

    local servers = { "lua_ls", "rust_analyzer", "zls", "basedpyright", "clangd" }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end
  end,
}
