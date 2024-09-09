return {
  {
    'neovim/nvim-lspconfig',
    event = { 'VimEnter', 'BufNew' },
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    keys = {
      { '<SPACE>e', vim.diagnostic.open_float, desc = 'Open diagnostic' },
      {
        '<SPACE>q',
        vim.diagnostic.setqflist,
        desc = 'Add all diagnostics to quickfix list',
      },
      {
        '<SPACE>s',
        function()
          vim.g.diag_virt_text = not vim.g.diag_virt_text
          vim.diagnostic.show(
            nil,
            nil,
            nil,
            { virtual_text = vim.g.diag_virt_text }
          )
        end,
        desc = 'Toggle diagnostic virtual text',
      },
    },
    config = function()
      local lsp = require('lspconfig')
      local utils = require('omar.plugins.lsp.utils.utils')

      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      local on_attach = function(_, bufnr) utils.mappings(bufnr) end

      vim.lsp.set_log_level(vim.lsp.log_levels.WARN)

      vim.g.diag_virt_text = false

      vim.diagnostic.config {
        virtual_text = vim.g.diag_virt_text,
        signs = true,
        severity_sort = true,
        float = { source = true },
      }

      lsp.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            format = { enable = false },
            hint = {
              enable = true,
            },
          },
        },
      }

      lsp.marksman.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'markdown' },
      }

      lsp.gopls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gofumpt = true,
          usePlaceholders = true,
          hints = {
            functionTypeParameters = true,
            parameterNames = true,
          },
        },
      }

      lsp.ts_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          includeInlayFunctionParameterTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          -- includeInlayParameterNameHints: 'none' | 'literals' | 'all';
          -- includeInlayParameterNameHintsWhenArgumentMatchesName: boolean;
          -- includeInlayFunctionParameterTypeHints: boolean;
          -- includeInlayVariableTypeHints: boolean;
          -- includeInlayVariableTypeHintsWhenTypeMatchesName: boolean;
          -- includeInlayPropertyDeclarationTypeHints: boolean;
          -- includeInlayFunctionLikeReturnTypeHints: boolean;
          -- includeInlayEnumMemberValueHints: boolean;
        },
      }

      -- Look into .get_mappings()
      local language_servers = {
        'pyright',
        'texlab',
        -- 'cssls',
        'html',
        'bashls',
        'kotlin_language_server',
        'vimls',
        'lemminx',
        'tailwindcss',
        'ansiblels',
        'docker_compose_language_service',
        'bufls',
      }

      for _, server in pairs(language_servers) do
        lsp[server].setup {
          capabilities = capabilities,
          on_attach = on_attach,
        }
      end
    end,
  },
}
