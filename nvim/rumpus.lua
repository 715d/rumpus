-- Rumpus - A 1970s-inspired terminal color theme for Neovim
-- Based on authentic mid-century modern furniture colors
-- Repository: https://github.com/715d/rumpus

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "rumpus"

-- Color Palette
local colors = {
  -- Primary colors
  walnut = "#2A1810",
  chocolate_brown = "#5F3822",
  cork = "#98755f",
  almond = "#F4DDB3",
  harvest_gold = "#E9A131",
  burnt_orange = "#F67422",
  avocado_green = "#79966d",
  denim_blue = "#5B7C99",
  lava_gold = "#D3BE47",
  persimmon = "#E84A38",

  -- Bright/light colors
  light_brown = "#84563B",
  light_avocado = "#9BB589",
  light_harvest_gold = "#F1C760",
  light_denim_blue = "#7A96B0",
  light_lava_gold = "#E1D36B",
  light_almond = "#FCF0DC",

  -- Semantic aliases
  bg = "#2A1810",
  bg_dark = "#2A1810",
  bg_secondary = "#5F3822",
  fg = "#F4DDB3",
  fg_bright = "#FCF0DC",
  cursor = "#E9A131",
  selection = "#D3BE47",
  comment = "#98755f",
  string = "#79966d",
  keyword = "#F67422",
  func = "#E9A131",
  type_color = "#5B7C99",
  operator = "#F4DDB3",
  warning = "#D3BE47",
  error = "#E84A38",
  info = "#5B7C99",
  hint = "#79966d",
}

-- Helper function to set highlight groups
local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg_secondary })
hl("NormalNC", { fg = colors.fg, bg = colors.bg })
hl("ColorColumn", { bg = colors.bg_secondary })
hl("Conceal", { fg = colors.denim_blue })
hl("Cursor", { fg = colors.bg, bg = colors.cursor })
hl("lCursor", { link = "Cursor" })
hl("CursorIM", { link = "Cursor" })
hl("CursorColumn", { bg = colors.bg_secondary })
hl("CursorLine", { bg = colors.bg_secondary })
hl("Directory", { fg = colors.denim_blue, bold = true })
hl("DiffAdd", { fg = colors.avocado_green, bg = colors.bg_secondary })
hl("DiffChange", { fg = colors.lava_gold, bg = colors.bg_secondary })
hl("DiffDelete", { fg = colors.persimmon, bg = colors.bg_secondary })
hl("DiffText", { fg = colors.burnt_orange, bg = colors.bg_secondary, bold = true })
hl("EndOfBuffer", { fg = colors.chocolate_brown })
hl("ErrorMsg", { fg = colors.persimmon, bold = true })
hl("VertSplit", { fg = colors.chocolate_brown })
hl("WinSeparator", { link = "VertSplit" })
hl("Folded", { fg = colors.light_brown, bg = colors.bg_secondary })
hl("FoldColumn", { fg = colors.light_brown, bg = colors.bg })
hl("SignColumn", { fg = colors.fg, bg = colors.bg })
hl("IncSearch", { fg = colors.bg, bg = colors.harvest_gold, bold = true })
hl("Substitute", { link = "IncSearch" })
hl("LineNr", { fg = colors.light_brown })
hl("LineNrAbove", { link = "LineNr" })
hl("LineNrBelow", { link = "LineNr" })
hl("CursorLineNr", { fg = colors.harvest_gold, bold = true })
hl("CursorLineFold", { link = "FoldColumn" })
hl("CursorLineSign", { link = "SignColumn" })
hl("MatchParen", { fg = colors.harvest_gold, bold = true, underline = true })
hl("ModeMsg", { fg = colors.harvest_gold, bold = true })
hl("MsgArea", { link = "Normal" })
hl("MsgSeparator", { link = "StatusLine" })
hl("MoreMsg", { fg = colors.avocado_green, bold = true })
hl("NonText", { fg = colors.chocolate_brown })
hl("Pmenu", { fg = colors.fg, bg = colors.bg_secondary })
hl("PmenuSel", { fg = colors.bg, bg = colors.harvest_gold, bold = true })
hl("PmenuKind", { link = "Pmenu" })
hl("PmenuKindSel", { link = "PmenuSel" })
hl("PmenuExtra", { link = "Pmenu" })
hl("PmenuExtraSel", { link = "PmenuSel" })
hl("PmenuSbar", { bg = colors.chocolate_brown })
hl("PmenuThumb", { bg = colors.light_brown })
hl("Question", { fg = colors.avocado_green, bold = true })
hl("QuickFixLine", { fg = colors.bg, bg = colors.harvest_gold })
hl("Search", { fg = colors.bg, bg = colors.lava_gold })
hl("SpecialKey", { fg = colors.chocolate_brown })
hl("SpellBad", { sp = colors.persimmon, undercurl = true })
hl("SpellCap", { sp = colors.lava_gold, undercurl = true })
hl("SpellLocal", { sp = colors.denim_blue, undercurl = true })
hl("SpellRare", { sp = colors.avocado_green, undercurl = true })
hl("StatusLine", { fg = colors.fg, bg = colors.chocolate_brown })
hl("StatusLineNC", { fg = colors.light_brown, bg = colors.bg_secondary })
hl("TabLine", { fg = colors.light_brown, bg = colors.bg_secondary })
hl("TabLineFill", { bg = colors.bg_secondary })
hl("TabLineSel", { fg = colors.bg, bg = colors.harvest_gold, bold = true })
hl("Title", { fg = colors.harvest_gold, bold = true })
hl("Visual", { fg = colors.bg, bg = colors.lava_gold })
hl("VisualNOS", { link = "Visual" })
hl("WarningMsg", { fg = colors.lava_gold, bold = true })
hl("Whitespace", { fg = colors.chocolate_brown })
hl("WildMenu", { link = "PmenuSel" })
hl("WinBar", { link = "StatusLine" })
hl("WinBarNC", { link = "StatusLineNC" })

