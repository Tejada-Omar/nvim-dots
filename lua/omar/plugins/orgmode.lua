local homedir = '~/Documents/org/'

return {
  {
    'nvim-orgmode/orgmode',
    ft = { 'org' },
    opts = {
      org_agenda_files = { '~/Documents/org/**/*' },
      org_default_notes_file = homedir .. 'notes.org',
      org_log_into_drawer = 'LOGBOOK',
      org_todo_keywords = {
        'TODO(t)',
        'PROJ',
        'NEXT',
        'HOLD',
        '|',
        'DONE',
        'KILL',
      },
      win_split_mode = 'auto',
      calendar_week_start_day = 0,
      org_adapt_indentation = false,
      org_startup_folded = 'inherit',
      emacs_config = {
        executable_path = 'emacs',
        config_path = '$HOME/.config/emacs/init.el',
      },
      org_capture_templates = {
        t = {
          description = 'Task',
          template = '* TODO %?',
          target = homedir .. 'inbox.org',
          headline = 'Inbox',
        },
        n = {
          description = 'Note',
          template = '* %?\n%i\n%a %^{CREATED|%U}p',
          target = homedir .. 'notes.org',
          headline = 'Inbox',
        },
      },
      mappings = {
        prefix = '<localleader>',
      },
    },
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        opts = { ignore_install = { 'org' } },
      },
    },
  },
  {
    'nvim-orgmode/telescope-orgmode.nvim',
    dependencies = {
      'nvim-orgmode/orgmode',
      'nvim-telescope/telescope.nvim',
    },
    config = function() require('telescope').load_extension('orgmode') end,
    keys = {
      {
        '<leader>fq',
        '<CMD>Telescope orgmode search_headings<CR>',
        desc = 'Find orgmode headings',
      },
      {
        '<leader>fQ',
        '<CMD>Telescope orgmode refile_heading<CR>',
        desc = 'Refile orgmode headings',
      },
      {
        '<leader>fF',
        function()
          require('telescope').extensions.orgmode.search_headings {
            mode = 'orgfiles',
          }
        end,
        desc = 'Find orgmode headings',
      },
    },
  },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      sources = {
        default = { 'orgmode' },
        providers = {
          orgmode = {
            name = 'orgmode',
            module = 'orgmode.org.autocompletion.blink',
          },
        },
      },
    },
  },
}
