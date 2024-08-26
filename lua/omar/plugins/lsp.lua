return {
  { import = 'omar/plugins/lsp', enabled = false },
  {
    'williamboman/mason.nvim',
    config = true,
    enabled = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
}
