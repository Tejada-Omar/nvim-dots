return {
  'nvim-lua/plenary.nvim',
  {
    'AckslD/nvim-FeMaco.lua',
    config = true,
  },
  {
    'andweeb/presence.nvim',
    enabled = false,
  },
  {
    'ziontee113/icon-picker.nvim',
    opts = {
      disable_legacy_commands = true,
    },
    keys = {
      { '<leader>ii', '<CMD>IconPickerNormal<CR>', desc = 'Pick icon' },
      { '<leader>iy', '<CMD>IconPickerYank<CR>', desc = 'Yank icon' },
      {
        '<M-i>',
        '<CMD>IconPickerInsert<CR>',
        mode = 'i',
        desc = 'Insert icon',
      },
    },
  },
  {
    'mfussenegger/nvim-ansible',
    ft = 'yaml',
  },
  {
    'Tejada-Omar/notes-compile.nvim',
    dev = false,
    ft = 'markdown',
    config = true,
  },
}
