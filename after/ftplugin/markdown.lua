vim.o.spell = false
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

local bufnr = vim.api.nvim_get_current_buf()
vim.b[bufnr].autoformat_disabled = true
