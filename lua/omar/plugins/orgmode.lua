local homedir = '~/Documents/org/'

return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    opts = {
      org_agenda_files = { '~/Documents/org/**/*' },
      org_default_notes_file = homedir .. 'notes.org',
      org_log_into_drawer = 'LOGBOOK',
      org_todo_keywords = { 'TODO(t)', 'PROJ', 'NEXT', 'HOLD', '|', 'DONE', 'KILL' },
      win_split_mode = 'auto',
      calendar_week_start_day = 0,
      org_startup_indented = true,
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
    },
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter',
        opts = {
          ignore_install = { 'org' },
        },
      },
    },
  },
}
