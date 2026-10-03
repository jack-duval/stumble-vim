return {
  "neovim/nvim-lspconfig",
  dependencies = { "Saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Global keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })

    -- Go grab ginaries
    local lua_cmd = vim.fn.exepath("lua-language-server") ~= "" and "lua-language-server" or "/opt/homebrew/bin/lua-language-server"
    local rust_cmd = vim.fn.exepath("rust-analyzer") ~= "" and "rust-analyzer" or "~/.cargo/bin/rust-analyzer"

    -- Lua LSP
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

    -- Rust Analyzer setup
    vim.lsp.config.rust_analyzer = {
      cmd = { rust_cmd },
      filetypes = { "rust" },
      root_markers = { "Cargo.toml", ".git" },
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
            allTargets = false,
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

    -- Inlay hints (mostly writing rust right now, shoutout to type inference)
    vim.keymap.set("n", "<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "Toggle inlay hints" })

    -- Enable!
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("rust_analyzer")
  end,
}
