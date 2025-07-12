return {
  { import = 'omar/plugins/lsp', cond = vim.g.lsp_enabled },
  {
    'mason-org/mason.nvim',
    config = true,
    cond = vim.g.lsp_enabled,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    cond = vim.g.lsp_enabled,
  },
}