-- Syntax highlighting
hl("Comment", { fg = colors.cork, italic = true })
hl("Constant", { fg = colors.harvest_gold })
hl("String", { fg = colors.avocado_green })
hl("Character", { fg = colors.avocado_green })
hl("Number", { fg = colors.harvest_gold })
hl("Boolean", { fg = colors.harvest_gold })
hl("Float", { fg = colors.harvest_gold })
hl("Identifier", { fg = colors.fg })
hl("Function", { fg = colors.harvest_gold })
hl("Statement", { fg = colors.burnt_orange })
hl("Conditional", { fg = colors.burnt_orange })
hl("Repeat", { fg = colors.burnt_orange })
hl("Label", { fg = colors.burnt_orange })
hl("Operator", { fg = colors.almond })
hl("Keyword", { fg = colors.burnt_orange, bold = true })
hl("Exception", { fg = colors.persimmon })
hl("PreProc", { fg = colors.burnt_orange })
hl("Include", { fg = colors.burnt_orange })
hl("Define", { fg = colors.burnt_orange })
hl("Macro", { fg = colors.burnt_orange })
hl("PreCondit", { fg = colors.burnt_orange })
hl("Type", { fg = colors.denim_blue })
hl("StorageClass", { fg = colors.burnt_orange })
hl("Structure", { fg = colors.denim_blue })
hl("Typedef", { fg = colors.denim_blue })
hl("Special", { fg = colors.harvest_gold })
hl("SpecialChar", { fg = colors.harvest_gold })
hl("Tag", { fg = colors.denim_blue })
hl("Delimiter", { fg = colors.fg })
hl("SpecialComment", { fg = colors.cork, italic = true })
hl("Debug", { fg = colors.persimmon })
hl("Underlined", { fg = colors.denim_blue, underline = true })
hl("Ignore", { fg = colors.chocolate_brown })
hl("Error", { fg = colors.persimmon, bold = true })
hl("Todo", { fg = colors.bg, bg = colors.lava_gold, bold = true })

