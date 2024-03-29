local ft = require 'guard.filetype'

ft(
    'javascript,javascriptreact,typescript,typescriptreact,vue,css,scss,less,html,json,jsonc,yaml,markdown,markdown.mdx,graphql,handlebars'
):fmt 'prettier'
ft('c,cpp,cs,cuda'):fmt 'clang-format'
ft('python'):fmt('ruff'):lint 'ruff'
ft('lua'):fmt 'stylua'
ft('sh'):fmt 'shfmt'
ft('rust'):fmt 'rustfmt'
ft('sql'):fmt 'sql-formatter'

require('guard').setup {
    fmt_on_save = true,
    lsp_as_default_formatter = true,
}
