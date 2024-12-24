vim.api.nvim_create_user_command('Help', function(opts)
  if vim.t.help_opened == nil then vim.t.help_opened = false end

  local mods = { silent = true, keepalt = true }
  if not vim.t.help_opened then
    vim.cmd.help { mods = mods }
    vim.cmd.helpclose { mods = mods }
    vim.t.help_opened = true
  end

  if #vim.fn.getcompletion(opts.args, 'help') == 0 then
    vim.cmd('echohl ErrorMsg')
    vim.cmd('echomsg "E149: Sorry, no help for ' .. opts.args .. '"')
    vim.cmd('echohl None')
    return
  end

  vim.cmd.edit { args = { vim.o.helpfile }, mods = mods }
  if string.len(opts.args) > 0 then
    vim.cmd.help(opts.args)
  else
    vim.cmd.help()
  end
end, {
  nargs = '?',
  complete = 'help',
  bar = true,
})
