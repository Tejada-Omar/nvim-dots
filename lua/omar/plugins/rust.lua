local on_attach = function(client, bufnr)
  require('omar.lsp.maps').on_attach(client, bufnr)

  local set = vim.keymap.set
  local opts = { buffer = bufnr }

  set('n', 'gra', '<CMD>RustLsp codeAction<CR>', opts)

  set('n', ']e', '<CMD>RustLsp explainError cycle<CR>', opts)
  set('n', '[e', '<CMD>RustLsp explainError cycle_prev<CR>', opts)
  set(
    'n',
    '<localleader>E',
    '<CMD>RustLsp explainError current<CR>',
    { buffer = bufnr, desc = 'Explain cargo error' }
  )

  set('n', ']d', '<CMD>RustLsp renderDiagnostic cycle<CR>', opts)
  set('n', '[d', '<CMD>RustLsp renderDiagnostic cycle_prev<CR>', opts)
  set(
    'n',
    '<localleader>e',
    '<CMD>RustLsp renderDiagnostic current<CR>',
    { buffer = bufnr, desc = 'Explain cargo diagnostic' }
  )

  set(
    'n',
    '<localleader>d',
    '<CMD>RustLsp relatedDiagnostics<CR>',
    { buffer = bufnr, desc = 'Show related diagnostics' }
  )
end

return {
  {
    'mrcjkb/rustaceanvim',
    build = ':helptags ALL',
    cond = vim.g.lsp_enabled,
    lazy = false,
    init = function()
      vim.g.rustaceanvim = function()
        return {
          server = {
            on_attach = on_attach,
            default_settings = {
              ['rust-analyzer'] = {
                procMacro = {
                  enable = true,
                  ignored = {
                    ['async-trait'] = { 'async_trait' },
                    ['napi-derive'] = { 'napi' },
                    ['async-recursion'] = { 'async_recursion' },
                  },
                },
              },
            },
          },
          dap = {
            auto_generate_source_map = true,
            load_rust_types = true,
          },
          tools = {
            code_actions = {
              ui_select_fallback = true,
            },
          },
        }
      end
    end,
  },
}
