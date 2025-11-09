return {
  {
    'nvim-mini/mini.statusline',
    init = function() vim.o.showmode = false end,
    opts = function()
      local mini = require('mini.statusline')
      local mode, mode_hl = mini.section_mode { trunc_width = 120 }
      local git = mini.section_git { trunc_width = 40 }
      local filename = mini.section_filename { trunc_width = 140 }
      local fileinfo = mini.section_fileinfo { trunc_width = 120 }
      local location = mini.section_location { trunc_width = 75 }
      local search = mini.section_searchcount { trunc_width = 75 }

      return {
        content = {
          active = function()
            return mini.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
          inactive = function()
            return mini.combine_groups {
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location } },
            }
          end,
        },

        use_icons = false,
      }
    end,
  },
}
