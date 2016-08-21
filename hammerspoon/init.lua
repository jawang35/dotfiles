local hyper = { 'cmd', 'alt' }
local hyperControl = { 'cmd', 'alt', 'ctrl' }

require('reloadConfig')(hyper, hyperControl)
require('applications')(hyper, hyperControl)
require('windows')(hyper, hyperControl)
