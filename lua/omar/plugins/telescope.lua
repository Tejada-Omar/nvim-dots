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
        desc = 'Fzf sessions',
      },
    },
  },
}
