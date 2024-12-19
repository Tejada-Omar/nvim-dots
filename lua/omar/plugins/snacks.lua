return {
  {
    'folke/snacks.nvim',
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        sections = {
          { section = 'header' },
          {
            pane = 1,
            icon = ' ',
            title = 'Recent Files',
            section = 'recent_files',
            indent = 2,
            padding = 1,
          },
          {
            pane = 2,
            icon = ' ',
            title = 'Git Status',
            section = 'terminal',
            enabled = function() return Snacks.git.get_root() ~= nil end,
            cmd = 'git --no-pager diff --stat --minimal -B -M -C',
            height = 10,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = 'startup' },
        },
      },
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
