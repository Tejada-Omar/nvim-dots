vim.o.textwidth = 0
vim.o.conceallevel = 0

vim.keymap.set(
  { 'n', 'i' },
  '<M-CR>',
  function() require('orgmode').action('org_mappings.meta_return') end,
  { desc = 'Org meta-mapping', buffer = true }
)
