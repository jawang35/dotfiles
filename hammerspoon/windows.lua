local function fullScreen()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  win:setFrame(frame)
end

local function center()
  local win = hs.window.focusedWindow()

  win:centerOnScreen()
end

local function leftHalf()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.w = max.w / 2
  win:setFrame(frame)
end

local function bottomHalf()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.y = max.y + max.h / 2
  frame.h = max.h / 2
  win:setFrame(frame)
end

local function topHalf()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.y = max.y
  frame.h = max.h / 2
  win:setFrame(frame)
end

local function rightHalf()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  frame.x = max.x + max.w / 2
  frame.w = max.w / 2
  win:setFrame(frame)
end

local function leftScreen()
  local win = hs.window.focusedWindow()

  win:moveOneScreenWest(true, true)
end

local function lowerScreen()
  local win = hs.window.focusedWindow()

  win:moveOneScreenSouth(true, true)
end

local function upperScreen()
  local win = hs.window.focusedWindow()

  win:moveOneScreenNorth(true, true)
end

local function rightScreen()
  local win = hs.window.focusedWindow()

  win:moveOneScreenEast(true, true)
end

local function windows(hyper, hyperControl)
  hs.window.animationDuration = 0

  hs.hotkey.bind(hyper, 'f', fullScreen)
  hs.hotkey.bind(hyper, 'c', center)

  hs.hotkey.bind(hyper, 'h', leftHalf)
  hs.hotkey.bind(hyper, 'j', bottomHalf)
  hs.hotkey.bind(hyper, 'k', topHalf)
  hs.hotkey.bind(hyper, 'l', rightHalf)

  hs.hotkey.bind(hyperControl, 'h', leftScreen)
  hs.hotkey.bind(hyperControl, 'j', lowerScreen)
  hs.hotkey.bind(hyperControl, 'k', upperScreen)
  hs.hotkey.bind(hyperControl, 'l', rightScreen)
end

return windows