-- Treesitter syntax groups
hl("@variable", { fg = colors.fg })
hl("@variable.builtin", { fg = colors.harvest_gold })
hl("@variable.parameter", { fg = colors.fg, italic = true })
hl("@variable.member", { fg = colors.fg })
hl("@constant", { fg = colors.harvest_gold })
hl("@constant.builtin", { fg = colors.harvest_gold })
hl("@constant.macro", { fg = colors.burnt_orange })
hl("@module", { fg = colors.lava_gold })
hl("@label", { fg = colors.burnt_orange })
hl("@string", { fg = colors.avocado_green })
hl("@string.documentation", { fg = colors.light_avocado, italic = true })
hl("@string.regexp", { fg = colors.light_avocado })
hl("@string.escape", { fg = colors.harvest_gold })
hl("@string.special", { fg = colors.harvest_gold })
hl("@character", { fg = colors.avocado_green })
hl("@character.special", { fg = colors.harvest_gold })
hl("@number", { fg = colors.harvest_gold })
hl("@number.float", { fg = colors.harvest_gold })
hl("@boolean", { fg = colors.harvest_gold })
hl("@type", { fg = colors.denim_blue })
hl("@type.builtin", { fg = colors.denim_blue })
hl("@type.definition", { fg = colors.denim_blue })
hl("@attribute", { fg = colors.burnt_orange })
hl("@property", { fg = colors.fg })
hl("@function", { fg = colors.harvest_gold })
hl("@function.builtin", { fg = colors.harvest_gold })
hl("@function.call", { fg = colors.harvest_gold })
hl("@function.macro", { fg = colors.burnt_orange })
hl("@function.method", { fg = colors.harvest_gold })
hl("@function.method.call", { fg = colors.harvest_gold })
hl("@constructor", { fg = colors.denim_blue })
hl("@operator", { fg = colors.almond })
hl("@keyword", { fg = colors.burnt_orange, bold = true })
hl("@keyword.coroutine", { fg = colors.burnt_orange })
hl("@keyword.function", { fg = colors.burnt_orange, bold = true })
hl("@keyword.operator", { fg = colors.burnt_orange })
hl("@keyword.import", { fg = colors.burnt_orange })
hl("@keyword.type", { fg = colors.burnt_orange })
hl("@keyword.modifier", { fg = colors.burnt_orange })
hl("@keyword.repeat", { fg = colors.burnt_orange })
hl("@keyword.return", { fg = colors.burnt_orange, bold = true })
hl("@keyword.debug", { fg = colors.persimmon })
hl("@keyword.exception", { fg = colors.persimmon })
hl("@keyword.conditional", { fg = colors.burnt_orange })
hl("@keyword.conditional.ternary", { fg = colors.burnt_orange })
hl("@keyword.directive", { fg = colors.burnt_orange })
hl("@keyword.directive.define", { fg = colors.burnt_orange })
hl("@punctuation.delimiter", { fg = colors.fg })
hl("@punctuation.bracket", { fg = colors.fg })
hl("@punctuation.special", { fg = colors.harvest_gold })
hl("@comment", { fg = colors.cork, italic = true })
hl("@comment.documentation", { fg = colors.cork, italic = true })
hl("@comment.error", { fg = colors.persimmon, bold = true })
hl("@comment.warning", { fg = colors.lava_gold, bold = true })
hl("@comment.todo", { fg = colors.bg, bg = colors.lava_gold, bold = true })
hl("@comment.note", { fg = colors.denim_blue, bold = true })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.heading", { fg = colors.harvest_gold, bold = true })
hl("@markup.quote", { fg = colors.light_brown, italic = true })
hl("@markup.math", { fg = colors.denim_blue })
hl("@markup.link", { fg = colors.denim_blue, underline = true })
hl("@markup.link.label", { fg = colors.denim_blue })
hl("@markup.link.url", { fg = colors.light_denim_blue, underline = true })
hl("@markup.raw", { fg = colors.avocado_green })
hl("@markup.raw.block", { fg = colors.avocado_green })
hl("@markup.list", { fg = colors.burnt_orange })
hl("@markup.list.checked", { fg = colors.avocado_green })
hl("@markup.list.unchecked", { fg = colors.light_brown })
hl("@diff.plus", { fg = colors.avocado_green })
hl("@diff.minus", { fg = colors.persimmon })
hl("@diff.delta", { fg = colors.lava_gold })
hl("@tag", { fg = colors.burnt_orange })
hl("@tag.attribute", { fg = colors.denim_blue })
hl("@tag.delimiter", { fg = colors.fg })

-- LSP semantic tokens
hl("@lsp.type.class", { link = "@type" })
hl("@lsp.type.decorator", { link = "@function" })
hl("@lsp.type.enum", { link = "@type" })
hl("@lsp.type.enumMember", { link = "@constant" })
hl("@lsp.type.function", { link = "@function" })
hl("@lsp.type.interface", { link = "@type" })
hl("@lsp.type.macro", { link = "@macro" })
hl("@lsp.type.method", { link = "@function.method" })
hl("@lsp.type.namespace", { link = "@module" })
hl("@lsp.type.parameter", { link = "@variable.parameter" })
hl("@lsp.type.property", { link = "@property" })
hl("@lsp.type.struct", { link = "@type" })
hl("@lsp.type.type", { link = "@type" })
hl("@lsp.type.typeParameter", { link = "@type" })
hl("@lsp.type.variable", { link = "@variable" })

