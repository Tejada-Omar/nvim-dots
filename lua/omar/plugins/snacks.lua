return {
  {
    'folke/snacks.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
      -- Toggle the profiler
      Snacks.toggle.profiler():map('<leader>pp')
      -- Toggle the profiler highlights
      Snacks.toggle.profiler_highlights():map('<leader>ph')

      return {
        bigfile = { enabled = true },
        dim = { enabled = true },
        debug = { enabled = true },
        profiler = { enabled = true },
        picker = { enabled = true },
      }
    end,
    keys = {
      {
        '<leader>ps',
        function() Snacks.profiler.scratch() end,
        desc = 'Profiler scratch buffer',
      },
      {
        '<leader>zz',
        function() require('snacks.zen').zen() end,
        desc = 'Toggle zen mode',
      },
      {
        '<leader>zo',
        function() require('snacks.zen').zoom() end,
        desc = 'Toggle zoom mode',
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
          Snacks.toggle.diagnostics():map('<leader>ud')
          Snacks.toggle.treesitter():map('<leader>uT')
          Snacks.toggle.inlay_hints():map('<leader>uh')
          Snacks.toggle.dim():map('<leader>uD')
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
        '<leader>zn',
        '<CMD>NoNeckPain<CR>',
        desc = 'Center buffer',
      },
    },
  },
}
