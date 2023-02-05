local status, n = pcall(require, 'neosolarized')
if (not status) then return end


n.setup({comment_italics = true})

local colorbuddy = require('colorbuddy.init') 
local Color = colorbuddy.Color
local colors = colorbuddy.colors
local Group = colorbuddy.Group
local groups = colorbuddy.groups
local styles = colorbuddy.styles

Color.new('black', '#000000')
Group.new('CursorLine', colors.none, colors.base03, styles.NONE, colors.base1)
Group.new('CursorLineNr', colors.yellow, colors.black, styles.NONE, colors.base1)
Group.new('Visual', colors.none, colors.base03, styles.reverse)

-- LSP theme settings
local cError = groups.Error.fg
local cInfo = groups.Information.fg
local cWarn = groups.warning.fg
local cHint = groups.Hint.fg

Group.new("DiagnosticVirtualTextError", cError, cError:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextInfo", cInfo, cInfo:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextWarn", cWarn, cInfo:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticVirtualTextHint", cHint, cInfo:dark():dark():dark():dark(), styles.NONE)
Group.new("DiagnosticUnderlinedError", colors.none, colors.none, styles.undercurl, cError)
Group.new("DiagnosticUnderlinedWarn", colors.none, colors.none, styles.undercurl, cWarn)
Group.new("DiagnosticUnderlinedInfo", colors.none, colors.none, styles.undercurl, cInfo)
Group.new("DiagnosticUnderlinedHint", colors.none, colors.none, styles.undercurl, cHint)



