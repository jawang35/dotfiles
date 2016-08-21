local hyper = { 'cmd', 'alt' }
local hyperControl = { 'cmd', 'alt', 'ctrl' }

require('reloadConfig')(hyper, hyperControl)
require('applications')(hyper, hyperControl)
require('windows')(hyper, hyperControl)

-- TODO: Bind hyper, '.' to open dotfiles in Atom
-- TODO: Improve LastPass workflow
