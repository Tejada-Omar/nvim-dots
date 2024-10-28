return {
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      gui_style = {
        fg = 'italic',
      },
    },
    keys = {
      {
        '<leader>xt',
        '<CMD>TodoTrouble<CR>',
        desc = 'Quickfix List (Trouble)',
      },
    }
  },
}
