local choose_cwd = function()
  local nss = { vim.b, vim.w, vim.t, vim.g }
  for _, ns in ipairs(nss) do
    if ns.fzf_cwd ~= nil then return ns.fzf_cwd end
  end
  return nil
end

local clear_cwd = function(ns_opts, ns)
  -- NOTE: Just a switch-case with fallthrough and 'global' as the default case
  if ns == 'buffer' then
    goto buffer
  elseif ns == 'window' then
    goto window
  elseif ns == 'tab' then
    goto tab
  end

  ns_opts['global'] = nil
  ::tab::
  ns_opts['tab'] = nil
  ::window::
  ns_opts['window'] = nil
  ::buffer::
  ns_opts['buffer'] = nil
end

vim.api.nvim_create_user_command('FzfVar', function(opts)
  local clear_needed = opts.bang
  local ns_opts = {
    ['buffer'] = vim.b[vim.api.nvim_get_current_buf()],
    ['window'] = vim.w[vim.api.nvim_get_current_win()],
    ['tab'] = vim.t[vim.api.nvim_get_current_tabpage()],
    ['global'] = vim.g,
  }
  vim.ui.select(
    { 'buffer', 'window', 'tab', 'global' },
    { prompt = 'Choose variable namespace' },
    function(ns_sel)
      if ns_sel == nil then return end
      if clear_needed then
        clear_cwd(ns_opts, ns_sel)
        return
      end

      local ns = ns_opts[ns_sel]

      require('fzf-lua').files {
        fd_opts = "-c never -td -E .git -E node_modules -E '*.lock' -E '*lock.json'",
        actions = {
          ['enter'] = function(dir_sel)
            if dir_sel == nil or #dir_sel == 0 then return end
            local dir = type(dir_sel) == 'string' and dir_sel or dir_sel[1]
            ns.fzf_cwd = dir
          end,
        },
      }
    end
  )
end, { bang = true, nargs = 0, desc = 'Wrapper around fzf_cwd variables' })

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
      files = {
        follow = true,
        fd_opts = "-c never -tf -tl -E worktrees -E .git -E node_modules -E '*.lock' -E '*lock.json'",
      },
      grep = {
        fd_opts = "-c never -tf -tl -E worktrees -E .git -E node_modules -E '*.lock' -E '*lock.json'",
        rg_opts = "--column -n --no-heading --color=always -S --max-columns=4096 -g '!{.git,node_modules,*.lock,*lock.json,worktrees}' -e ",
      },
    },
    keys = {
      {
        '<leader>ff',
        function() require('fzf-lua').files { cwd = choose_cwd() } end,
        desc = 'Fzf files',
      },
      {
        '<leader>fF',
        function() require('fzf-lua').resume() end,
        desc = 'Resume Fzf',
      },
      {
        '<leader>fg',
        function() require('fzf-lua').grep { cwd = choose_cwd() } end,
        desc = 'Grep files',
      },
      {
        '<leader>fg',
        function() require('fzf-lua').live_grep { cwd = choose_cwd() } end,
        desc = 'Live-grep files',
      },
      {
        '<leader>fb',
        function() require('fzf-lua').buffers { cwd = choose_cwd() } end,
        desc = 'Fzf buffers',
      },
      {
        '<leader>fj',
        function() require('fzf-lua').jumps { cwd = choose_cwd() } end,
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
        function() require('fzf-lua').lsp_finder { cwd = choose_cwd() } end,
        desc = 'Fzf lsp items',
      },
      {
        '<leader>fv',
        function() require('fzf-lua').keymaps() end,
        desc = 'Fzf keymaps',
      },
      {
        '<leader>fV',
        '<CMD>FzfVar<CR>',
        desc = 'Set fzf search directories',
      },
      {
        '<leader>fd',
        function()
          require('fzf-lua').diagnostics_document { cwd = choose_cwd() }
        end,
        desc = 'Fzf diagnostics',
      },
    },
  },
}
