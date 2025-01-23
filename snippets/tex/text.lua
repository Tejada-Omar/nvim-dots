---@diagnostic disable-next-line unused-function
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
---@diagnostic disable-next-line unused-function
local in_text = function() return vim.fn['vimtex#syntax#in_mathzone']() == 0 end

---@diagnostic disable undefined-global
local insert_env_option = function(name, show_option)
  local tex_opt = sn(nil, { t('['), i(1), t(']') })
  local choice =  show_option == true and { tex_opt, t('') }
    or { t(''), tex_opt }

  return fmta(
    [[
    \begin{<>}<>
      <>
    \end{<>}
    ]],
    { t(name), c(1, choice), i(0), t(name) }
  )
end

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
        \includegraphics[width=0.<>\linewidth]{<>}
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

  s(
    {
      trig = 'subfigure',
      desc = 'Create subfigure',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
      \begin{subfigure}{0.<>\linewidth}
        \centering
        \includegraphics[width=\linewidth]{<>}
        \caption{<>}
      \end{subfigure}
      ]],
      {
        i(1, '24'),
        i(2),
        i(3),
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
        i(2),
      }
    )
  ),

  s({
    trig = 'todo',
    desc = 'Enter an inline TODO',
    condition = in_text,
    show_condition = in_text,
  }, fmta('\\todo<>{<>}<>', { c(2, { t(''), t('[inline]') }), i(1), i(0) })),

  s(
    {
      trig = 'margin',
      desc = 'Create a note in the margin',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      '\\marginnote{<>}<>',
      { i(1), c(2, { t(''), t('[1cm]'), t('[-1cm]') }) }
    )
  ),

  s({
    trig = 'subfile',
    desc = 'Add subfile preamble',
    condition = in_text,
    show_condition = in_text,
  }, {
    t { '\\documentclass[master.tex]{subfiles}', '\\begin{document}', '', '' },
    i(0),
    t { '', '', '\\end{document}' },
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

  s({
    trig = 'bold',
    desc = 'Create bold text',
    condition = in_text,
    show_condition = in_text,
  }, fmta('\\textbf{<>}<>', { i(1), i(0) })),

  s({
    trig = 'italic',
    desc = 'Create italic text',
    condition = in_text,
    show_condition = in_text,
  }, fmta('\\textit{<>}<>', { i(1), i(0) })),
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

  s({
    trig = ';dd',
    desc = 'Create new definition',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('definition', true)),

  s({
    trig = ';dt',
    desc = 'Create new theorem',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('theorem', true)),

  s({
    trig = ';dl',
    desc = 'Create new lemma',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('lemma', false)),

  s({
    trig = ';dc',
    desc = 'Create new corollary',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('corollary', false)),

  s({
    trig = ';do',
    desc = 'Create new proposition',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('proposition', false)),

  s({
    trig = ';de',
    desc = 'Create new example',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('example', false)),

  s({
    trig = ';dn',
    desc = 'Create new note',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('note', false)),

  s({
    trig = ';dp',
    desc = 'Create new proof',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('proof', false)),

  s({
    trig = ';dP',
    desc = 'Create new subproof',
    condition = in_text,
    show_condition = in_text,
  }, insert_env_option('subproof', false)),
}
