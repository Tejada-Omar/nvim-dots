return {
  {
    'folke/trouble.nvim',
    opts = {
      focus = true,
    },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<CMD>Trouble diagnostics toggle<CR>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<CMD>Trouble diagnostics toggle filter.buf=0<CR>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xs',
        '<CMD>Trouble symbols toggle focus=false<CR>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>xr',
        '<CMD>Trouble lsp toggle focus=false win.position=right<CR>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xl',
        '<CMD>Trouble loclist toggle<CR>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xq',
        '<CMD>Trouble qflist toggle<CR>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
