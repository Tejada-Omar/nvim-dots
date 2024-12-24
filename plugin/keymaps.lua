vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

vim.api.nvim_create_user_command('Cdd', function(args)
  local type = nil
  local upwards = true
  for i, arg in ipairs(args.fargs) do
    local flag = string.match(arg, '^-(%l)$') ~= nil
    if flag == nil then goto continue end

    table.remove(args.fargs, i)
    if flag == 't' or flag == 'l' then
      type = flag
    elseif flag == 'f' then
      upwards = false
    else
      print(string.format('Flag %s is not one of -[tlf]', arg))
      return
    end

    ::continue::
  end

  local path = args.fargs[1]
  if args.bang then
    path = vim.env.PWD
  elseif path == nil then
    path = vim.fn.expand('%:p')
  end

  -- local root = vim.fs.root(path ~= nil and path or 0, { '.git', '.gitignore' })
  local root
  if upwards then
    root = vim.fs.root(path ~= nil and path or 0, { '.git', '.gitignore' })
  else

  end

  if root == nil then
    print('No root found')
    return
  end

  if type == nil then
    vim.fn.chdir(root)
  elseif type == 't' then
    vim.fn.tchdir(root)
  elseif type == 'l' then
    vim.fn.lchdir(root)
  end
end, {
  bang = true,
  nargs = '*',
  complete = 'dir_in_path',
  desc = 'Change directory to next/previous git repositories',
})
