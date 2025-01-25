-- PaperColorSlim: Based on https://github.com/NLKNguyen/papercolor-theme
-- That's further based on: https://github.com/pappasam/papercolor-theme-slim

-- Color Reference (not exactly 1:1 in practice, but gives a rough gist)
--  dark     light  <>  dark     light  <>  dark     light  <>  dark     light
-- #d7875f  #005f87 <> #5fafd7  #0087af <> #262626  #005f87 <> #000000  #444444
-- #d787ff  #0087af <> #5fffff  #0087af <> #303030  #e4e4e4 <> #005f00  #afff87
-- #d7af00  #008700 <> #808080  #878787 <> #3a3a3a  #d0d0d0 <> #005f5f  #ffd787
-- #d7af5f  #5f8700 <> #87d700  #008700 <> #4e4e4e  #c6c6c6 <> #00875f  #ffff5f
-- #ff5faf  #d75f00 <> #af005f  #af0000 <> #585858  #bcbcbc <> #008787  #ffffd7
-- #ff8700  #00af5f <> #af87d7  #8700af <> #5f0000  #ffd7ff <> #00afaf  #e4e4e4
-- #ffff00  #af5f00 <> #afd700  #d70087 <> #5f8787  #005f87 <> #121212  #444444
-- #bcbcbc  #444444 <> #5faf5f  #d70000 <> #1c1c1c  #fffff0

-- Set the colorscheme name
vim.g.colors_name = 'PaperColorSlimNative'

-- Clear existing highlights
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

-- Define highlight groups
local hl = vim.api.nvim_set_hl

-- Linking highlight groups
hl(0, 'Macro', { link = 'Define' })
hl(0, 'FoldColumn', { link = 'LineNr' })
hl(0, 'Added', { link = 'DiffAdd' })
hl(0, 'Changed', { link = 'DiffChange' })
hl(0, 'Removed', { link = 'DiffDelete' })

