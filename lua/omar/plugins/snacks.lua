return {
  {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
      bigfile = { enabled = true },
    },
    keys = {
      {
        '<leader>zz',
        function() require('snacks.zen').zen() end,
        desc = 'Toggle zen mode',
      },
      {
        '<leader>zo',
        function() require('snacks.zen').zoom() end,
        desc = 'Toggle zoom mode',
      },
    },
  },
  {
    'shortcuts/no-neck-pain.nvim',
    opts = {
      buffers = {
        wo = {
          fillchars = 'eob: ',
        },
      },
    },
    keys = {
      {
        '<leader>zn',
        '<CMD>NoNeckPain<CR>',
        desc = 'Center buffer',
      },
    },
  },
}
