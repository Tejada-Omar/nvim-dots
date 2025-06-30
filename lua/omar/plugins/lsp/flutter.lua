return {
  {
    'nvim-flutter/flutter-tools.nvim',
    ft = 'dart',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    opts = {
      debugger = { enabled = true },
      dev_tools = {
        autostart = false, -- autostart devtools server if not detected
        auto_open_browser = false, -- Automatically opens devtools in the browser
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = '■', -- the virtual text character to highlight
        },
        on_attach = function(_, bufnr)
          local utils = require('omar.plugins.lsp.utils.utils')
          utils.mappings(bufnr)
        end,
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        --   settings = {
        --     showTodos = true,
        --     completeFunctionCalls = true,
        --     analysisExcludedFolders = { '<path-to-flutter-sdk-packages>' },
        --     renameFilesWithClasses = 'prompt', -- "always"
        --     enableSnippets = true,
        --     updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        --   },
      },
    },
  },
}
