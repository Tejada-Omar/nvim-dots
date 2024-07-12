return {
  {
    'nvimtools/none-ls.nvim',
    main = 'null-ls',
    lazy = false,
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'gbprod/none-ls-shellcheck.nvim',
      'gbprod/none-ls-luacheck.nvim',
    },
    opts = function()
      local utils = require('omar.plugins.lsp.utils.utils')
      local null_ls = require('null-ls')
      local hover = null_ls.builtins.hover

      return {
        sources = {
          require('none-ls.code_actions.eslint_d'),
          require('none-ls-shellcheck.code_actions'),
          hover.dictionary.with {
            extra_filetypes = { 'vimwiki' },
          },
        },

        on_attach = function(_, bufnr)
          -- utils.format_on_save(client, bufnr)
          utils.mappings(bufnr)
        end,
      }
    end,
  },
}
