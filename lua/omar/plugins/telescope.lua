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
        },
        preview = {
          treesitter = false,
        },
        -- extensions = {
        --   fzf = {
        --     fuzzy = true,
        --     override_generic_sorter = true,
        --     override_file_sorter = true,
        --     case_mode = 'smart_case',
        --   },
        -- },
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
        function()
          require('telescope.builtin').find_files {
            follow = true,
            hidden = true,
          }
        end,
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
        function()
          require('telescope.builtin').buffers {
            cwd_only = true,
            sort_mru = true,
          }
        end,
        desc = 'Fuzzy-find buffers',
      },
      {
        '<leader>fh',
        '<CMD>Telescope help_tags<CR>',
        desc = 'Fuzzy-find help tags',
      },
      {
        '<leader>fm',
        function()
          require('telescope.builtin').man_pages {
            sections = { '1', '2', '3', '5', '7' },
          }
        end,
        desc = 'Fuzzy-find man pages',
      },
      {
        '<leader>fo',
        '<CMD>Telescope oldfiles<CR>',
        desc = 'Fuzzy-find old files',
      },
      {
        '<leader>fr',
        '<CMD>Telescope registers<CR>',
        desc = 'Fuzzy-find registers',
      },
      {
        '<leader>fc',
        '<CMD>Telescope command_history<CR>',
        desc = 'Fuzzy-find command history',
      },
    },
    config = true,
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        config = function() require('telescope').load_extension('fzf') end,
        enabled = false,
      },
      {
        'olimorris/persisted.nvim',
        lazy = false,
        priority = 60,
        opts = {
          use_git_branch = true,
          default_branch = 'master',
          autoload = false,
          ignored_dirs = {
            { '/tmp', exact = true },
          },
          should_autosave = function()
            if vim.bo.filetype == 'oil' then return false end
            if vim.bo.filetype == 'gitcommit' then return false end

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

          vim.api.nvim_create_autocmd('User', {
            pattern = 'PersistedSavePre',
            callback = function()
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local ft = vim.bo[buf].filetype
                if ft == 'oil' or ft == 'gitcommit' then
                  vim.api.nvim_buf_delete(buf, { force = true })
                end
              end
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
