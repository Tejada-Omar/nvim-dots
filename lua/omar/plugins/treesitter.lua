return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'VimEnter', 'BufNew', 'BufEnter' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      {
        'nvim-treesitter/nvim-treesitter-context',
        opts = { min_window_height = 24, max_lines = 4 },
      },
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
        disable = { 'latex' }, -- For vimtex
      },
      incremental_selection = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ic'] = '@class.inner',
            ['ac'] = '@class.outer',
            ['iC'] = '@call.inner',
            ['aC'] = '@call.outer',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['iP'] = '@parameter.inner',
            ['aP'] = '@parameter.outer',
          },
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
          },
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
            [']/'] = '@comment.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
            [']?'] = '@comment.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
            [']/'] = '@comment.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
            ['[?'] = '@comment.outer',
          },
        },
      },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
}
