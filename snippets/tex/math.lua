---@diagnostic disable-next-line unused-function
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
---@diagnostic disable-next-line unused-function
local in_text = function() return vim.fn['vimtex#syntax#in_mathzone']() == 0 end

---@diagnostic disable undefined-global
return {}, {
  s({
    trig = ';so',
    desc = 'Enter ordered pair',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, fmta('\\langle <> \\rangle', i(1))),

  s({
    trig = ';ss',
    desc = 'Enter set',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, fmta('\\{ <> \\}', i(1))),

  s({
    trig = ';rv',
    desc = 'Insert \\vdash',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, t('\\vdash')),

  s({
    trig = ';rV',
    desc = 'Insert \\vDash',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, t('\\vDash')),

  s({
    trig = ';rr',
    desc = 'Insert \\var',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, fmta('\\var{<>}<>', { i(1), i(0) })),

  s({
    trig = ';rf',
    desc = 'Insert \\forall',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, t('\\forall')),

  s({
    trig = ';rF',
    desc = 'Insert \\forall',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, t('\\forall')),

  s(
    {
      trig = ';rs',
      desc = 'Insert a super and subscript',
      condition = in_mathzone,
      show_condition = in_mathzone,
    },
    fmta('<>_<>^<>', {
      i(1, 'f'),
      i(2, 'k'),
      i(0, 'n'),
    })
  ),

  s(
    {
      trig = ';sl',
      desc = 'Create math list',
      condition = in_mathzone,
      show_condition = in_mathzone,
    },
    fmta('<>_1, \\dots, <>_<>', {
      i(1, 'x'),
      rep(1),
      i(2, 'n'),
    })
  ),

  s(
    {
      trig = ';sL',
      desc = 'Create math list starting from zero',
      condition = in_mathzone,
      show_condition = in_mathzone,
    },
    fmta('<>_0, \\dots, <>_{<>-1}', {
      i(1, 'x'),
      rep(1),
      i(2, 'n'),
    })
  ),

  s({
    trig = ';f',
    desc = 'Create fraction',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, fmta('\\frac{<>}{<>}', { i(1), i(2) })),

  s(
    {
      trig = ';wq',
      desc = 'Create display equation',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
  \begin{equation*}
    <>
  \end{equation*}
  ]],
      { i(0) }
    )
  ),

  s({
    trig = ';e',
    desc = 'Create inline equation',
    condition = in_text,
    show_condition = in_text,
  }, fmt('${}${}', { i(1), i(0) })),

  s({
    trig = "'x",
    desc = 'Insert XOR',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, t('\\oplus')),

  s(
    {
      trig = ';wa',
      desc = 'Create align',
      condition = in_text,
      show_condition = in_text,
    },
    fmta(
      [[
  \begin{align*}
    <>
  \end{align*}
  ]],
      { i(0) }
    )
  ),

  s({
    trig = '#r',
    desc = 'Create mathrm',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, fmta('\\mathrm{<>}', { i(0) })),
}
