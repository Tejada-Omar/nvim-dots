return {
  {
    'mfussenegger/nvim-lint',
    lazy = false,
    init = function()
      require('lint').linters_by_ft = {
        ['yaml.gha'] = { 'actionlint' },
        ['yaml.ansible'] = { 'ansible_lint' },
        proto = { 'buf_lint', 'protolint' },
        lua = { 'luacheck' },
        go = { 'golangcilint' },
        typescript = { 'eslint_d' },
        javascript = { 'eslint_d' },
      }
    end,
  },
}
