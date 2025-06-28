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

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.autoformat_enabled = false
  else
    vim.g.autoformat_enabled = false
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.autoformat_enabled = true
  vim.g.autoformat_enabled = true
end, {
  desc = 'Re-enable autoformat-on-save',
})
