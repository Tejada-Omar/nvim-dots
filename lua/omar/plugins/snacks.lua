return {
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
      -- Toggle the profiler
      Snacks.toggle.profiler():map('<leader>tp')
      -- Toggle the profiler highlights
      Snacks.toggle.profiler_highlights():map('<leader>th')

      return {
        bigfile = { enabled = true },
        dim = { enabled = true },
        debug = { enabled = true },
        profiler = { enabled = true },
        picker = { enabled = true, ui_select = false },
        input = { enabled = true },
        bufdelete = { enabled = true },
      }
    end,
    keys = {
      {
        '<leader>ts',
        function() Snacks.profiler.scratch() end,
        desc = 'Profiler scratch buffer',
      },
      {
        '<leader>tz',
        function() require('snacks.zen').zen() end,
        desc = 'Toggle zen mode',
      },
      {
        '<leader>to',
        function() require('snacks.zen').zoom() end,
        desc = 'Toggle zoom mode',
      },
      {
        '<leader>dd',
        function() require('snacks.bufdelete').delete() end,
        desc = 'Delete current buffer',
      },
      {
        '<leader>do',
        function() require('snacks.bufdelete').other() end,
        desc = 'Delete other buffers',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...) Snacks.debug.inspect(...) end
          _G.bt = function() Snacks.debug.backtrace() end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- Create some toggle mappings
          Snacks.toggle.diagnostics():map('<leader>tdd')
          Snacks.toggle.treesitter():map('<leader>tT')
          Snacks.toggle.inlay_hints():map('<leader>ti')
          Snacks.toggle.dim():map('<leader>tD')
        end,
      })
    end,
  },
  {
    'shortcuts/no-neck-pain.nvim',
    opts = {
      buffers = {
        wo = {
          fillchars = 'eob: ',
        },
      },
    },
    keys = {
      {
        '<leader>tn',
        '<CMD>NoNeckPain<CR>',
        desc = 'Center buffer',
      },
    },
  },
}
