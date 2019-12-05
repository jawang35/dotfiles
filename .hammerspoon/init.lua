local hyper = { 'cmd', 'alt', 'ctrl' }
local hyperShift = { 'cmd', 'alt', 'ctrl', 'shift' }

require('reloadConfig')(hyper, hyperShift)

require('applications')(hyper, hyperShift)
require('hjklArrows')(hyper, hyperShift)
require('spotify')(hyper, hyperShift)
require('windows')(hyper, hyperShift)

-- TODO: Improve LastPass workflow
