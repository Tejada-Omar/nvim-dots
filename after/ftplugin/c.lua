if vim.g.lsp_enabled == false then
  return
end

local dap = require('dap')

dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = {
    '--quiet',
    '--interpreter=dap',
    '--eval-command',
    'set print pretty on',
  },
}

dap.configurations.c = {
  {
    name = 'Run executable (GDB)',
    type = 'gdb',
    request = 'launch',
    program = function()
      return require('dap.utils').pick_file { filter = '.*bin/[^/]+$' }
    end,
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = 'Run executable with arguments (GDB)',
    type = 'gdb',
    request = 'launch',
    program = function()
      return require('dap.utils').pick_file { filter = '.*bin/[^/]+$' }
    end,
    args = function()
      local args_str = vim.fn.input('Arguments: ')
      return require('dap.utils').splitstr(args_str)
    end,
    stopAtBeginningOfMainSubprogram = false,
  },
  {
    name = 'Attach to process (GDB)',
    type = 'gdb',
    request = 'attach',
    pid = function()
      local name = vim.fn.input('Executable name (filter): ')
      return require('dap.utils').pick_process { filter = name }
    end,
  },
}
