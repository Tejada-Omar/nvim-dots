return {
  {
    'jakewvincent/mkdnflow.nvim',
    main = 'mkdnflow',
    ft = 'markdown',
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
      vim.cmd("let g:mkdp_filetypes = ['markdown']")
    end,
    build = function()
      vim.cmd('Lazy load markdown-preview.nvim')
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      {
        '<C-s>',
        '<Plug>MarkdownPreviewToggle',
        desc = 'Preview Markdown in browser',
      },
    },
  },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      sources = {
        default = { 'mkdnflow' },
        providers = {
          mkdnflow = {
            name = 'mkdnflow',
            module = 'blink.compat.source',
          },
        },
      },
    },
  },
}
