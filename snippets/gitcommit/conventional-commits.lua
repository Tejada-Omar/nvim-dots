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
  s({ trig = 'feat' }, sn(1, { t('feat'), d(1, scope_defaults) })),
  s({ trig = 'fix' }, sn(1, { t('fix'), d(1, scope_defaults) })),
  s({ trig = 'docs' }, sn(1, { t('docs'), d(1, scope_defaults) })),
  s({ trig = 'refactor' }, sn(1, { t('refactor'), d(1, scope_defaults) })),
  s({ trig = 'style' }, sn(1, { t('style'), d(1, scope_defaults) })),
  s({ trig = 'perf' }, sn(1, { t('perf'), d(1, scope_defaults) })),
  s({ trig = 'test' }, sn(1, { t('test'), d(1, scope_defaults) })),
  s({ trig = 'chore' }, sn(1, { t('chore'), d(1, scope_defaults) })),
  s({ trig = 'build' }, sn(1, { t('build'), d(1, scope_defaults) })),
  s({ trig = 'ci' }, sn(1, { t('ci'), d(1, scope_defaults) })),
  s({ trig = 'release' }, sn(1, { t('release'), d(1, scope_defaults) })),
}
