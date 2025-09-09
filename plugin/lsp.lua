vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)

vim.diagnostic.config {
  signs = true,
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
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
  'hls',
}, vim.g.lsp_enabled)

-- Close import/comment folds on buffer open
vim.api.nvim_create_autocmd('LspNotify', {
  callback = function(args)
    if args.data.method == 'textDocument/didOpen' then
      vim.lsp.foldclose('imports', vim.fn.bufwinid(args.buf))
      vim.lsp.foldclose('comment', vim.fn.bufwinid(args.buf))
    end
  end,
})

vim.api.nvim_create_autocmd('LspNotify', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    ---@diagnostic disable-next-line: param-type-mismatch
    if client:supports_method('workspace/workspaceFolders', args.buf) then
      require('omar.lsp.maps').workspace(client, args.buf)
    end
  end,
})
