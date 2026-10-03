return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "day", -- storm, moon, night, day
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
