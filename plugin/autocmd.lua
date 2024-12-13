vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank { higroup = 'IncSearch' } end,
})

vim.api.nvim_create_autocmd('TermEnter', {
  callback = function(_)
    vim.cmd('startinsert')

    vim.o.number = false
    vim.o.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('TermLeave', {
  callback = function(_)
    vim.o.number = true
    vim.o.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd({ 'BufNew', 'BufWritePost' }, {
  callback = function(_)
    if not vim.g.lsp_enabled then return end
    require('lint').try_lint()
  end,
})
