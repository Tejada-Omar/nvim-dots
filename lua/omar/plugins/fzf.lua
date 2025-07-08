return {
  {
    'ibhagwan/fzf-lua',
    lazy = false,
    config = function(_, opts)
      require('fzf-lua').setup(opts)
      vim.cmd.FzfLua('register_ui_select')
    end,
    opts = {
      'borderless',
      winopts = {
        fullscreen = true,
        preview = {
          hidden = true,
        },
      },
      keymap = {
        fzf = {
          true,
          ['ctrl-q'] = 'select-all+accept',
        },
      },
      defaults = {
        file_icons = false,
        git_icons = false,
      },
      previewers = {
        files = {
          follow = true,
          fd_opts = "-c never -H -tf -E .git -l -E 'node_modules' -E '*.lock' -E '*lock.json'",
        },
        grep = {
          fd_opts = "-c never -H -tf -E .git -l -E node_modules -E '*.lock' -E '*lock.json'",
          rg_opts = "--column -n --no-heading --color=always -S --max-columns=4096 -g '!{.git,node_modules,*.lock,*lock.json}' -e ",
        },
      },
    },
    keys = {
      {
        '<leader>ff',
        function() require('fzf-lua').files() end,
        desc = 'Fzf files',
      },
      {
        '<leader>fF',
        function() require('fzf-lua').resume() end,
        desc = 'Resume Fzf',
      },
      {
        '<leader>fg',
        function() require('fzf-lua').grep() end,
        desc = 'Grep files',
      },
      {
        '<leader>fg',
        function() require('fzf-lua').live_grep() end,
        desc = 'Live-grep files',
      },
      {
        '<leader>fb',
        function() require('fzf-lua').buffers() end,
        desc = 'Fzf buffers',
      },
      {
        '<leader>fj',
        function() require('fzf-lua').jumps() end,
        desc = 'Fzf jumps',
      },
      {
        '<leader>fm',
        function() require('fzf-lua').manpages() end,
        desc = 'Fzf manpages',
      },
      {
        '<leader>fh',
        function() require('fzf-lua').helptags() end,
        desc = 'Fzf helptags',
      },
      {
        '<leader>fr',
        function() require('fzf-lua').registers() end,
        desc = 'Fzf registers',
      },
      {
        '<leader>fl',
        function() require('fzf-lua').lsp_finder() end,
        desc = 'Fzf lsp items',
      },
      {
        '<leader>fv',
        function() require('fzf-lua').keymaps() end,
        desc = 'Fzf keymaps',
      },
      {
        '<leader>fd',
        function() require('fzf-lua').diagnostics_document() end,
        desc = 'Fzf diagnostics',
      },
    },
  },
}
