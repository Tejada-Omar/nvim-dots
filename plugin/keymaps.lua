vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<leader>fs', function()
  local fzf = require('fzf-lua')
  fzf.files {
    fd_opts = '-c never -tf -tl -d 1 -e vim -E .git -E node_modules',
    actions = {
      ['enter'] = function(sel) vim.cmd.source(sel[1]) end,
    },
  }
end, { desc = 'Load session' })

vim.keymap.set('n', '<leader>fS', function()
  vim.ui.input({
    prompt = 'Session Name',
  }, function(sel)
    if sel == nil then return end

    sel = vim.trim(sel)
    local file = sel ~= '' and 'Session-' .. sel .. '.vim' or 'Session.vim'

    if not vim.uv.fs_stat(file) then
      vim.cmd.mksession(file)
      return
    end

    vim.ui.select(
      { 'Overwrite', 'Abort' },
      { prompt = 'File found. Action? ' },
      function(_, idx)
        if idx == 1 then vim.cmd.mksession { file, bang = true } end
      end
    )
  end)
end, { desc = 'Save session' })
