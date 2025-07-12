local M = {}

M.on_attach = function(_, bufnr)
  vim.keymap.set(
    'n',
    'grD',
    vim.lsp.buf.declaration,
    { desc = 'Jump to function declaration', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    'grd',
    vim.lsp.buf.type_definition,
    { desc = 'Jump to type definition', buffer = bufnr }
  )
end

M.workspace = function(_, bufnr)
  vim.keymap.set(
    'n',
    '<localleader>wa',
    vim.lsp.buf.add_workspace_folder,
    { desc = 'Add folder to workspace folders', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<localleader>wr',
    vim.lsp.buf.remove_workspace_folder,
    { desc = 'Remove folder from workspace folders', buffer = bufnr }
  )

  vim.keymap.set(
    'n',
    '<localleader>wl',
    function() vim.print(vim.lsp.buf.list_workspace_folders()) end,
    { desc = 'List workspace windows', buffer = bufnr }
  )
end

return M
