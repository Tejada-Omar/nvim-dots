return {
  {
    'uga-rosa/ccc.nvim',
    cond = vim.g.fancy_living,
    opts = {
      highlight_mode = 'virtual',
      preserve = true,
      highlighter = {
        auto_enable = false,
      },
    },
    keys = {
      { '<leader>ch', '<CMD>CccPick<CR>', desc = 'Open color picker' },
      {
        '<leader>ct',
        '<CMD>CccHighlighterToggle<CR>',
        desc = 'Toggle color highlighter',
      },
      {
        '<leader>cr',
        function()
          vim.cmd.CccHighlighterToggle()
          vim.cmd.CccHighlighterToggle()
        end,
        desc = 'Reload color highlighting',
      },
    },
  },
}
