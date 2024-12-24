local sources = { 'luasnip', 'buffer', 'path' }
if vim.g.lsp_enabled then table.insert(sources, 1, 'lsp') end

return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',
    dependencies = { 'L3MON4D3/LuaSnip' },
    opts_extend = { 'sources.default' },
    opts = {
      keymap = {
        preset = 'none',
        ['<C-SPACE>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        ['<C-S-n>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-S-p>'] = { 'scroll_documentation_up', 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },

        ['<C-j>'] = { 'snippet_forward', 'fallback' },
        ['<C-k>'] = { 'snippet_backward', 'fallback' },
      },
      sources = { default = sources },
      completion = {
        list = { selection = 'manual' },
        keyword = {
          regex = '[-_#]\\|\\k',
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        menu = {
          draw = {
            treesitter = { 'lsp' },
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'source_name', gap = 1 },
            },
          },
        },
      },
      signature = { enabled = true },
      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        jump = function(direction) require('luasnip').jump(direction) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
      },
    },
  },
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    config = true,
  },
}
