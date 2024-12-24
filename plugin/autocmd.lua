vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank { higroup = 'IncSearch' } end,
})

vim.api.nvim_create_autocmd('TermEnter', { command = 'startinsert' })
vim.api.nvim_create_autocmd(
  'TermOpen',
  { command = 'setlocal nonumber norelativenumber signcolumn=no' }
)

vim.api.nvim_create_autocmd({ 'BufNew', 'BufWritePost' }, {
  callback = function(_)
    if not vim.g.lsp_enabled then return end
    require('lint').try_lint()
  end,
})
