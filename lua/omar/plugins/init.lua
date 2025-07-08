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
      { '<leader><leader>i', '<CMD>IconPickerNormal<CR>', desc = 'Pick icon' },
      { '<leader><leader>y', '<CMD>IconPickerYank<CR>', desc = 'Yank icon' },
      {
        '<C-S-u>',
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
