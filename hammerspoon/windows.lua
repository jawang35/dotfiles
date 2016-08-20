local function doIfActiveWindow(window, callback)
  if window then
    callback(window)
  else
    hs.alert.show('No active window')
  end
end

local function fullScreen()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    window:setFrame(frame)
  end)
end

local function center()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, hs.window.centerOnScreen)
end

local function leftHalf()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.w = max.w / 2
    window:setFrame(frame)
  end)
end

local function bottomHalf()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.y = max.y + max.h / 2
    frame.h = max.h / 2
    window:setFrame(frame)
  end)
end

local function topHalf()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.y = max.y
    frame.h = max.h / 2
    window:setFrame(frame)
  end)
end

local function rightHalf()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.x = max.x + max.w / 2
    frame.w = max.w / 2
    window:setFrame(frame)
  end)
end

local function leftScreen()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    window:moveOneScreenWest(true, true)
  end)
end

local function lowerScreen()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    window:moveOneScreenSouth(true, true)
  end)
end

local function upperScreen()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    window:moveOneScreenNorth(true, true)
  end)
end

local function rightScreen()
  local window = hs.window.focusedWindow()

  doIfActiveWindow(window, function (window)
    window:moveOneScreenEast(true, true)
  end)
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
