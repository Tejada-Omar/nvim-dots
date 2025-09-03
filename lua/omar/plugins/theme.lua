return {
  {
    'nvim-tree/nvim-web-devicons',
    cond = vim.g.fancy_living,
    config = true,
  },
  {
    'echasnovski/mini.icons',
    opts = function()
      return {
        style = vim.g.fancy_living and 'glyph' or 'ascii',
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'UIEnter',
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        },
      },
      win = {
        title = false,
      },
    },
  },
}
