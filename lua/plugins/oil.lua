return {
  "stevearc/oil.nvim",
  opts = {
    -- Take over netrw entirely
    default_file_explorer = true,
    -- Simple, familiar keymaps inside the Oil buffer
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
    },
    -- Keep columns minimal
    columns = {
      "icon",
    },
    view_options = {
      show_hidden = true,
    },
  },
  -- Bind '-' in Normal mode to open Oil targeting the parent directory
  keys = {
    { "-", "<cmd>Oil<CR>", mode = "n", desc = "Open parent directory with Oil" },
  },
  -- Optional icon support (install nvim-web-devicons via Homebrew or Lazy if desired)
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
