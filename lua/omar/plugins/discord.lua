local Profile = require('omar.profile')

return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    cond = vim.g.nvim_profile ~= Profile.MOBILE,
    init = function()
      vim.g.cord_defer_startup = vim.g.nvim_profile ~= Profile.DESKTOP
      vim.api.nvim_create_user_command(
        'CordStart',
        function(_) require('cord').setup() end,
        { desc = 'Start cord.nvim' }
      )
    end,
    opts = {
      editor = {
        tooltip = 'The Annoying Text Editor',
      },
    },
  },
}
