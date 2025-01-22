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
}
