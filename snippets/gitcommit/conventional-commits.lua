---@diagnostic disable: undefined-global
local function scope_defaults()
  return sn(1, {
    c(1, {
      sn(nil, { t('('), r(1, 'scope'), t(')') }),
      sn(nil, { t('('), r(1, 'scope'), t(')!') }),
      t(),
    }),
    t(': '),
    i(2),
  }, { stored = { ['scope'] = i(1, 'SCOPE') } })
end

return {
  ms(
    { 'feat', { trig = ';f', snippetType = 'autosnippet' } },
    sn(1, { t('feat'), d(1, scope_defaults) })
  ),

  ms(
    { 'fix', { trig = ';F', snippetType = 'autosnippet' } },
    sn(1, { t('fix'), d(1, scope_defaults) })
  ),

  ms(
    { 'refactor', { trig = ';r', snippetType = 'autosnippet' } },
    sn(1, { t('refactor'), d(1, scope_defaults) })
  ),

  ms(
    { 'release', { trig = ';R', snippetType = 'autosnippet' } },
    sn(1, { t('release'), d(1, scope_defaults) })
  ),

  ms(
    { 'chore', { trig = ';c', snippetType = 'autosnippet' } },
    sn(1, { t('chore'), d(1, scope_defaults) })
  ),

  ms(
    { 'ci', { trig = ';C', snippetType = 'autosnippet' } },
    sn(1, { t('ci'), d(1, scope_defaults) })
  ),

  ms(
    { 'docs', { trig = ';d', snippetType = 'autosnippet' } },
    sn(1, { t('docs'), d(1, scope_defaults) })
  ),

  ms(
    { 'style', { trig = ';s', snippetType = 'autosnippet' } },
    sn(1, { t('style'), d(1, scope_defaults) })
  ),

  ms(
    { 'perf', { trig = ';p', snippetType = 'autosnippet' } },
    sn(1, { t('perf'), d(1, scope_defaults) })
  ),

  ms(
    { 'test', { trig = ';t', snippetType = 'autosnippet' } },
    sn(1, { t('test'), d(1, scope_defaults) })
  ),

  ms(
    { 'build', { trig = ';b', snippetType = 'autosnippet' } },
    sn(1, { t('build'), d(1, scope_defaults) })
  ),
}
