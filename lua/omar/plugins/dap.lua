return {
  {
    'mfussenegger/nvim-dap',
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
    'rcarriga/nvim-dap-ui',
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
    'leoluz/nvim-dap-go',
    ft = 'go',
    config = true,
    cond = vim.g.lsp_enabled,
  },
}
