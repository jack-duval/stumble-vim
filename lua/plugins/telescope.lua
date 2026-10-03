return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        -- Disable treesitter highlighting in the Telescope preview window
        -- to prevent Neovim 0.11+ ft_to_lang API errors
        preview = {
          treesitter = false,
        },
      },
    })

    -- Telescope Keymaps
    vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({ hidden = true, no_ignore = false })
    end, { desc = "Find workspace files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep workspace" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })
  end,
}
