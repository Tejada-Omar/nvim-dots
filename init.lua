local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

vim.g.fancy_living = vim.fn.has('termguicolors') == 1

local Profile = require('omar.profile')
local nvim_profile = string.upper(os.getenv('NVIM_PROFILE') or '')
vim.g.nvim_profile = Profile[nvim_profile] or Profile.DESKTOP

vim.g.lsp_enabled = true
if os.getenv('NVIM_LSP_ENABLED') ~= 'true' then vim.g.lsp_enabled = false end
vim.g.autoformat_enabled = true
if os.getenv('NVIM_AUTOFORMAT_ENABLED') ~= 'true' then
  vim.g.autoformat_enabled = false
end

local colorscheme = 'rose-pine'
vim.g.lualine_theme = colorscheme

if not vim.g.fancy_living then
  colorscheme = 'default'
  vim.g.lualine_theme = 'auto'
end

vim.g.maplocalleader = ' '

require('lazy').setup({ import = 'omar/plugins' }, {
  lazy = true,
  dev = {
    path = '~/Code/nvim',
    fallback = true,
  },
  change_detection = {
    notify = false,
  },
})

vim.cmd.colorscheme(colorscheme)
