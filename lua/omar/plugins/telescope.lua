return {
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = '  ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        path_display = {
          shorten = {
            len = 4,
            exclude = { -2, -1 },
          },
        },
        layout_config = {
          prompt_position = 'top',
        },
        mappings = {
          i = {
            ['<leader><cr>'] = 'file_edit',
          },
        },
        file_ignore_patterns = {
          '%.pdf',
          '%.mp4',
          '%.zip',
          '%.gz',
          '%.tar',
          '%.git/',
          '%.git',
        },
        preview = {
          treesitter = false,
        },
      },
      pickers = {
        live_grep = {
          grep_open_files = false,
          glob_pattern = { '!*[-.]lock' },
        },
      },
    },
    config = true,
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        opts = {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = 'smart_case',
            },
          },
        },
        config = function(_, opts)
          require('telescope').setup(opts)
          require('telescope').load_extension('fzf')
        end,
      },
    },
  },
  {
    'debugloop/telescope-undo.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
      {
        '<leader>fu',
        '<CMD>Telescope undo<CR>',
        desc = 'Fzf undolist',
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('undo')
    end,
  },
}
