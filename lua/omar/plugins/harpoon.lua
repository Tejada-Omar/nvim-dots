return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = 'harpoon2',
    keys = {
      {
        '<leader>la',
        function() require('harpoon'):list():add() end,
        desc = 'Pin buffer',
      },
      {
        '<leader>ll',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Show pinned buffers',
      },
      {
        '<leader>lp',
        function() require('harpoon'):list():prev() end,
        desc = 'Go to previous pinned buffer',
      },
      {
        '<leader>ln',
        function() require('harpoon'):list():next() end,
        desc = 'Go to next pinned buffer',
      },
    },
  },
}
