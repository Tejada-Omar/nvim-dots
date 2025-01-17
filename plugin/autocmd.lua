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

vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Hide tab characters if expandtab is off',
  callback = function(_)
    if vim.bo[0].expandtab == true then return end

    local winid = vim.api.nvim_get_current_win()
    vim.wo[winid][0].list = false
  end,
})
