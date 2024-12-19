---@diagnostic disable-next-line unused-function
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
---@diagnostic disable-next-line unused-function
local in_text = function() return vim.fn['vimtex#syntax#in_mathzone']() == 0 end

---@diagnostic disable undefined-global
local table_node = function(args)
  local tabs = {}
  local count
  table = args[1][1]:gsub('%s', ''):gsub('|', '')
  count = table:len()
  for j = 1, count do
    local iNode
    iNode = i(j)
    tabs[2 * j - 1] = iNode
    if j ~= count then tabs[2 * j] = t(' & ') end
  end
  return sn(nil, tabs)
end

local rec_table = function()
  return sn(nil, {
    c(1, {
      t(''),
      sn(nil, {
        t { '\\\\', '' },
        d(1, table_node, { ai[1] }),
        d(2, rec_table, { ai[1] }),
      }),
    }),
  })
end

return {
  s(
    {
      trig = 'figure',
      desc = 'Create figure',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
      \begin{figure}<>
        \centering
        \includegraphic[width=0.<>\linewidth]{<>}
        \caption{<>}
      \end{figure}
      ]],
      {
        c(1, { t(''), t('[H]'), t('[htb]') }),
        i(2, '95'),
        i(3),
        i(4),
      }
    )
  ),

  s({
    trig = 'table',
    desc = 'Create tabular table',
    condition = in_text,
    show_condition = in_text,
  }, {
    t('\\begin{tabular}{'),
    i(1, '0'),
    t { '}', '' },
    d(2, table_node, { 1 }),
    t(' '),
    d(3, rec_table, { 1 }),
    t { '', '\\end{tabular}' },
  }),

  s(
    {
      trig = 'tblr',
      desc = 'Create tabularray table',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
      \begin{table}
        \centering
        \begin{tblr}{<>}
          <>
        \end{tblr}
      \end{table}
      ]],
      {
        i(1, 'cc'),
        i(2)
      }
    )
  ),

  s({
    trig = 'todo',
    desc = 'Enter an inline TODO',
    condition = in_text,
    show_condition = in_text,
  }, fmta('\\todo[inline]{<>}', i(0))),

  s({
    trig = 'subfile',
    desc = 'Add subfile preamble',
    condition = in_text,
    show_condition = in_text,
  }, {
    t { '\\documentclass[master.tex]{subfiles}', '\\begin{document}', '' },
    i(0, ''),
    t { '', '\\end{document}' },
  }),

  s(
    {
      trig = 'section',
      desc = 'Create new (sub)section',
      condition = in_text,
      show_condition = in_text,
    },
    fmta('\\<>section{<>}', {
      c(2, { t(''), t('sub'), t('subsub') }),
      i(1),
    })
  ),
}, {
  s(
    {
      trig = ';i',
      desc = 'Create new list',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { c(1, { t('itemize'), t('enumerate'), t('description') }), i(0), rep(1) }
    )
  ),
}
