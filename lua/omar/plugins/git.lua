local diff_move = function(dir, preview)
  if vim.wo.diff then
    local cmd_dir = dir == 'next' and ']c' or '[c'
    vim.cmd.normal { cmd_dir, band = true }
  else
    require('gitsigns').nav_hunk(dir, { preview = preview })
  end
end

return {
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
    },
    keys = {
      {
        ']c',
        function() diff_move('next', false) end,
        desc = 'Move to next diff hunk',
      },
      {
        '[c',
        function() diff_move('prev', false) end,
        desc = 'Move to prev diff hunk',
      },
      {
        ']C',
        function() diff_move('next', true) end,
        desc = 'Move to next diff hunk',
      },
      {
        '[C',
        function() diff_move('prev', true) end,
        desc = 'Move to prev diff hunk',
      },
      {
        '<leader>gs',
        '<CMD>Gitsigns stage_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Stage hunk',
      },
      {
        '<leader>gr',
        '<CMD>Gitsigns reset_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Reset hunk',
      },
      {
        '<leader>gS',
        '<CMD>Gitsigns stage_buffer<CR>',
        desc = 'Stage entire buffer',
      },
      {
        '<leader>gu',
        '<CMD>Gitsigns undo_stage_hunk<CR>',
        desc = 'Undo stage hunk',
      },
      {
        '<leader>gR',
        '<CMD>Gitsigns reset_buffer<CR>',
        desc = 'Reset entire buffer',
      },
      {
        '<leader>gp',
        '<CMD>Gitsigns preview_hunk<CR>',
        desc = 'Preview hunk',
      },
      {
        '<leader>gb',
        function() require('gitsigns').blame_line { full = true } end,
        desc = 'Blame line',
      },
      {
        '<leader>gtb',
        '<CMD>Gitsigns toggle_current_line_blame<CR>',
        desc = 'Toggle current line blame',
      },
      {
        '<leader>gtd',
        '<CMD>Gitsigns preview_hunk_inline<CR>',
        desc = 'Toggle deleted code',
      },
      {
        'ih',
        '<CMD>Gitsigns select_hunk<CR>',
        mode = { 'o', 'x' },
        desc = 'Select hunk',
      },
    },
  },
  {
    'NeogitOrg/neogit',
    enabled = false,
    event = 'VeryLazy',
    keys = {
      { '<leader>gg', '<CMD>Neogit<CR>', desc = 'Open Neogit' },
      {
        '<leader>gs',
        '<CMD>Neogit kind=auto<CR>',
        desc = 'Open Neogit in split',
      },
    },
    opts = {
      commit_editor = {
        kind = 'replace',
        staged_diff_split_kind = 'auto',
      },
    },
    dependencies = {
      {
        'sindrets/diffview.nvim',
        opts = {
          enhanced_diff_hl = true,
        },
        keys = {
          { '<leader>hd', '<CMD>DiffviewOpen<CR>', desc = 'Open diffview' },
        },
      },
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'tpope/vim-fugitive',
    lazy = false,
    dependencies = { 'tpope/vim-rhubarb', 'shumphrey/fugitive-gitlab.vim' },
    keys = {
      { '<leader>gg', '<CMD>Git<CR>', desc = 'Open Git' },
    },
  },
}
