---@diagnostic disable: undefined-global
local function attribution()
  return sn(1, fmt('{} <{}>', { i(1, 'NAME'), i(2, 'EMAIL') }))
end

return {
  s(
    { trig = 'co', desc = 'Co-authored' },
    sn(1, { t('Co-authored-by: '), d(1, attribution) })
  ),
  s(
    { trig = 'so', desc = 'Signed-off' },
    sn(1, { t('Signed-off-by: '), d(1, attribution) })
  ),
  s(
    { trig = 'on', desc = 'On-behalf' },
    sn(1, { t('On-behalf-of: '), d(1, attribution) })
  ),
}
