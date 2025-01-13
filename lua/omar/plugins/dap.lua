return {
  {
    'mfussenegger/nvim-dap',
    dependencies = { { 'rcarriga/cmp-dap' } },
    build = ':helptags ALL',
    cond = vim.g.lsp_enabled,
    keys = {
      {
        '<leader>db',
        '<CMD>DapToggleBreakpoint<CR>',
        desc = 'Toggle breakpoint',
      },
      {
        '<leader>dl',
        function() require('dap').run_last() end,
        desc = 'Run last dap command',
      },
      {
        '<F5>',
        '<CMD>DapContinue<CR>',
        desc = 'Continue dap debugging',
      },
      {
        '<F10>',
        '<CMD>DapStepOver<CR>',
        desc = 'Step over next line for DAP',
      },
      {
        '<F11>',
        '<CMD>DapStepInto<CR>',
        desc = 'Step into inner context for DAP',
      },
      {
        '<F12>',
        '<CMD>DapStepOut<CR>',
        desc = 'Step out of context for DAP',
      },
    },
  },
  {
    'mrcjkb/rustaceanvim',
    build = ':helptags ALL',
    cond = vim.g.lsp_enabled,
    lazy = false,
    init = function()
      vim.g.rustaceanvim = function()
        local on_attach = function(_, bufnr)
          local utils = require('omar.plugins.lsp.utils.utils')
          utils.mappings(bufnr)
        end

        return {
          server = {
            on_attach = on_attach,
            default_settings = {
              ['rust-analyzer'] = {
                procMacro = {
                  enable = true,
                  ignored = {
                    ['async-trait'] = { 'async_trait' },
                    ['napi-derive'] = { 'napi' },
                    ['async-recursion'] = { 'async_recursion' },
                  },
                },
              },
            },
          },
          dap = {
            auto_generate_source_map = true,
            load_rust_types = true,
          },
        }
      end
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    cond = vim.g.lsp_enabled,
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    keys = {
      {
        '<leader>dt',
        function() require('dapui').toggle() end,
        desc = 'Open dap ui',
      },
    },
    config = function()
      local dapui = require('dapui')
      dapui.setup()
    end,
  },
  {
    'LiadOz/nvim-dap-repl-highlights',
    config = true,
    cond = vim.g.lsp_enabled,
  },
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    config = true,
    cond = vim.g.lsp_enabled,
  },
}
