return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Directly setup nvim-treesitter (nvim-treesitter.configs no longer exists)
    require("nvim-treesitter").setup({
      ensure_installed = { "lua", "vim", "vimdoc", "query", "bash", "markdown", "toml", "rust" },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
