return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', optional = true },
    opts = {
      keymaps = {
        ['-'] = 'actions.close',
        ['<BS>'] = 'actions.parent',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          local ignore = {
            '.git',
            'node_modules',
          }

          if vim.list_contains(ignore, name) then return true end
          return false
        end,
      },
    },
    keys = {
      { '<leader>ee', '<CMD>Oil<CR>', desc = 'Toggle Oil floating window' },
      {
        '<leader>ef',
        function() require('oil').toggle_float() end,
        desc = 'Toggle Oil floating window',
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      { 'nvim-tree/nvim-web-devicons', optional = true },
    },
    keys = {
      {
        '<leader>el',
        '<CMD>Neotree toggle reveal<CR>',
        desc = 'Toggle Neotree',
      },
      {
        '<leader>er',
        '<CMD>Neotree reveal<CR>',
        desc = 'Focus Neotree on current file',
      },
      {
        '<leader>eR',
        '<CMD>Neotree show<CR>',
        desc = 'Open Neotree',
      },
    },
    cmd = 'Neotree',
    opts = {
      sources = {
        'filesystem',
        'document_symbols'
      },
      filesystem = {
        follow_current_file = {
          enable = true,
          leave_dirs_open = true,
        },
      },
    },
  },
}
