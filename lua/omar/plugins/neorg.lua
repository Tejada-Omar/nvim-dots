return {
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    init = function()
      vim.api.nvim_create_autocmd(
        { 'BufEnter', 'VimEnter', 'BufWinEnter' },
        { pattern = { '*.norg' }, command = 'set conceallevel=3' }
      )
    end,
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.completion'] = {
          config = {
            name = '[Neorg]',
            engine = 'nvim-cmp',
          },
        },
        ['core.concealer'] = {
          config = {
            folds = true,
          },
        },
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/Documents/notes',
            },
            default_workspace = 'notes',
          },
        },
        ['core.journal'] = {
          config = {
            workspace = 'notes',
          },
        },
        ['core.summary'] = {},
        ['core.export'] = {},
        ['core.export.markdown'] = {
          config = {
            extensions = { 'all' },
          },
        },
      },
    },
  },
  {
    'nvim-neorg/neorg-telescope',
    dependencies = { 'nvim-neorg/neorg' },
    keys = {
      {
        '<leader>fn',
        '<Plug>(neorg.telescope.find_norg_files)',
        desc = 'Find norg files',
        buffer = 0,
      },
      {
        '<leader>fmb',
        '<Plug>(neorg.telescope.backlinks.file_backlinks)',
        desc = 'Find file backlinks',
        buffer = 0,
      },
      {
        '<leader>fms',
        '<Plug>(neorg.telescope.switch_workspace)',
        desc = 'Switch neorg workspace',
        buffer = 0,
      },
      {
        '<leader>fi',
        '<Plug>(neorg.telescope.insert_link)',
        desc = 'Insert neorg link',
        buffer = 0,
      },
    },
  },
}
