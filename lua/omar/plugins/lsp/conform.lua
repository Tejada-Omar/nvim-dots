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
        javascript = { { 'prettierd', 'prettier' } },
        javascriptreact = { { 'prettierd', 'prettier' } },
        typescript = { { 'prettierd', 'prettier' } },
        typescriptreact = { { 'prettierd', 'prettier' } },
        css = { { 'prettierd', 'prettier' } },
        scss = { { 'prettierd', 'prettier' } },
        html = { { 'prettierd', 'prettier' } },
        json = { { 'prettierd', 'prettier' } },
        jsonc = { { 'prettierd', 'prettier' } },
        jsx = { { 'prettierd', 'prettier' } },
        markdown = { { 'prettierd', 'prettier' } },
        ['markdown.mdx'] = { { 'prettierd', 'prettier' } },
        yaml = { { 'prettierd', 'prettier' } },

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