-- Diagnostics
hl("DiagnosticError", { fg = colors.persimmon })
hl("DiagnosticWarn", { fg = colors.lava_gold })
hl("DiagnosticInfo", { fg = colors.denim_blue })
hl("DiagnosticHint", { fg = colors.avocado_green })
hl("DiagnosticOk", { fg = colors.avocado_green })
hl("DiagnosticUnderlineError", { sp = colors.persimmon, undercurl = true })
hl("DiagnosticUnderlineWarn", { sp = colors.lava_gold, undercurl = true })
hl("DiagnosticUnderlineInfo", { sp = colors.denim_blue, undercurl = true })
hl("DiagnosticUnderlineHint", { sp = colors.avocado_green, undercurl = true })
hl("DiagnosticUnderlineOk", { sp = colors.avocado_green, undercurl = true })
hl("DiagnosticVirtualTextError", { fg = colors.persimmon, bg = colors.bg_secondary })
hl("DiagnosticVirtualTextWarn", { fg = colors.lava_gold, bg = colors.bg_secondary })
hl("DiagnosticVirtualTextInfo", { fg = colors.denim_blue, bg = colors.bg_secondary })
hl("DiagnosticVirtualTextHint", { fg = colors.avocado_green, bg = colors.bg_secondary })
hl("DiagnosticVirtualTextOk", { fg = colors.avocado_green, bg = colors.bg_secondary })
hl("DiagnosticFloatingError", { link = "DiagnosticError" })
hl("DiagnosticFloatingWarn", { link = "DiagnosticWarn" })
hl("DiagnosticFloatingInfo", { link = "DiagnosticInfo" })
hl("DiagnosticFloatingHint", { link = "DiagnosticHint" })
hl("DiagnosticFloatingOk", { link = "DiagnosticOk" })
hl("DiagnosticSignError", { link = "DiagnosticError" })
hl("DiagnosticSignWarn", { link = "DiagnosticWarn" })
hl("DiagnosticSignInfo", { link = "DiagnosticInfo" })
hl("DiagnosticSignHint", { link = "DiagnosticHint" })
hl("DiagnosticSignOk", { link = "DiagnosticOk" })

-- LSP references
hl("LspReferenceText", { bg = colors.bg_secondary })
hl("LspReferenceRead", { bg = colors.bg_secondary })
hl("LspReferenceWrite", { bg = colors.bg_secondary, bold = true })
hl("LspSignatureActiveParameter", { fg = colors.harvest_gold, bold = true })
hl("LspCodeLens", { fg = colors.light_brown, italic = true })
hl("LspCodeLensSeparator", { fg = colors.chocolate_brown })
hl("LspInlayHint", { fg = colors.light_brown, bg = colors.bg_secondary, italic = true })

-- Git signs
hl("GitSignsAdd", { fg = colors.avocado_green })
hl("GitSignsChange", { fg = colors.lava_gold })
hl("GitSignsDelete", { fg = colors.persimmon })
hl("GitSignsAddInline", { fg = colors.avocado_green, bg = colors.bg_secondary })
hl("GitSignsChangeInline", { fg = colors.lava_gold, bg = colors.bg_secondary })
hl("GitSignsDeleteInline", { fg = colors.persimmon, bg = colors.bg_secondary })

-- Terminal colors
vim.g.terminal_color_0 = colors.walnut
vim.g.terminal_color_1 = colors.persimmon
vim.g.terminal_color_2 = colors.avocado_green
vim.g.terminal_color_3 = colors.harvest_gold
vim.g.terminal_color_4 = colors.denim_blue
vim.g.terminal_color_5 = colors.lava_gold
vim.g.terminal_color_6 = colors.denim_blue
vim.g.terminal_color_7 = colors.almond
vim.g.terminal_color_8 = colors.light_brown
vim.g.terminal_color_9 = colors.burnt_orange
vim.g.terminal_color_10 = colors.light_avocado
vim.g.terminal_color_11 = colors.light_harvest_gold
vim.g.terminal_color_12 = colors.light_denim_blue
vim.g.terminal_color_13 = colors.light_lava_gold
vim.g.terminal_color_14 = colors.light_denim_blue
vim.g.terminal_color_15 = colors.light_almond
