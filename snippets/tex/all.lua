---@diagnostic disable-next-line unused-function
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
---@diagnostic disable-next-line unused-function
local in_text = function() return vim.fn['vimtex#syntax#in_mathzone']() == 0 end

---@diagnostic disable undefined-global
return {}, {
  s(
    { trig = ';b', desc = 'Begin/End environment' },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { i(1), i(0), rep(1) }
    )
  ),
}
