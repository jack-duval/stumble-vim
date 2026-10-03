return {
  "stevearc/oil.nvim",
  lazy = false,
  priority = 1000,
  -- Global keymaps managed directly by lazy.nvim
  keys = {
    { "-", "<cmd>Oil<CR>", mode = "n", desc = "Open parent directory in Oil" },
  },
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
    },
    view_options = {
      show_hidden = true,
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
