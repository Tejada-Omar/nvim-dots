return {
  {
    'hrsh7th/nvim-cmp',
    event = 'UIEnter',
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
    },
    opts = function()
      local luasnip = require('luasnip')
      local cmp = require('cmp')

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api
              .nvim_buf_get_lines(0, line - 1, line, true)[1]
              :sub(col, col)
              :match('%s')
            == nil
      end

      return {
        mapping = {
          ['<C-o>'] = cmp.mapping.scroll_docs(-4),
          ['<C-p>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'orgmode' },
          { name = 'mkdnflow' },
        },
        {
          { name = 'buffer' },
          { name = 'path' },
        },
      }
    end,
    config = function(_, opts)
      local cmp = require('cmp')

      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

      cmp.setup(opts)

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })

      cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
        sources = {
          { name = 'dap' },
        },
      })
    end,
  },
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  { 'hrsh7th/cmp-path', enabled = false },
  {
    'rcarriga/cmp-dap',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
  },
}
