return {
  {
    'j-hui/fidget.nvim',
    cond = vim.g.lsp_enabled,
    opts = {
      progress = {
        suppress_on_insert = true,
      },
    },
  },
}
