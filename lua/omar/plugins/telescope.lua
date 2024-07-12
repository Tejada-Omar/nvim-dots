return {
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = '  ',
        entry_prefix = ' ',
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
        mappings = {
          i = {
            ['<leader><cr>'] = 'file_edit',
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      },
      pickers = {
        live_grep = {
          grep_open_files = false,
        },
      },
    },
    keys = {
      {
        '<leader>ff',
        '<CMD>Telescope find_files<CR>',
        desc = 'Fuzzy-find files',
      },
      {
        '<leader>fg',
        '<CMD>Telescope live_grep<CR>',
        desc = 'Live-grep files',
      },
      {
        '<leader>fj',
        function()
          require('telescope.builtin').live_grep {
            grep_open_files = true,
          }
        end,
        desc = 'Live-grep open files',
      },
      {
        '<leader>fb',
        '<CMD>Telescope buffers<CR>',
        desc = 'Fuzzy-find buffers',
      },
      {
        '<leader>fh',
        '<CMD>Telescope help_tags<CR>',
        desc = 'Fuzzy-find help tags',
      },
      {
        '<leader>fo',
        '<CMD>Telescope oldfiles<CR>',
        desc = 'Fuzzy-find old files',
      },
    },
    config = true,
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function() require('telescope').load_extension('fzf') end,
      },
      {
        'olimorris/persisted.nvim',
        lazy = false,
        priority = 60,
        opts = {
          use_git_branch = true,
          default_branch = 'master',
          autoload = true,
          ignored_dirs = {
            { '/tmp', exact = true },
          },
          should_autosave = function()
            if vim.bo.filetype == 'oil' then return false end

            return true
          end,
        },
        config = function(_, opts)
          require('persisted').setup(opts)
          require('telescope').load_extension('persisted')

          local group = vim.api.nvim_create_augroup('PersistedHooks', {})

          vim.api.nvim_create_autocmd({ 'User' }, {
            pattern = 'PersistedTelescopeLoadPre',
            group = group,
            callback = function(_)
              -- Save the currently loaded session using a global variable
              require('persisted').save {
                session = vim.g.persisted_loaded_session,
              }

              -- Delete all of the open buffers
              vim.api.nvim_input('<ESC>:%bd!<CR>')
            end,
          })
        end,
        keys = {
          {
            '<leader>fs',
            '<CMD>Telescope persisted<CR>',
            desc = 'Fuzzy-find sessions',
          },
        },
      },
    },
  },
}
