vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)
vim.g.diag_virt_text = false

vim.diagnostic.config {
  virtual_text = vim.g.diag_virt_text,
  signs = true,
  severity_sort = true,
  float = { source = true },
}

local capabilities = require('blink.cmp').get_lsp_capabilities()
local on_attach = require('omar.lsp.maps').on_attach

vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config('clangd', {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)

    vim.keymap.set(
      'n',
      '<localleader>o',
      '<CMD>LspClangdSwitchSourceHeader<CR>',
      { desc = 'Switch source/header', buffer = bufnr }
    )
  end,
})

vim.lsp.enable({
  'clangd',
  'gopls',
  'lua_ls',
  'marksman',
  'ts_ls',
  'pyright',
  'texlab',
  -- 'cssls',
  'html',
  'bashls',
  'vimls',
  'lemminx',
  'tailwindcss',
  'ansiblels',
  'docker_compose_language_service',
  'buf_ls',
}, vim.g.lsp_enabled)
