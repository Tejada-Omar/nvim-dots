return {
  { import = 'omar/plugins/lsp', cond = vim.g.lsp_enabled },
  {
    'williamboman/mason.nvim',
    config = true,
    cond = vim.g.lsp_enabled,
    dependencies = {
      'nvim-telescope/telescope.nvim',
      optional = true
    },
  },
}
