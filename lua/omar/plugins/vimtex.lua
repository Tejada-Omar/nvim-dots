return {
  {
    'lervag/vimtex',
    ft = { 'tex' },
    dependencies = { 'micangl/cmp-vimtex' },
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_use_temp_files = 1
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_indent_on_ampersands = 0

      vim.g['vimtex_compiler_latexmk'] = {
        build_dir = 'latex-bin',
        out_dir = 'latex-bin',
      }

      vim.g['vimtex_compiler_latexmk_engines'] = {
        _ = '-pdf',
        pdf_escaped = '-pdf -pdflatex="pdflatex -shell-escape %O %S"',
      }

      vim.g['vimtex_syntax_conceal'] = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 1,
        styles = 1,
      }

      vim.g['vimtex_toc_config'] = {
        mode = 2,
        fold_enable = 1,
        show_help = 0,
        split_pos = 'leftabove',
        split_width = 10,
      }
    end,
    config = function()
      -- Because flop
      vim.cmd([[
call vimtex#imaps#add_map({
      \ 'lhs' : '<M-i>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_environment',
      \ 'context' : [ 'itemize', 'enumerate', 'description' ],
      \})
]])

      vim.cmd([[
call vimtex#imaps#add_map({
      \ 'lhs' : '<M-S-i>',
      \ 'rhs' : '\item[',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_environment',
      \ 'context' : [ 'itemize', 'enumerate', 'description' ],
      \})
]])
    end,
  },
  {
    'saghen/blink.cmp',
    optional = true,
    opts = {
      sources = {
        default = { 'vimtex' },
        providers = {
          vimtex = {
            name = 'vimtex',
            module = 'blink.compat.source',
          },
        },
      },
    },
  },
}
