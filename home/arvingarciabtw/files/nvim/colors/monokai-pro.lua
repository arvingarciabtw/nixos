-- Monokai Pro (dark) colorscheme for Neovim / LazyVim
-- Matches Ghostty's built-in "Monokai Pro" theme palette

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "monokai-pro"

local c = {
  bg         = "#2d2a2e", -- background
  bg_alt     = "#221f22", -- slightly darker panel bg
  bg_lighter = "#403e41", -- terminal.normal.black / UI borders
  fg         = "#fcfcfa", -- foreground / terminal.bright.white
  fg_dim     = "#c1c0c0", -- dimmer text
  fg_bright  = "#fcfcfa",
  muted      = "#727072", -- comments / terminal.bright.black
  subtle     = "#5b595c", -- selection bg
  red        = "#ff6188",
  red_br     = "#ff6188",
  green      = "#a9dc76",
  green_br   = "#a9dc76",
  yellow     = "#ffd866",
  yellow_br  = "#ffd866",
  orange     = "#fc9867",
  purple     = "#ab9df2",
  cyan       = "#78dce8",
  cyan_br    = "#78dce8",
  cursor_bg  = "#fcfcfa",
  cursor_fg  = "#2d2a2e",
  sel_bg     = "#5b595c",
  sel_fg     = "#fcfcfa",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal", { fg = c.fg, bg = c.bg })
hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
hl("FloatBorder", { fg = c.bg_lighter, bg = c.bg_alt })
hl("Cursor", { fg = c.cursor_fg, bg = c.cursor_bg })
hl("CursorLine", { bg = c.bg_alt })
hl("CursorLineNr", { fg = c.yellow, bold = true })
hl("LineNr", { fg = c.muted })
hl("SignColumn", { bg = c.bg })
hl("ColorColumn", { bg = c.bg_alt })
hl("Visual", { fg = c.sel_fg, bg = c.sel_bg })
hl("Search", { fg = c.bg, bg = c.yellow })
hl("IncSearch", { fg = c.bg, bg = c.orange })
hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel", { fg = c.sel_fg, bg = c.sel_bg })
hl("PmenuBorder", { fg = c.bg_lighter, bg = c.bg_alt })
hl("StatusLine", { fg = c.fg_dim, bg = c.bg_alt })
hl("StatusLineNC", { fg = c.muted, bg = c.bg_alt })
hl("WinSeparator", { fg = c.bg_lighter, bg = c.bg })
hl("VertSplit", { fg = c.bg_lighter, bg = c.bg })
hl("TabLine", { fg = c.muted, bg = c.bg_alt })
hl("TabLineSel", { fg = c.fg, bg = c.bg })
hl("Folded", { fg = c.muted, bg = c.bg_alt })
hl("MatchParen", { fg = c.orange, bold = true })
hl("NonText", { fg = c.bg_lighter })
hl("Whitespace", { fg = c.bg_lighter })
hl("EndOfBuffer", { fg = c.bg })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn", { fg = c.yellow })
hl("DiagnosticInfo", { fg = c.cyan })
hl("DiagnosticHint", { fg = c.purple })
hl("DiffAdd", { fg = c.green, bg = c.bg_alt })
hl("DiffChange", { fg = c.yellow, bg = c.bg_alt })
hl("DiffDelete", { fg = c.red, bg = c.bg_alt })
hl("DiffText", { fg = c.cyan, bg = c.bg_alt })

-- Syntax (classic groups)
hl("Comment", { fg = c.muted, italic = true })
hl("Constant", { fg = c.purple })
hl("String", { fg = c.yellow })
hl("Character", { fg = c.yellow })
hl("Number", { fg = c.purple })
hl("Boolean", { fg = c.purple })
hl("Identifier", { fg = c.fg })
hl("Function", { fg = c.green, bold = true })
hl("Statement", { fg = c.red, bold = true })
hl("Keyword", { fg = c.red, italic = true })
hl("PreProc", { fg = c.cyan })
hl("Type", { fg = c.cyan, italic = true })
hl("Special", { fg = c.orange })
hl("Underlined", { underline = true })
hl("Error", { fg = c.red, bold = true })
hl("Todo", { fg = c.bg, bg = c.yellow, bold = true })

-- Treesitter
hl("@variable", { fg = c.fg })
hl("@variable.builtin", { fg = c.purple })
hl("@function", { fg = c.green, bold = true })
hl("@function.builtin", { fg = c.green })
hl("@keyword", { fg = c.red, italic = true })
hl("@string", { fg = c.yellow })
hl("@comment", { fg = c.muted, italic = true })
hl("@type", { fg = c.cyan, italic = true })
hl("@constant", { fg = c.purple })
hl("@property", { fg = c.fg_dim })
hl("@tag", { fg = c.red })
hl("@tag.attribute", { fg = c.green, italic = true })
hl("@punctuation", { fg = c.fg })

-- Popular plugin groups
hl("TelescopeNormal", { fg = c.fg, bg = c.bg })
hl("TelescopeBorder", { fg = c.bg_lighter, bg = c.bg })
hl("TelescopeSelection", { fg = c.sel_fg, bg = c.sel_bg })
hl("NvimTreeNormal", { fg = c.fg, bg = c.bg })
hl("NvimTreeFolderIcon", { fg = c.cyan })
hl("GitSignsAdd", { fg = c.green })
hl("GitSignsChange", { fg = c.yellow })
hl("GitSignsDelete", { fg = c.red })
