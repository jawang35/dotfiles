local function onFocusedWindow(callback)
  local window = hs.window.focusedWindow()

  if window then
    callback(window)
  else
    hs.alert.show('No active window')
  end
end

local function fullScreen()
  onFocusedWindow(function (window)
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
  onFocusedWindow(hs.window.centerOnScreen)
end

local function leftHalf()
  onFocusedWindow(function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.w = max.w / 2
    window:setFrame(frame)
  end)
end

local function bottomHalf()
  onFocusedWindow(function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.y = max.y + max.h / 2
    frame.h = max.h / 2
    window:setFrame(frame)
  end)
end

local function topHalf()
  onFocusedWindow(function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.y = max.y
    frame.h = max.h / 2
    window:setFrame(frame)
  end)
end

local function rightHalf()
  onFocusedWindow(function (window)
    local frame = window:frame()
    local screen = window:screen()
    local max = screen:frame()

    frame.x = max.x + max.w / 2
    frame.w = max.w / 2
    window:setFrame(frame)
  end)
end

local function leftScreen()
  onFocusedWindow(function (window)
    window:moveOneScreenWest(true, true)
  end)
end

local function lowerScreen()
  onFocusedWindow(function (window)
    window:moveOneScreenSouth(true, true)
  end)
end

local function upperScreen()
  onFocusedWindow(function (window)
    window:moveOneScreenNorth(true, true)
  end)
end

local function rightScreen()
  onFocusedWindow(function (window)
    window:moveOneScreenEast(true, true)
  end)
end

local function windows(hyper, hyperShift)
  hs.window.animationDuration = 0

  local windowModal = hs.hotkey.modal.new(hyper, 'w')

  function windowModal:entered()
    menubar = hs.menubar.new()
    menubar:setTitle('Window Mode')
  end

  function windowModal:exited()
    menubar:delete()
  end

  hs.hotkey.bind(hyper, 'f', fullScreen)
  hs.hotkey.bind(hyper, 'c', center)

  windowModal:bind(hyper, 'h', leftHalf)
  windowModal:bind(hyper, 'j', bottomHalf)
  windowModal:bind(hyper, 'k', topHalf)
  windowModal:bind(hyper, 'l', rightHalf)

  windowModal:bind('', 'escape', function () windowModal:exit() end)
  windowModal:bind(hyperShift, 'h', leftScreen)
  windowModal:bind(hyperShift, 'j', lowerScreen)
  windowModal:bind(hyperShift, 'k', upperScreen)
  windowModal:bind(hyperShift, 'l', rightScreen)
end

return windows
