---@diagnostic disable-next-line unused-function
local in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
---@diagnostic disable-next-line unused-function
local in_text = function() return vim.fn['vimtex#syntax#in_mathzone']() == 0 end

---@diagnostic disable undefined-global

-- dynamic node
-- generally, postfix comes in the form PRE-CAPTURE-POST, so in this case, arg1
-- is the "pre" text, arg2 the "post" text
local dynamic_postfix = function(_, parent, _, user_arg1, user_arg2)
  local capture = parent.snippet.env.POSTFIX_MATCH
  if #capture > 0 then
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), t(capture), t(user_arg2), i(0) }
      )
    )
  else
    local visual_placeholder = ''
    if #parent.snippet.env.SELECT_RAW > 0 then
      visual_placeholder = parent.snippet.env.SELECT_RAW
    end
    return sn(
      nil,
      fmta(
        [[
        <><><><>
        ]],
        { t(user_arg1), i(1, visual_placeholder), t(user_arg2), i(0) }
      )
    )
  end
end

return {}, {
  postfix({
    trig = 'text',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, { d(1, dynamic_postfix, {}, { user_args = { '\\text{', '}' } }) }),

  postfix({
    trig = 'vec',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, { d(1, dynamic_postfix, {}, { user_args = { '\\vec{', '}' } }) }),

  postfix({
    trig = 'dot',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, { d(1, dynamic_postfix, {}, { user_args = { '\\dot{', '}' } }) }),

  postfix({
    trig = 'bar',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, { d(1, dynamic_postfix, {}, { user_args = { '\\bar{', '}' } }) }),

  postfix({
    trig = 'hat',
    condition = in_mathzone,
    show_condition = in_mathzone,
  }, { d(1, dynamic_postfix, {}, { user_args = { '\\hat{', '}' } }) }),
}
