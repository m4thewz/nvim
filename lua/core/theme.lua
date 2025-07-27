local colors = require "core.colors"
local g = vim.g
local cmd = vim.cmd

local groups = {
  Normal = { fg = colors.fg, bg = colors.bg, },
  NormalFloat = { fg = colors.fg, bg = colors.bg, },
  Comment = { fg = colors.comment, italic = true, },
  Constant = { fg = colors.yellow, },
  String = { fg = colors.yellow, },
  Character = { fg = colors.green, },
  Number = { fg = colors.orange, },
  Boolean = { fg = colors.cyan, },
  Float = { fg = colors.orange, },
  FloatBorder = { fg = colors.purple },
  Operator = { fg = colors.purple, },
  Keyword = { fg = colors.cyan, },
  Keywords = { fg = colors.cyan, },
  Identifier = { fg = colors.cyan, },
  Function = { fg = colors.yellow, },
  Statement = { fg = colors.purple, },
  Conditional = { fg = colors.pink, },
  Repeat = { fg = colors.pink, },
  Label = { fg = colors.cyan, },
  Exception = { fg = colors.purple, },
  PreProc = { fg = colors.yellow, },
  Include = { fg = colors.purple, },
  Define = { fg = colors.purple, },
  Title = { fg = colors.cyan, },
  Macro = { fg = colors.purple, },
  PreCondit = { fg = colors.cyan, },
  Type = { fg = colors.cyan, },
  StorageClass = { fg = colors.pink, },
  Structure = { fg = colors.yellow, },
  TypeDef = { fg = colors.yellow, },
  Special = { fg = colors.green, italic = true },
  SpecialComment = { fg = colors.comment, italic = true, },
  Error = { fg = colors.bright_red, },
  Todo = { fg = colors.purple, bold = true, italic = true, },
  Underlined = { fg = colors.cyan, underline = true, },

  Cursor = { reverse = true, },
  CursorLineNr = { fg = colors.fg, bold = true, },

  SignColumn = { bg = colors.bg, },

  Conceal = { fg = colors.comment, },
  CursorColumn = { bg = colors.black, },
  CursorLine = { bg = colors.selection, },
  ColorColumn = { bg = colors.selection, },

  StatusLine = { fg = colors.white, bg = colors.statusline, },
  StatusLineNC = { fg = colors.comment, },
  StatusLineTerm = { fg = colors.white, bg = colors.black, },
  StatusLineTermNC = { fg = colors.comment, },

  Directory = { fg = colors.cyan, },
  DiffAdd = { fg = colors.bg, bg = colors.green, },
  DiffChange = { fg = colors.orange, },
  DiffDelete = { fg = colors.red, },
  DiffText = { fg = colors.comment, },

  ErrorMsg = { fg = colors.bright_red, },
  VertSplit = { fg = colors.black, },
  WinSeparator = { fg = colors.gutter_fg, },
  Folded = { fg = colors.comment, },
  FoldColumn = {},
  Search = { fg = colors.black, bg = colors.orange, },
  IncSearch = { fg = colors.orange, bg = colors.comment, },
  LineNr = { fg = colors.selection, },
  MatchParen = { fg = colors.fg, underline = true, },
  NonText = { fg = colors.nontext, },
  Pmenu = { fg = colors.white, bg = colors.menu, },
  PmenuSel = { bg = colors.nontext, },
  PmenuSbar = { bg = colors.bg, },
  PmenuThumb = { bg = colors.purple, },

  Question = { fg = colors.purple, },
  QuickFixLine = { fg = colors.black, bg = colors.yellow, },
  SpecialKey = { fg = colors.nontext, },

  SpellBad = { fg = colors.bright_red, underline = true, },
  SpellCap = { fg = colors.yellow, },
  SpellLocal = { fg = colors.yellow, },
  SpellRare = { fg = colors.yellow, },

  TabLine = { fg = colors.comment, },
  TabLineSel = { fg = colors.white, },
  TabLineFill = { bg = colors.bg, },
  Terminal = { fg = colors.white, bg = colors.black, },
  Visual = { bg = colors.visual, },
  VisualNOS = { fg = colors.visual, },
  WarningMsg = { fg = colors.yellow, },
  WildMenu = { fg = colors.black, bg = colors.white, },

  EndOfBuffer = { fg = colors.bg },

  -- TreeSitter
  ['@error'] = { fg = colors.bright_red, },
  ['@punctuation.delimiter'] = { fg = colors.fg, },
  ['@punctuation.bracket'] = { fg = colors.fg, },
  ['@markup.list'] = { fg = colors.cyan, },

  ['@constant'] = { fg = colors.purple, },
  ['@constant.builtin'] = { fg = colors.purple, },
  ['@markup.link.label.symbol'] = { fg = colors.purple, },

  ['@constant.macro'] = { fg = colors.cyan, },
  ['@string.regexp'] = { fg = colors.red, },
  ['@string'] = { fg = colors.yellow, },
  ['@string.escape'] = { fg = colors.cyan, },
  ['@string.special.symbol'] = { fg = colors.purple, },
  ['@character'] = { fg = colors.green, },
  ['@number'] = { fg = colors.purple, },
  ['@boolean'] = { fg = colors.purple, },
  ['@number.float'] = { fg = colors.green, },
  ['@annotation'] = { fg = colors.yellow, },
  ['@attribute'] = { fg = colors.cyan, },
  ['@module'] = { fg = colors.orange, },

  ['@function.builtin'] = { fg = colors.cyan, },
  ['@function'] = { fg = colors.green, },
  ['@function.macro'] = { fg = colors.green, },
  ['@variable.parameter'] = { fg = colors.orange, },
  ['@variable.parameter.reference'] = { fg = colors.orange, },
  ['@function.method'] = { fg = colors.green, },
  ['@variable.member'] = { fg = colors.orange, },
  ['@property'] = { fg = colors.purple, },
  ['@constructor'] = { fg = colors.cyan, },

  ['@keyword.conditional'] = { fg = colors.pink, },
  ['@keyword.repeat'] = { fg = colors.pink, },
  ['@label'] = { fg = colors.cyan, },

  ['@keyword'] = { fg = colors.pink, },
  ['@keyword.function'] = { fg = colors.cyan, },
  ['@keyword.function.ruby'] = { fg = colors.pink, },
  ['@keyword.operator'] = { fg = colors.pink, },
  ['@operator'] = { fg = colors.pink, },
  ['@keyword.exception'] = { fg = colors.purple, },
  ['@type'] = { fg = colors.bright_cyan, },
  ['@type.builtin'] = { fg = colors.cyan, italic = true, },
  ['@type.qualifier'] = { fg = colors.pink, },
  ['@structure'] = { fg = colors.purple, },
  ['@keyword.include'] = { fg = colors.pink, },

  ['@variable'] = { fg = colors.fg, },
  ['@variable.builtin'] = { fg = colors.purple, },

  ['@markup'] = { fg = colors.orange, },
  ['@markup.strong'] = { fg = colors.orange, bold = true, },
  ['@markup.emphasis'] = { fg = colors.yellow, italic = true, },
  ['@markup.underline'] = { fg = colors.orange, },
  ['@markup.heading'] = { fg = colors.pink, bold = true, },
  ['@markup.raw'] = { fg = colors.yellow, },
  ['@markup.link.url'] = { fg = colors.yellow, italic = true, },
  ['@markup.link'] = { fg = colors.orange, bold = true, },

  ['@tag'] = { fg = colors.cyan, },
  ['@tag.attribute'] = { fg = colors.green, },
  ['@tag.delimiter'] = { fg = colors.cyan, },

  -- Semantic
  ['@class'] = { fg = colors.cyan },
  ['@struct'] = { fg = colors.cyan },
  ['@enum'] = { fg = colors.cyan },
  ['@enumMember'] = { fg = colors.purple },
  ['@event'] = { fg = colors.cyan },
  ['@interface'] = { fg = colors.cyan },
  ['@modifier'] = { fg = colors.cyan },
  ['@regexp'] = { fg = colors.yellow },
  ['@typeParameter'] = { fg = colors.cyan },
  ['@decorator'] = { fg = colors.cyan },

  -- LSP Semantic (0.9+)
  ['@lsp.type.class'] = { fg = colors.cyan },
  ['@lsp.type.enum'] = { fg = colors.cyan },
  ['@lsp.type.decorator'] = { fg = colors.green },
  ['@lsp.type.enumMember'] = { fg = colors.purple },
  ['@lsp.type.function'] = { fg = colors.green, },
  ['@lsp.type.interface'] = { fg = colors.cyan },
  ['@lsp.type.macro'] = { fg = colors.cyan },
  ['@lsp.type.method'] = { fg = colors.green, },
  ['@lsp.type.namespace'] = { fg = colors.orange, },
  ['@lsp.type.parameter'] = { fg = colors.orange, },
  ['@lsp.type.property'] = { fg = colors.purple, },
  ['@lsp.type.struct'] = { fg = colors.cyan },
  ['@lsp.type.type'] = { fg = colors.bright_cyan, },
  ['@lsp.type.variable'] = { fg = colors.fg, },

  -- HTML
  htmlArg = { fg = colors.green, },
  htmlBold = { fg = colors.yellow, bold = true, },
  htmlEndTag = { fg = colors.cyan, },
  htmlH1 = { fg = colors.pink, },
  htmlH2 = { fg = colors.pink, },
  htmlH3 = { fg = colors.pink, },
  htmlH4 = { fg = colors.pink, },
  htmlH5 = { fg = colors.pink, },
  htmlH6 = { fg = colors.pink, },
  htmlItalic = { fg = colors.purple, italic = true, },
  htmlLink = { fg = colors.purple, underline = true, },
  htmlSpecialChar = { fg = colors.yellow, },
  htmlSpecialTagName = { fg = colors.cyan, },
  htmlTag = { fg = colors.cyan, },
  htmlTagN = { fg = colors.cyan, },
  htmlTagName = { fg = colors.cyan, },
  htmlTitle = { fg = colors.white, },

  -- Markdown
  markdownBlockquote = { fg = colors.yellow, italic = true, },
  markdownBold = { fg = colors.orange, bold = true, },
  markdownCode = { fg = colors.green, },
  markdownCodeBlock = { fg = colors.orange, },
  markdownCodeDelimiter = { fg = colors.red, },
  markdownH1 = { fg = colors.pink, bold = true, },
  markdownH2 = { fg = colors.pink, bold = true, },
  markdownH3 = { fg = colors.pink, bold = true, },
  markdownH4 = { fg = colors.pink, bold = true, },
  markdownH5 = { fg = colors.pink, bold = true, },
  markdownH6 = { fg = colors.pink, bold = true, },
  markdownHeadingDelimiter = { fg = colors.red, },
  markdownHeadingRule = { fg = colors.comment, },
  markdownId = { fg = colors.purple, },
  markdownIdDeclaration = { fg = colors.cyan, },
  markdownIdDelimiter = { fg = colors.purple, },
  markdownItalic = { fg = colors.yellow, italic = true, },
  markdownLinkDelimiter = { fg = colors.purple, },
  markdownLinkText = { fg = colors.pink, },
  markdownListMarker = { fg = colors.cyan, },
  markdownOrderedListMarker = { fg = colors.red, },
  markdownRule = { fg = colors.comment, },

  --  Diff
  diffAdded = { fg = colors.green, },
  diffRemoved = { fg = colors.red, },
  diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
  diffFile = { fg = colors.nontext, },
  diffNewFile = { fg = colors.green, },
  diffOldFile = { fg = colors.red, },

  debugPc = { bg = colors.menu, },
  debugBreakpoint = { fg = colors.red, reverse = true, },

  -- Git Signs
  GitSignsAdd = { fg = colors.bright_green, },
  GitSignsChange = { fg = colors.cyan, },
  GitSignsDelete = { fg = colors.bright_red, },
  GitSignsAddLn = { fg = colors.black, bg = colors.bright_green, },
  GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
  GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red, },
  GitSignsCurrentLineBlame = { fg = colors.white, },

  -- Telescope
  TelescopePromptBorder = { fg = colors.comment, },
  TelescopeResultsBorder = { fg = colors.comment, },
  TelescopePreviewBorder = { fg = colors.comment, },
  TelescopeSelection = { fg = colors.white, bg = colors.selection, },
  TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
  TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
  TelescopeMatching = { fg = colors.green, },
  TelescopePromptPrefix = { fg = colors.purple, },
  TelescopeResultsDiffDelete = { fg = colors.red },
  TelescopeResultsDiffChange = { fg = colors.cyan },
  TelescopeResultsDiffAdd = { fg = colors.green },

  -- Flash
  FlashLabel = { bg = colors.red, fg = colors.bright_white },

  -- NvimTree
  NvimTreeNormal = { fg = colors.fg, bg = colors.menu, },
  NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
  NvimTreeRootFolder = { fg = colors.fg, bold = true, },
  NvimTreeGitDirty = { fg = colors.yellow, },
  NvimTreeGitNew = { fg = colors.bright_green, },
  NvimTreeImageFile = { fg = colors.pink, },
  NvimTreeFolderIcon = { fg = colors.purple, },
  NvimTreeIndentMarker = { fg = "#313244" },
  NvimTreeEmptyFolderName = { fg = colors.comment, },
  NvimTreeFolderName = { fg = colors.fg, },
  NvimTreeSpecialFile = { fg = colors.pink, underline = true, },
  NvimTreeOpenedFolderName = { fg = colors.fg, },
  NvimTreeCursorLine = { bg = colors.selection, },
  NvimTreeIn = { bg = colors.selection, },
  NvimTreeWinSeparator = { fg = colors.bg, bg = colors.bg },
  NvimTreeEndOfBuffer = { fg = colors.bg },
  NvimTreeBufferLabel = { fg = colors.purple, bg = colors.menu, bold = true },

  -- LSP
  DiagnosticError = { fg = colors.red, },
  DiagnosticWarn = { fg = colors.yellow, },
  DiagnosticInfo = { fg = colors.cyan, },
  DiagnosticHint = { fg = colors.cyan, },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
  DiagnosticSignError = { fg = colors.red, },
  DiagnosticSignWarn = { fg = colors.yellow, },
  DiagnosticSignInfo = { fg = colors.cyan, },
  DiagnosticSignHint = { fg = colors.cyan, },
  DiagnosticFloatingError = { fg = colors.red, },
  DiagnosticFloatingWarn = { fg = colors.yellow, },
  DiagnosticFloatingInfo = { fg = colors.cyan, },
  DiagnosticFloatingHint = { fg = colors.cyan, },
  DiagnosticVirtualTextError = { fg = colors.red, },
  DiagnosticVirtualTextWarn = { fg = colors.yellow, },
  DiagnosticVirtualTextInfo = { fg = colors.cyan, },
  DiagnosticVirtualTextHint = { fg = colors.cyan, },

  LspDiagnosticsDefaultError = { fg = colors.red, },
  LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
  LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
  LspDiagnosticsDefaultHint = { fg = colors.cyan, },
  LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
  LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
  LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
  LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
  LspReferenceText = { fg = colors.orange, },
  LspReferenceRead = { fg = colors.orange, },
  LspReferenceWrite = { fg = colors.orange, },
  LspCodeLens = { fg = colors.cyan, },
  LspInlayHint = { fg = "#969696", bg = "#2f3146" },

  --LSP Saga
  LspFloatWinNormal = { fg = colors.fg, },
  LspFloatWinBorder = { fg = colors.comment, },
  LspSagaHoverBorder = { fg = colors.comment, },
  LspSagaSignatureHelpBorder = { fg = colors.comment, },
  LspSagaCodeActionBorder = { fg = colors.comment, },
  LspSagaDefPreviewBorder = { fg = colors.comment, },
  LspLinesDiagBorder = { fg = colors.comment, },
  LspSagaRenameBorder = { fg = colors.comment, },
  LspSagaBorderTitle = { fg = colors.menu, },
  LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
  LspSagaDiagnosticBorder = { fg = colors.comment, },
  LspSagaShTruncateLine = { fg = colors.comment, },
  LspSagaDocTruncateLine = { fg = colors.comment, },
  LspSagaLspFinderBorder = { fg = colors.comment, },
  CodeActionNumber = { bg = 'NONE', fg = colors.cyan },

  -- IndentBlankLine
  IblIndent = { fg = "#313244" },
  IblScope = { fg = colors.visual, bold = true },

  -- Compe
  CompeDocumentation = { link = "Pmenu" },
  CompeDocumentationBorder = { link = "Pmenu" },

  -- Cmp
  CmpPMenu = { fg = colors.white },
  CmpItemAbbr = { bg = "NONE" },
  CmpItemAbbrDeprecated = { bg = "NONE" },
  CmpItemAbbrMatch = { bg = "NONE", fg = colors.purple },
  CmpItemMenu = { fg = colors.purple, italic = true },
  CmpItemKindSnippet = { fg = colors.purple },
  CmpItemKindKeyword = { fg = colors.red },
  CmpItemKindText = { fg = colors.green },
  CmpItemKindMethod = { fg = colors.blue },
  CmpItemKindConstructor = { fg = colors.blue },
  CmpItemKindFunction = { fg = colors.blue },
  CmpItemKindFolder = { fg = colors.blue },
  CmpItemKindModule = { fg = colors.blue },
  CmpItemKindConstant = { fg = colors.orange },
  CmpItemKindField = { fg = colors.green },
  CmpItemKindProperty = { fg = colors.green },
  CmpItemKindEnum = { fg = colors.green },
  CmpItemKindUnit = { fg = colors.green },
  CmpItemKindClass = { fg = colors.yellow },
  CmpItemKindVariable = { fg = colors.pink },
  CmpItemKindFile = { fg = colors.blue },
  CmpItemKindInterface = { fg = colors.yellow },
  CmpItemKindColor = { fg = colors.bright_red },
  CmpItemKindReference = { fg = colors.bright_red },
  CmpItemKindEnumMember = { fg = colors.bright_red },
  CmpItemKindStruct = { fg = colors.blue },
  CmpItemKindValue = { fg = colors.orange },
  CmpItemKindEvent = { fg = colors.blue },
  CmpItemKindOperator = { fg = colors.blue },
  CmpItemKindTypeParameter = { fg = colors.blue },
  CmpItemKindCopilot = { fg = colors.bright_cyan },

  -- alpha-nvim
  AlphaHeader = { fg = colors.purple },
  AlphaButton = { fg = colors.white },
  AlphaFooter = { fg = colors.blue },
}
g.terminal_color_0 = colors.black
g.terminal_color_1 = colors.red
g.terminal_color_2 = colors.green
g.terminal_color_3 = colors.yellow
g.terminal_color_4 = colors.purple
g.terminal_color_5 = colors.pink
g.terminal_color_6 = colors.cyan
g.terminal_color_7 = colors.white
g.terminal_color_8 = colors.selection
g.terminal_color_9 = colors.bright_red
g.terminal_color_10 = colors.bright_green
g.terminal_color_11 = colors.bright_yellow
g.terminal_color_12 = colors.bright_blue
g.terminal_color_13 = colors.bright_magenta
g.terminal_color_14 = colors.bright_cyan
g.terminal_color_15 = colors.bright_white
g.terminal_color_background = colors.bg
g.terminal_color_foreground = colors.fg

cmd("hi clear")
if vim.fn.exists("syntax_on") then
  cmd("syntax reset")
end

for group, setting in pairs(groups) do
  vim.api.nvim_set_hl(0, group, setting)
end
