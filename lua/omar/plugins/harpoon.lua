return {
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = 'harpoon2',
    keys = {
      {
        '<leader>la',
        function() require('harpoon'):list():add() end,
        desc = 'Pin buffer',
      },
      {
        '<leader>ll',
        function()
          local harpoon = require('harpoon')
          local fzf = require('fzf-lua')

          local list = harpoon:list()
          local items = {}
          for i = 1, list:length() do
            local item = list:get(i)
            if item and item.value and item.value ~= '' then
              table.insert(items, string.format('%d: %s', i, item.value)) -- skip empty lines if deletion didn't functional properly
            end
          end

          fzf.fzf_exec(items, {
            prompt = 'Harpoon Files> ',
            winopts = {
              width = 0.4,
              height = 0.4,
            },
            fzf_opts = {
              ['--preview'] = "bat --style=numbers --color=always $(echo {} | sed 's/^\\([0-9]\\+\\): //')",
            },
            actions = {
              ['default'] = function(selected)
                local idx = tonumber(selected[1]:match('^(%d+):'))
                if idx then list:select(idx) end
              end,
              ['ctrl-d'] = function(selected)
                local idx = tonumber(selected[1]:match('^(%d+):'))
                if idx then
                  local item = list:get(idx)
                  list:remove(item)
                end
              end,
            },
          })
        end,
        desc = 'Show pinned buffers',
      },
      {
        '<leader>lp',
        function() require('harpoon'):list():prev() end,
        desc = 'Go to previous pinned buffer',
      },
      {
        '<leader>ln',
        function() require('harpoon'):list():next() end,
        desc = 'Go to next pinned buffer',
      },
      {
        '<localleader><localleader>j',
        function() require('harpoon'):list():select(1) end,
        desc = 'Go to first pin',
      },
      {
        '<localleader><localleader>k',
        function() require('harpoon'):list():select(2) end,
        desc = 'Go to second pin',
      },
      {
        '<localleader><localleader>h',
        function() require('harpoon'):list():select(3) end,
        desc = 'Go to third pin',
      },
      {
        '<localleader><localleader>l',
        function() require('harpoon'):list():select(4) end,
        desc = 'Go to fourth pin',
      },
    },
  },
}
