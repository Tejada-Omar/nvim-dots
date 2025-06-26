return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_in_macro = true,
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      local npairs = require('nvim-autopairs')
      npairs.get_rules("'")[1].not_filetypes = { 'tex', 'rust' }
    end,
  },
}
