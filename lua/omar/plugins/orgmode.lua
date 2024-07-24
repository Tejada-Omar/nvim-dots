local homedir = '~/Documents/org/'

return {
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    opts = {
      org_agenda_files = { '~/Documents/org/**/*' },
      org_default_notes_file = homedir .. 'notes.org',
      org_todo_keywords = { 'TODO(t)', 'NEXT', '|', 'DONE' },
      win_split_mode = 'auto',
      calendar_week_start_day = 0,
      org_startup_folded = 'inherit',
      emacs_config = {
        executable_path = 'emacs',
        config_path = '$HOME/.config/emacs/init.el',
      },
      org_capture_templates = {
        t = {
          description = 'Task',
          template = '* TODO %?\n %u',
          target = homedir .. 'todo.org',
          headline = 'Inbox',
        },
        n = {
          description = 'Note',
          template = '* NOTE %?\n %u',
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
