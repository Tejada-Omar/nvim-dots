return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'windwp/nvim-autopairs',
      { 'hrsh7th/cmp-nvim-lsp', cond = vim.g.lsp_enabled },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', cond = vim.g.lsp_enabled },
      'hrsh7th/cmp-buffer',
      'petertriho/cmp-git',
    },
    opts = function()
      local cmp = require('cmp')

      local sources = cmp.config.sources({
        { name = 'lazydev' },
        { name = 'luasnip' },
      }, {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vimtex' },
        { name = 'orgmode' },
        { name = 'mkdnflow' },
      }, {
        { name = 'buffer' },
      })

      cmp.event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done()
      )

      cmp.setup.filetype(
        { 'gitcommit', 'octo', 'NeogitCommitMessage' }, -- Defaults from source
        { { name = 'git' }, { name = 'luasnip' }, { name = 'buffer' } }
      )

      cmp.setup.filetype(
        { 'dap-repl', 'dapui_watches', 'dapui_hover' },
        { { name = 'dap' } }
      )

      return {
        snippet = {
          expand = function(args) require('luasnip').lsp_expand(args.body) end,
        },
        sources = sources,
        preselect = 'none',
        mapping = {
          ['<C-space'] = function()
            if cmp.visible_docs() then
              cmp.close_docs()
            else
              cmp.open_docs()
            end
          end,
          ['<C-n>'] = {
            i = function()
              if cmp.visible() then
                cmp.select_next_item { behavior = 'insert' }
              else
                cmp.complete()
              end
            end,
          },
          ['<C-p>'] = {
            i = function()
              if cmp.visible() then
                cmp.select_prev_item { behavior = 'insert' }
              else
                cmp.complete()
              end
            end,
          },
          ['<C-y>'] = {
            i = cmp.mapping.confirm { select = false },
          },
          ['<C-e>'] = {
            i = cmp.mapping.abort(),
          },
          ['<CR>'] = cmp.mapping {
            i = function(fallback)
              if not cmp.visible() or not cmp.get_active_entry() then
                fallback()
                return
              end

              cmp.confirm { behaviour = 'replace', select = false }
            end,
            s = cmp.mapping.confirm { select = true },
            c = cmp.mapping.confirm { behaviour = 'replace', select = false },
          },
          ['<C-S-n>'] = cmp.mapping.scroll_docs(-2),
          ['<C-S-p>'] = cmp.mapping.scroll_docs(2),
        },
      }
    end,
  },
  {
    'hrsh7th/cmp-cmdline',
    event = 'CmdlineEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
      { url = 'https://codeberg.org/FelipeLema/cmp-async-path.git' },
      'hrsh7th/cmp-buffer',
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = 'async_path' },
          { name = 'cmdline' },
        },
      })
    end,
  },
}
