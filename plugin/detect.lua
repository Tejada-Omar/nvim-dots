vim.filetype.add {
  pattern = {
    ['.*%.github/workflows/[^/]?[./]*.+%.ya?ml'] = {
      'yaml.gha',
      priority = math.huge,
    },
  },
}
