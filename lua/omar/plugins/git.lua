return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'UIEnter',
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
        function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            require('gitsigns').nav_hunk('next', { preview = true })
          end
        end,
        desc = 'Move to next diff hunk',
        buffer = 0,
      },
      {
        '[c',
        function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            require('gitsigns').nav_hunk('prev', { preview = true })
          end
        end,
        desc = 'Move to prev diff hunk',
        buffer = 0,
      },
      {
        '<leader>gs',
        '<CMD>Gitsigns stage_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Stage hunk',
        buffer = 0,
      },
      {
        '<leader>gr',
        '<CMD>Gitsigns reset_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Reset hunk',
        buffer = 0,
      },
      {
        '<leader>gS',
        '<CMD>Gitsigns stage_buffer<CR>',
        desc = 'Stage entire buffer',
        buffer = 0,
      },
      {
        '<leader>gu',
        '<CMD>Gitsigns undo_stage_hunk<CR>',
        desc = 'Undo stage hunk',
        buffer = 0,
      },
      {
        '<leader>gR',
        '<CMD>Gitsigns reset_buffer<CR>',
        desc = 'Reset entire buffer',
        buffer = 0,
      },
      {
        '<leader>gp',
        '<CMD>Gitsigns preview_hunk<CR>',
        desc = 'Preview hunk',
        buffer = 0,
      },
      {
        '<leader>gb',
        function() require('gitsigns').blame_line { full = true } end,
        desc = 'Blame line',
        buffer = 0,
      },
      {
        '<leader>gtb',
        '<CMD>Gitsigns toggle_current_line_blame<CR>',
        desc = 'Toggle current line blame',
        buffer = 0,
      },
      {
        '<leader>gtd',
        '<CMD>Gitsigns toggle_deleted<CR>',
        desc = 'Toggle deleted code',
        buffer = 0,
      },
      {
        'ih',
        '<CMD>Gitsigns select_hunk<CR>',
        mode = { 'o', 'x' },
        desc = 'Select hunk',
        buffer = 0,
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
    dependencies = { 'tpope/vim-rhubarb', 'shumphrey/fugitive-gitlab.vim' },
    keys = {
      { '<leader>gg', '<CMD>Git<CR>', desc = 'Open Git' },
    },
  },
  {
    'akinsho/toggleterm.nvim',
    optional = true,
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local lazygit = require('toggleterm.terminal').Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
      }

      vim.keymap.set(
        { 'n', 't' },
        '<leader>g=',
        function() lazygit:toggle() end
      )
    end,
    keys = {
      {
        '<leader>g=',
        desc = 'Toggle lazygit window',
      },
    },
  },
}
