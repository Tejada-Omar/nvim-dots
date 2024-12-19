---@diagnostic disable: undefined-global
return {
  s(
    {
      trig = '~~~',
      dscr = 'Current working directory',
    },
    fmt('{cwd}/{}/resources/{}', {
      i(1, 'PARENT DIR'),
      i(2, 'NAME OF RESOURCE'),
      cwd = f(function() return vim.fn.getcwd() end),
    })
  ),
  s(
    {
      trig = 'startnotes',
      dscr = 'Create notes header',
    },
    fmt('# {}\n\n> Lecture {}\n\n> {date}\n\n\n', {
      i(1, 'CLASS'),
      i(2, 'NUMBER'),
      date = f(function() return os.date('%A, %B %-d, %Y') end),
    })
  ),
}
