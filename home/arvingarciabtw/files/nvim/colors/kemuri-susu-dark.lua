-- Kemuri Susu (dark) colorscheme for Neovim / LazyVim
-- Generated from the Noctalia community palette JSON

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "kemuri-susu-dark"

local c = {
  bg        = "#1e1d1b", -- mSurface
  bg_alt    = "#282624", -- mSurfaceVariant / terminal.normal.black
  bg_lighter= "#55504a", -- mOutline / terminal.bright.black
  fg        = "#f0ede6", -- mOnSurface / terminal.foreground
  fg_dim    = "#cabaaa", -- mPrimary / mOnSurfaceVariant
  fg_bright = "#fafbfe", -- terminal.bright.white
  muted     = "#73685f", -- mSecondary
  subtle    = "#594f46", -- mTertiary
  red       = "#cf7670",
  red_br    = "#db8b85",
  green     = "#8ca38a",
  green_br  = "#a3b8a1",
  yellow    = "#bfa67a",
  yellow_br = "#d1ba94",
  blue      = "#78909c",
  blue_br   = "#8fa7b3",
  magenta   = "#b38f99",
  magenta_br= "#c7a3ad",
  cyan      = "#7fa39a",
  cyan_br   = "#96b8b0",
  cursor_bg = "#f0ede6",
  cursor_fg = "#282624",
  sel_bg    = "#cabaaa",
  sel_fg    = "#1e1d1b",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal",        { fg = c.fg, bg = c.bg })
hl("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hl("FloatBorder",   { fg = c.bg_lighter, bg = c.bg_alt })
hl("Cursor",        { fg = c.cursor_fg, bg = c.cursor_bg })
hl("CursorLine",    { bg = c.bg_alt })
hl("CursorLineNr",  { fg = c.fg_dim, bold = true })
hl("LineNr",        { fg = c.muted })
hl("SignColumn",    { bg = c.bg })
hl("ColorColumn",   { bg = c.bg_alt })
hl("Visual",        { fg = c.sel_fg, bg = c.sel_bg })
hl("Search",        { fg = c.bg, bg = c.yellow })
hl("IncSearch",     { fg = c.bg, bg = c.yellow_br })
hl("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hl("PmenuSel",      { fg = c.sel_fg, bg = c.sel_bg })
hl("PmenuBorder",   { fg = c.bg_lighter, bg = c.bg_alt })
hl("StatusLine",    { fg = c.fg_dim, bg = c.bg_alt })
hl("StatusLineNC",  { fg = c.muted, bg = c.bg_alt })
hl("WinSeparator",  { fg = c.bg_lighter, bg = c.bg })
hl("VertSplit",     { fg = c.bg_lighter, bg = c.bg })
hl("TabLine",       { fg = c.muted, bg = c.bg_alt })
hl("TabLineSel",    { fg = c.fg, bg = c.bg })
hl("Folded",        { fg = c.muted, bg = c.bg_alt })
hl("MatchParen",    { fg = c.yellow, bold = true })
hl("NonText",       { fg = c.bg_lighter })
hl("Whitespace",    { fg = c.bg_lighter })
hl("EndOfBuffer",   { fg = c.bg })

-- Diagnostics
hl("DiagnosticError", { fg = c.red })
hl("DiagnosticWarn",  { fg = c.yellow })
hl("DiagnosticInfo",  { fg = c.blue })
hl("DiagnosticHint",  { fg = c.cyan })
hl("DiffAdd",         { fg = c.green, bg = c.bg_alt })
hl("DiffChange",      { fg = c.yellow, bg = c.bg_alt })
hl("DiffDelete",      { fg = c.red, bg = c.bg_alt })
hl("DiffText",        { fg = c.blue, bg = c.bg_alt })

-- Syntax (classic groups)
hl("Comment",    { fg = c.muted, italic = true })
hl("Constant",   { fg = c.magenta })
hl("String",     { fg = c.green })
hl("Character",  { fg = c.green })
hl("Number",     { fg = c.magenta })
hl("Boolean",    { fg = c.magenta })
hl("Identifier", { fg = c.fg })
hl("Function",   { fg = c.blue, bold = true })
hl("Statement",  { fg = c.subtle, bold = true })
hl("Keyword",    { fg = c.subtle, bold = true })
hl("PreProc",    { fg = c.cyan })
hl("Type",       { fg = c.yellow })
hl("Special",    { fg = c.cyan })
hl("Underlined", { underline = true })
hl("Error",      { fg = c.red, bold = true })
hl("Todo",       { fg = c.bg, bg = c.yellow, bold = true })

-- Treesitter
hl("@variable",          { fg = c.fg })
hl("@variable.builtin",  { fg = c.magenta })
hl("@function",          { fg = c.blue, bold = true })
hl("@function.builtin",  { fg = c.blue })
hl("@keyword",           { fg = c.subtle, bold = true })
hl("@string",            { fg = c.green })
hl("@comment",           { fg = c.muted, italic = true })
hl("@type",              { fg = c.yellow })
hl("@constant",          { fg = c.magenta })
hl("@property",          { fg = c.fg_dim })
hl("@tag",                { fg = c.subtle })
hl("@tag.attribute",      { fg = c.yellow })
hl("@punctuation",        { fg = c.muted })

-- Popular plugin groups
hl("TelescopeNormal",     { fg = c.fg, bg = c.bg })
hl("TelescopeBorder",     { fg = c.bg_lighter, bg = c.bg })
hl("TelescopeSelection",  { fg = c.sel_fg, bg = c.sel_bg })
hl("NvimTreeNormal",      { fg = c.fg, bg = c.bg })
hl("NvimTreeFolderIcon",  { fg = c.blue })
hl("GitSignsAdd",         { fg = c.green })
hl("GitSignsChange",      { fg = c.yellow })
hl("GitSignsDelete",      { fg = c.red })
