return {
  "echasnovski/mini.diff",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    view = {
      style = "sign",
      signs = {
        add = "▎",
        change = "▎",
        delete = " ",
      },
    },
    -- Explicitly disable mini.diff's default mappings so they don't hijack '-'
    mappings = {
      apply = "",
      reset = "",
      textobject = "",
      goto_first = "",
      goto_prev = "",
      goto_next = "",
      goto_last = "",
    },
  },
  config = function(_, opts)
    local diff = require("mini.diff")
    diff.setup(opts)

    -- Custom keymaps
    local map = vim.keymap.set
    map("n", "]h", function() diff.goto_hunk("next") end, { desc = "Next Git Hunk" })
    map("n", "[h", function() diff.goto_hunk("prev") end, { desc = "Previous Git Hunk" })
    map("n", "<leader>hp", function() diff.toggle_overlay() end, { desc = "Toggle Inline Diff Overlay" })
  end,
}
