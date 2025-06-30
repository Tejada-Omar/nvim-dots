return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<localleader>f',
        function()
          require('conform').format {
            filter = function(client) return client.name ~= 'ts_ls' end,
          }
        end,
        mode = { 'n', 'v' },
        desc = 'Format buffer',
      },
    },
    opts = {
      default_format_opts = {
        lsp_format = 'fallback',
      },
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
        json5 = { 'prettierd', 'prettier', stop_after_first = true },
        jsx = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
        ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
        yaml = { 'prettierd', 'prettier', stop_after_first = true },

        python = { 'black' },
        lua = { 'stylua' },
        tex = { 'latexindent' },
        -- golines called regular goimports implicitly
        go = { 'gofumpt', 'golines', 'goimports-reviser' },
        cpp = { 'clang-format' },
        java = { 'google-java-format', lsp_format = 'prefer' },
        rust = { 'rustfmt', lsp_format = 'fallback' },
        cmake = { 'cmake_format' },
        sql = { 'sqlfluff' },
        dart = { 'dart_format' },
        ['_'] = { 'trim_newlines', 'trim_whitespace' },
      },
      format_after_save = function(bufnr)
        if
          not (vim.g.autoformat_enabled or vim.b[bufnr].autoformat_enabled)
        then
          return
        end
        return { bufnr = bufnr }
      end,
    },
    config = function(_, opts)
      local conform = require('conform')

      conform.setup(opts)
      conform.formatters.golines = {
        prepend_args = { '--shorten-comments' },
      }
      conform.formatters.latexindent = {
        prepend_args = { '-l', '.latexindent.yaml', '-m' },
      }
    end,
  },
}