if vim.fn.has('nvim-0.8') == 1 then
  -- Link nvim-treesitter matchers
  hl(0, '@markup.italic', { italic = true })
  hl(0, '@markup.strong', { bold = true })
  hl(0, '@variable.builtin', { bold = true, italic = true })
  hl(0, '@attribute', { link = 'NONE' })
  hl(0, '@attribute.builtin', { link = 'Constant' })
  hl(0, '@constant.builtin', { link = 'Boolean' })
  hl(0, '@constructor', { link = 'Function' })
  hl(0, '@diff.delta', { link = 'DiffChange' })
  hl(0, '@diff.minus', { link = 'DiffDelete' })
  hl(0, '@diff.plus', { link = 'DiffAdd' })
  hl(0, '@function', { link = 'Function' })
  hl(0, '@function.builtin', { link = 'pcsFunctionBold' })
  hl(0, '@function.call', { link = 'Function' })
  hl(0, '@function.macro', { link = 'Macro' })
  hl(0, '@keyword.conditional', { link = 'Conditional' })
  hl(0, '@keyword.directive', { link = 'SpecialComment' })
  hl(0, '@keyword.exception', { link = 'Exception' })
  hl(0, '@keyword.operator', { link = 'Operator' })
  hl(0, '@keyword.repeat', { link = 'Repeat' })
  hl(0, '@keyword.return', { link = 'Conditional' })
  hl(0, '@keyword.directive.define', { link = 'Define' })
  hl(0, '@markup.heading', { link = 'Title' })
  hl(0, '@markup.heading.1', { link = 'pcsHtmlHeader1' })
  hl(0, '@markup.heading.2', { link = 'pcsHtmlHeader2' })
  hl(0, '@markup.heading.3', { link = 'pcsHtmlHeader3' })
  hl(0, '@markup.heading.4', { link = 'pcsHtmlHeader4' })
  hl(0, '@markup.heading.5', { link = 'pcsHtmlHeader5' })
  hl(0, '@markup.heading.6', { link = 'pcsHtmlHeader6' })
  hl(0, '@markup.link.label', { link = 'pcsHtmlAnchor' })
  hl(0, '@markup.link.markdown_inline', { link = 'NONE' })
  hl(0, '@markup.link.url', { link = 'Underlined' })
  hl(0, '@markup.link.vimdoc', { link = 'pcsHtmlAnchor' })
  hl(0, '@markup.list', { link = 'Delimiter' })
  hl(0, '@markup.literal', { link = 'String' })
  hl(0, '@markup.raw', { link = 'String' })
  hl(0, '@markup.raw.block', { link = 'NormalNC' })
  hl(0, '@method', { link = 'Function' })
  hl(0, '@method.builtin', { link = 'Function' })
  hl(0, '@method.call', { link = 'Function' })
  hl(0, '@module', { link = 'StorageClass' })
  hl(0, '@namespace', { link = 'StorageClass' })
  hl(0, '@string.escape', { link = 'Special' })
  hl(0, '@string.special.url', { link = 'Underlined' })
  hl(0, '@string.special.path', { link = 'Underlined' })
  hl(0, '@tag.attribute', { link = 'Identifier' })
  hl(0, '@tag.delimiter', { link = 'Operator' })
  hl(0, '@type', { link = 'Type' })
  hl(0, '@type.builtin', { link = 'Type' })
  hl(0, '@type.definition', { link = 'Typedef' })
  hl(0, '@variable', { link = 'NormalNC' })
  hl(0, '@variable.parameter', { link = 'Identifier' })
  hl(0, '@variable.member', { link = 'Identifier' })

  -- Language-specific overrides
  hl(0, '@constructor.lua', { link = 'NONE' })

  -- Link LSP Semantic Highlighting to treesitter styles
  hl(0, '@lsp.type.boolean', { link = '@boolean' })
  hl(0, '@lsp.type.builtinType', { link = '@type.builtin' })
  hl(0, '@lsp.type.comment', { link = '@comment' })
  hl(0, '@lsp.type.enum', { link = '@type' })
  hl(0, '@lsp.type.enumMember', { link = '@constant' })
  hl(0, '@lsp.type.escapeSequence', { link = '@string.escape' })
  hl(0, '@lsp.type.formatSpecifier', { link = '@punctuation.special' })
  hl(0, '@lsp.type.interface', { link = '@type' })
  hl(0, '@lsp.type.keyword', { link = '@keyword' })
  hl(0, '@lsp.type.namespace', { link = '@namespace' })
  hl(0, '@lsp.type.number', { link = '@number' })
  hl(0, '@lsp.type.operator', { link = '@operator' })
  hl(0, '@lsp.type.parameter', { link = '@variable.parameter' })
  hl(0, '@lsp.type.property', { link = '@property' })
  hl(0, '@lsp.type.selfKeyword', { link = '@variable.builtin' })
  hl(0, '@lsp.type.typeAlias', { link = '@type.definition' })
  hl(0, '@lsp.type.unresolvedReference', { link = '@comment.error' })
  hl(0, '@lsp.type.variable', { link = 'NONE' }) -- use treesitter styles for regular variables
  hl(0, '@lsp.typemod.class.defaultLibrary', { link = '@type.builtin' })
  hl(0, '@lsp.typemod.enum.defaultLibrary', { link = '@type.builtin' })
  hl(0, '@lsp.typemod.enumMember.defaultLibrary', { link = '@constant.builtin' })
  hl(0, '@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })
  hl(0, '@lsp.typemod.keyword.async', { link = '@keyword.coroutine' })
  hl(0, '@lsp.typemod.macro.defaultLibrary', { link = '@function.builtin' })
  hl(0, '@lsp.typemod.method.defaultLibrary', { link = '@function.builtin' })
  hl(0, '@lsp.typemod.operator.injected', { link = '@operator' })
  hl(0, '@lsp.typemod.string.injected', { link = '@string' })
  hl(0, '@lsp.typemod.type.defaultLibrary', { link = '@type.builtin' })
  hl(0, '@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
  hl(0, '@lsp.typemod.variable.injected', { link = '@variable' })
end

if vim.o.background == 'dark' then
  -- Set Neovim terminal colors
  vim.g.terminal_color_0  = '#1c1c1c'
  vim.g.terminal_color_1  = '#af005f'
  vim.g.terminal_color_2  = '#5faf00'
  vim.g.terminal_color_3  = '#d7af5f'
  vim.g.terminal_color_4  = '#5fafd7'
  vim.g.terminal_color_5  = '#808080'
  vim.g.terminal_color_6  = '#d7875f'
  vim.g.terminal_color_7  = '#d0d0d0'
  vim.g.terminal_color_8  = '#585858'
  vim.g.terminal_color_9  = '#5faf5f'
  vim.g.terminal_color_10 = '#afd700'
  vim.g.terminal_color_11 = '#af87d7'
  vim.g.terminal_color_12 = '#ffaf00'
  vim.g.terminal_color_13 = '#ff5faf'
  vim.g.terminal_color_14 = '#00afaf'
  vim.g.terminal_color_15 = '#5f8787'

  -- Define highlight groups
  hl(0, 'ColorColumn', { bg = '#303030' })
  hl(0, 'Conceal', { fg = '#585858' })
  hl(0, 'CurSearch', { fg = '#87d700', bg = '#005f00' })
  hl(0, 'Cursor', { fg = '#c6c6c6' })
  hl(0, 'CursorColumn', { bg = '#303030' })
  hl(0, 'CursorLine', { bg = '#303030' })
  hl(0, 'CursorLineNr', { fg = '#ffff00' })
  hl(0, 'DiffAdd', { fg = '#d0d0d0', bg = '#005f00' })
  hl(0, 'DiffChange', { fg = '#d0d0d0', bg = '#005f5f' })
  hl(0, 'DiffDelete', { fg = '#d0d0d0', bg = '#5f0000' })
  hl(0, 'DiffText', { fg = '#5fffff', bg = '#008787' })
  hl(0, 'Directory', { fg = '#5fafd7', bold = true })
  hl(0, 'EndOfBuffer', { fg = '#585858' })
  hl(0, 'ErrorMsg', { fg = '#af005f', bg = '#5f0000' })
  hl(0, 'Folded', { fg = '#bcbcbc', bg = '#3a3a3a' })
  hl(0, 'IncSearch', { fg = '#87d700', bg = '#005f00' })
  hl(0, 'LineNr', { fg = '#808080' })
  hl(0, 'MatchParen', { fg = '#c6c6c6', bg = '#4e4e4e' })
  hl(0, 'ModeMsg', { fg = '#d7af5f' })
  hl(0, 'MoreMsg', { fg = '#d7af5f' })
  hl(0, 'NonText', { fg = '#585858' })
  hl(0, 'Normal', { fg = '#d0d0d0', bg = '#1c1c1c' })
  hl(0, 'NormalFloat', { fg = '#d0d0d0', bg = '#303030' })
  hl(0, 'NormalNC', { fg = '#d0d0d0' })
  hl(0, 'Pmenu', { fg = '#d0d0d0', bg = '#303030' })
  hl(0, 'PmenuSel', { fg = '#d0d0d0', bg = '#585858' })
  hl(0, 'Question', { fg = '#afd700' })
  hl(0, 'Search', { fg = '#444444', bg = '#c6c6c6' })
  hl(0, 'SignColumn', { fg = '#d7af00' })
  hl(0, 'SpecialKey', { fg = '#585858' })
  hl(0, 'SpellBad', { fg = '#d787ff', undercurl = true, italic = true })
  hl(0, 'SpellCap', { fg = '#ffff00', undercurl = true, italic = true })
  hl(0, 'SpellLocal', { fg = '#5fffff', undercurl = true, italic = true })
  hl(0, 'SpellRare', { fg = '#5fffff', undercurl = true, italic = true })
  hl(0, 'StatusLine', { fg = '#1c1c1c', bg = '#5f8787' })
  hl(0, 'StatusLineNC', { fg = '#bcbcbc', bg = '#3a3a3a' })
  hl(0, 'Substitute', { fg = '#87d700', bg = '#005f00' })
  hl(0, 'TabLine', { fg = '#bcbcbc', bg = '#585858' })
  hl(0, 'TabLineFill', { fg = '#262626', bg = '#262626' })
  hl(0, 'TabLineSel', { fg = '#121212', bg = '#5f8787' })
  hl(0, 'Title', { fg = '#d7af00', bold = true })
  hl(0, 'VertSplit', { fg = '#5f8787' })
  hl(0, 'Visual', { fg = '#c6c6c6', bg = '#4e4e4e' })
  hl(0, 'VisualNOS', { fg = '#c6c6c6', bg = '#4e4e4e' })
  hl(0, 'WarningMsg', { fg = '#afd700' })
  hl(0, 'Whitespace', { fg = '#4e4e4e' })
  hl(0, 'WildMenu', { fg = '#1c1c1c', bg = '#afd700' })
  hl(0, 'WinSeparator', { fg = '#5f8787' })

  -- Vim-preferred highlight groups
  hl(0, 'Comment', { fg = '#808080' })
  hl(0, 'Constant', { fg = '#d0d0d0', bold = true })
  hl(0, 'String', { fg = '#d7af5f' })
  hl(0, 'Character', { fg = '#d7af5f', bold = true })
  hl(0, 'Number', { fg = '#ff5faf' })
  hl(0, 'Boolean', { fg = '#d7af00', bold = true })
  hl(0, 'Float', { fg = '#ff5faf' })
  hl(0, 'Identifier', { fg = '#d7875f' })
  hl(0, 'Function', { fg = '#5fafd7', nocombine = true })
  hl(0, 'Statement', { fg = '#afd700' })
  hl(0, 'Conditional', { fg = '#afd700' })
  hl(0, 'Repeat', { fg = '#afd700' })
  hl(0, 'Label', { fg = '#afd700' })
  hl(0, 'Operator', { fg = '#00afaf', bold = true })
  hl(0, 'Keyword', { fg = '#afd700' })
  hl(0, 'Exception', { fg = '#afd700' })
  hl(0, 'PreProc', { fg = '#afd700' })
  hl(0, 'Include', { fg = '#afd700' })
  hl(0, 'Define', { fg = '#5faf5f' })
  hl(0, 'PreCondit', { fg = '#5faf5f' })
  hl(0, 'Type', { fg = '#af87d7' })
  hl(0, 'StorageClass', { fg = '#af87d7' })
  hl(0, 'Structure', { fg = '#af87d7' })
  hl(0, 'Typedef', { fg = '#af87d7' })
  hl(0, 'Special', { fg = '#5fafd7', bold = true })
  hl(0, 'SpecialChar', { fg = '#d7af5f' })
  hl(0, 'Tag', { fg = '#d7af00' })
  hl(0, 'Delimiter', { fg = '#00afaf' })
  hl(0, 'SpecialComment', { fg = '#808080', bold = true })
  hl(0, 'Debug', { fg = '#ff5faf' })
  hl(0, 'Underlined', { underline = true })
  hl(0, 'Error', { fg = '#ff8080', bold = true })
  hl(0, 'Todo', { fg = '#ff8700', bold = true })
  hl(0, 'Ignore', { fg = '#303030' })

  -- Diagnostics highlight groups
  hl(0, 'DiagnosticError', { fg = '#d787ff' })
  hl(0, 'DiagnosticWarn', { fg = '#ffff00' })
  hl(0, 'DiagnosticInfo', { fg = '#5fffff' })
  hl(0, 'DiagnosticHint', { fg = '#5fffff' })
  hl(0, 'DiagnosticOk', { fg = '#5faf5f' })
  hl(0, 'DiagnosticUnderlineError', { undercurl = true })
  hl(0, 'DiagnosticUnderlineWarn', { undercurl = true })
  hl(0, 'DiagnosticUnderlineInfo', { undercurl = true })
  hl(0, 'DiagnosticUnderlineHint', { undercurl = true })
  hl(0, 'DiagnosticUnderlineOk', { undercurl = true })

  -- PaperColorSlim Custom highlight groups
  hl(0, 'pcsFunctionBold', { fg = '#5fafd7', bold = true })
  hl(0, 'pcsHtmlAnchor', { fg = '#00afaf', underline = true })
  hl(0, 'pcsHtmlHeader1', { fg = '#d7af00', bold = true })
  hl(0, 'pcsHtmlHeader2', { fg = '#5fafd7', bold = true })
  hl(0, 'pcsHtmlHeader3', { fg = '#af87d7', bold = true })
  hl(0, 'pcsHtmlHeader4', { fg = '#ff5faf', bold = true })
  hl(0, 'pcsHtmlHeader5', { fg = '#ff5faf' })
  hl(0, 'pcsHtmlHeader6', { fg = '#ff5faf', italic = true })
else
  -- Only Light
  -- Neovim terminal colors
  vim.g.terminal_color_0  = '#eeeeee'
  vim.g.terminal_color_1  = '#af0000'
  vim.g.terminal_color_2  = '#008700'
  vim.g.terminal_color_3  = '#5f8700'
  vim.g.terminal_color_4  = '#0087af'
  vim.g.terminal_color_5  = '#878787'
  vim.g.terminal_color_6  = '#005f87'
  vim.g.terminal_color_7  = '#444444'
  vim.g.terminal_color_8  = '#bcbcbc'
  vim.g.terminal_color_9  = '#af5f00'
  vim.g.terminal_color_10 = '#d70087'
  vim.g.terminal_color_11 = '#8700af'
  vim.g.terminal_color_12 = '#d75f00'
  vim.g.terminal_color_13 = '#d75f00'
  vim.g.terminal_color_14 = '#005faf'
  vim.g.terminal_color_15 = '#005f87'

  -- Built-in
  hl(0, 'ColorColumn', { bg = '#e4e4e4' })
  hl(0, 'Conceal', { fg = '#444444' })
  hl(0, 'CurSearch', { fg = '#008700', bg = '#afff87' })
  hl(0, 'Cursor', { fg = '#c6c6c6' })
  hl(0, 'CursorColumn', { bg = '#e4e4e4' })
  hl(0, 'CursorLine', { bg = '#e4e4e4' })
  hl(0, 'CursorLineNr', { fg = '#af5f00' })
  hl(0, 'DiffAdd', { fg = '#444444', bg = '#afff87' })
  hl(0, 'DiffChange', { fg = '#444444', bg = '#ffd787' })
  hl(0, 'DiffDelete', { fg = '#444444', bg = '#ffd7ff' })
  hl(0, 'DiffText', { fg = '#0087af', bg = '#ffffd7' })
  hl(0, 'Directory', { fg = '#0087af', bold = true })
  hl(0, 'EndOfBuffer', { fg = '#444444' })
  hl(0, 'ErrorMsg', { fg = '#af0000', bg = '#ffd7ff' })
  hl(0, 'Folded', { fg = '#444444', bg = '#e4e4e4' })
  hl(0, 'IncSearch', { fg = '#008700', bg = '#afff87' })
  hl(0, 'LineNr', { fg = '#878787' })
  hl(0, 'MatchParen', { fg = '#4e4e4e', bg = '#c6c6c6' })
  hl(0, 'ModeMsg', { fg = '#5f8700' })
  hl(0, 'MoreMsg', { fg = '#5f8700' })
  hl(0, 'NonText', { fg = '#c6c6c6' })
  hl(0, 'Normal', { fg = '#444444', bg = '#eeeeee' })
  hl(0, 'NormalFloat', { fg = '#444444', bg = '#e4e4e4' })
  hl(0, 'NormalNC', { fg = '#444444' })
  hl(0, 'Pmenu', { fg = '#444444', bg = '#e4e4e4' })
  hl(0, 'PmenuSel', { fg = '#444444', bg = '#c6c6c6' })
  hl(0, 'Question', { fg = '#d70087' })
  hl(0, 'Search', { fg = '#444444', bg = '#e4e4e4' })
  hl(0, 'SignColumn', { fg = '#008700' })
  hl(0, 'SpecialKey', { fg = '#c6c6c6' })
  hl(0, 'SpellBad', { fg = '#af0000', undercurl = true, italic = true })
  hl(0, 'SpellCap', { fg = '#af5f00', undercurl = true, italic = true })
  hl(0, 'SpellLocal', { fg = '#005faf', undercurl = true, italic = true })
  hl(0, 'SpellRare', { fg = '#005f87', undercurl = true, italic = true })
  hl(0, 'StatusLine', { fg = '#fffff0', bg = '#005f87' })
  hl(0, 'StatusLineNC', { fg = '#444444', bg = '#c6c6c6' })
  hl(0, 'Substitute', { fg = '#008700', bg = '#afff87' })
  hl(0, 'TabLine', { fg = '#444444', bg = '#c6c6c6' })
  hl(0, 'TabLineFill', { fg = '#005f87', bg = '#005f87' })
  hl(0, 'TabLineSel', { fg = '#444444', bg = '#e4e4e4' })
  hl(0, 'Title', { fg = '#008700', bold = true })
  hl(0, 'VertSplit', { fg = '#005f87' })
  hl(0, 'Visual', { bg = '#c6c6c6' })
  hl(0, 'VisualNOS', { bg = '#c6c6c6' })
  hl(0, 'WarningMsg', { fg = '#d70087' })
  hl(0, 'Whitespace', { fg = '#c6c6c6' })
  hl(0, 'WildMenu', { fg = '#fffff0', bg = '#d70087' })
  hl(0, 'WinSeparator', { fg = '#005f87' })

  -- Vim-preferred
  hl(0, 'Comment', { fg = '#878787' })
  hl(0, 'Constant', { fg = '#444444', bold = true })
  hl(0, 'String', { fg = '#5f8700' })
  hl(0, 'Character', { fg = '#5f8700', bold = true })
  hl(0, 'Number', { fg = '#d75f00' })
  hl(0, 'Boolean', { fg = '#af5f00', bold = true })
  hl(0, 'Float', { fg = '#d75f00' })
  hl(0, 'Identifier', { fg = '#005f87' })
  hl(0, 'Function', { fg = '#0087af', nocombine = true })
  hl(0, 'Statement', { fg = '#d70087' })
  hl(0, 'Conditional', { fg = '#d70087' })
  hl(0, 'Repeat', { fg = '#d70087' })
  hl(0, 'Label', { fg = '#d70087' })
  hl(0, 'Operator', { fg = '#005f87', bold = true })
  hl(0, 'Keyword', { fg = '#d70087' })
  hl(0, 'Exception', { fg = '#d70087' })
  hl(0, 'PreProc', { fg = '#d70087' })
  hl(0, 'Include', { fg = '#d70087' })
  hl(0, 'Define', { fg = '#008700' })
  hl(0, 'PreCondit', { fg = '#008700' })
  hl(0, 'Type', { fg = '#8700af' })
  hl(0, 'StorageClass', { fg = '#8700af' })
  hl(0, 'Structure', { fg = '#8700af' })
  hl(0, 'Typedef', { fg = '#8700af' })
  hl(0, 'Special', { fg = '#0087af', bold = true })
  hl(0, 'SpecialChar', { fg = '#5f8700' })
  hl(0, 'Tag', { fg = '#008700' })
  hl(0, 'Delimiter', { fg = '#005f87' })
  hl(0, 'SpecialComment', { fg = '#878787', bold = true })
  hl(0, 'Debug', { fg = '#d75f00' })
  hl(0, 'Underlined', { underline = true })
  hl(0, 'Error', { fg = '#e60000', bold = true })
  hl(0, 'Todo', { fg = '#00af5f', bold = true })
  hl(0, 'Ignore', { fg = '#005f87' })

  -- Diagnostics
  hl(0, 'DiagnosticError', { fg = '#af0000' })
  hl(0, 'DiagnosticWarn', { fg = '#af5f00' })
  hl(0, 'DiagnosticInfo', { fg = '#005faf' })
  hl(0, 'DiagnosticHint', { fg = '#005faf' })
  hl(0, 'DiagnosticOk', { fg = '#008700' })
  hl(0, 'DiagnosticUnderlineError', { undercurl = true })
  hl(0, 'DiagnosticUnderlineWarn', { undercurl = true })
  hl(0, 'DiagnosticUnderlineInfo', { undercurl = true })
  hl(0, 'DiagnosticUnderlineHint', { undercurl = true })
  hl(0, 'DiagnosticUnderlineOk', { undercurl = true })

  -- PaperColorSlim Custom
  hl(0, 'pcsFunctionBold', { fg = '#0087af', bold = true })
  hl(0, 'pcsHtmlAnchor', { fg = '#005f87', underline = true })
  hl(0, 'pcsHtmlHeader1', { fg = '#008700', bold = true })
  hl(0, 'pcsHtmlHeader2', { fg = '#0087af', bold = true })
  hl(0, 'pcsHtmlHeader3', { fg = '#8700af', bold = true })
  hl(0, 'pcsHtmlHeader4', { fg = '#d70087', bold = true })
  hl(0, 'pcsHtmlHeader5', { fg = '#d70087' })
  hl(0, 'pcsHtmlHeader6', { fg = '#d70087', italic = true })
end
