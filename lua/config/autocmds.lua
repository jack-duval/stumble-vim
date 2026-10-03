vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 2000 })
  end,
})
