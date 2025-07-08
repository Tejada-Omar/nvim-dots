return {
  {
    'folke/todo-comments.nvim',
    event = 'BufEnter',
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
        desc = 'Todo List (Trouble)',
      },
    },
  },
}
