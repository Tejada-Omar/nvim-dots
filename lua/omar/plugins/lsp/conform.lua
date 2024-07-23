return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<space>f',
        function()
          require('conform').format {
            lsp_format = 'first',
            filter = function(client) return client.name ~= 'tsserver' end,
          }
        end,
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        scss = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        jsonc = { 'prettierd', 'prettier', stop_after_first = true },
        jsx = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },

        python = { 'black' },
        lua = { 'stylua' },
        tex = { 'latexindent' },
        -- golines called regular goimports implicitly
        go = { 'golines', 'goimports-reviser' },
      },
      format_after_save = {
        lsp_format = 'first',
        filter = function(client) return client.name ~= 'tsserver' end,
      },
    },
    config = function(_, opts)
      local conform = require('conform')

      conform.setup(opts)
      conform.formatters.golines = {
        prepend_args = { '--shorten-comments' },
      }
    end,
  },
}
