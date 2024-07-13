return {
  {
    'uga-rosa/ccc.nvim',
    lazy = false,
    opts = {
      highlight_mode = 'virtual',
      preserve = true,
      highlighter = {
        auto_enable = true,
      },
    },
    keys = {
      { '<leader>cc', '<CMD>CccPick<CR>', desc = 'Open color picker' },
      { '<leader>cr', function()
        vim.cmd.CccHighlighterToggle()
        vim.cmd.CccHighlighterToggle()
      end, desc = 'Reload color highlighting' },
    },
  },
}
