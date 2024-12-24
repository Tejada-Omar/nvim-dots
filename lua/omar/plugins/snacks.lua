return {
  {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
      bigfile = { enabled = true },
    },
    keys = {
      {
        '<leader>z',
        function() require('snacks.zen').zen() end,
        desc = 'Toggle zen mode',
      },
      {
        '<leader>Z',
        function() require('snacks.zen').zoom() end,
        desc = 'Toggle zoom mode',
      },
    },
  },
}
