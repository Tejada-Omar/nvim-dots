return {
  -- FIXME: Here
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      gui_style = {
        fg = 'italic',
      },
    },
  },
}
