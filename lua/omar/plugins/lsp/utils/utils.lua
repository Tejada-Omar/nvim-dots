local M = {}

M.mappings = function(bufnr)
  vim.api.nvim_set_option_value(
    'omnifunc',
    'v:lua.nvim.lsp.omnifunc',
    { scope = 'local' }
  )

  vim.keymap.set(
    'n',
    'gD',
    vim.lsp.buf.declaration,
    { desc = 'Jump to function declaration', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    'gd',
    vim.lsp.buf.definition,
    { desc = 'Jump to function definition', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    'gi',
    vim.lsp.buf.implementation,
    { desc = 'List all implementations in quickfix window', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<C-k>',
    vim.lsp.buf.signature_help,
    { desc = 'Display signature info in floating window', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>wa',
    vim.lsp.buf.add_workspace_folder,
    { desc = 'Add folder to workspace folders', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>wr',
    vim.lsp.buf.remove_workspace_folder,
    { desc = 'Remove folder from workspace folders', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>wl',
    function() vim.print(vim.lsp.buf.list_workspace_folders()) end,
    { desc = 'List workspace windows', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>D',
    vim.lsp.buf.type_definition,
    { desc = 'Jump to type definition', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>rn',
    vim.lsp.buf.rename,
    { desc = 'Rename all references to symbol', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<Space>ca',
    vim.lsp.buf.code_action,
    { desc = 'Select an available code action', buffer = bufnr }
  )

  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {
    desc = 'List all references to symbol in quickfix window',
    buffer = bufnr,
  })
end

return M
