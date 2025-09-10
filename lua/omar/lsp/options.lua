local M = {}

M.get_lsp_capabilities = function()
  return require('blink.cmp').get_lsp_capabilities()
end

return M
