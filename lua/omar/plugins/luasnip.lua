return {
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    opts = function()
      local types = require('luasnip.util.types')

      return {
        loaders_store_source = true,
        region_check_events = { 'CursorHold', 'InsertEnter' },
        enable_autosnippets = true,
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '«', 'diffAdded' } },
            },
          },
          [types.insertNode] = {
            active = {
              virt_text = { { '●', 'diffRemoved' } },
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
    end,
    keys = {
      {
        '<C-h>',
        function()
          local ls = require('luasnip')
          if ls.choice_active() then ls.change_choice(-1) end
        end,
        mode = { 'i', 's' },
        desc = 'Goto previous snippet choice',
      },
      {
        '<C-l>',
        function()
          local ls = require('luasnip')
          if ls.choice_active() then ls.change_choice(1) end
        end,
        mode = { 'i', 's' },
        desc = 'Goto next snippet choice',
      },
      {
        '<C-u><C-u>',
        function()
          if not require('luasnip').choice_active() then return end
          require('luasnip.extras.select_choice')()
        end,
        mode = { 'i' },
        desc = 'Select snippet choices',
      },
      {
        '<C-u><C-l>',
        function() require('luasnip.extras.otf').on_the_fly('s') end,
        desc = 'Load snippet from "s',
        mode = { 'i', 's' },
      },
      {
        '<C-u><C-g>',
        function()
          require('luasnip.extras.snip_location').jump_to_active_snippet {
            edit = function(file) vim.cmd('tabnew ' .. file) end,
          }
        end,
        desc = 'Edit snippet files',
        mode = { 'i' },
      },
      {
        '<leader>se',
        function()
          require('luasnip.loaders').edit_snippet_files {
            edit = function(file) vim.cmd('tabnew ' .. file) end,
          }
        end,
        desc = 'Edit snippet files',
      },
      {
        '<leader>sr',
        function()
          require('luasnip.loaders.from_lua').load { paths = { './snippets' } }
        end,
      },
    },
  },
}
