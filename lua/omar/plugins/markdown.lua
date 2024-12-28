return {
  {
    'jakewvincent/mkdnflow.nvim',
    main = 'mkdnflow',
    ft = 'markdown',
    dependencies = {
      'hrsh7th/nvim-cmp',
      opts = function()
        require('cmp').setup.filetype('markdown', {
          sources = { { name = 'mkdnflow' } },
        })
      end,
    },
    opts = {
      modules = {
        foldtext = false,
        yaml = true,
        cmp = true,
      },
      links = {
        context = 1,
      },
      to_do = {
        symbols = { ' ', '/', 'X' },
      },
      tables = {
        auto_extends_rows = true,
        style = {
          separator_padding = 1,
        },
      },
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    init = function()
      vim.cmd('let g:mkdp_echo_preview_url = 1')
      vim.cmd("let g:mkdp_theme = 'dark'")
    end,
    build = function() vim.fn['mkdp#util#install']() end,
    keys = {
      {
        '<C-s>',
        '<Plug>MarkdownPreviewToggle',
        desc = 'Preview Markdown in browser',
      },
    },
  },
}
