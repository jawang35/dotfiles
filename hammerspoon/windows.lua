local function windows(hyper, hyperControl)
  hs.window.animationDuration = 0

  hs.hotkey.bind(hyper, 'f', function ()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    win:setFrame(frame)
  end)

  hs.hotkey.bind(hyper, 'c', function ()
    local win = hs.window.focusedWindow()

    win:centerOnScreen()
  end)

  hs.hotkey.bind(hyper, 'h', function ()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    win:setFrame(frame)
  end)

  hs.hotkey.bind(hyper, 'j', function ()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y + max.h / 2
    frame.w = max.w
    frame.h = max.h / 2
    win:setFrame(frame)
  end)

  hs.hotkey.bind(hyper, 'k', function ()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h / 2
    win:setFrame(frame)
  end)

  hs.hotkey.bind(hyper, 'l', function ()
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    frame.x = max.x + max.w / 2
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    win:setFrame(frame)
  end)

  hs.hotkey.bind(hyperControl, 'h', function ()
    local win = hs.window.focusedWindow()

    win:moveOneScreenWest(true, true)
  end)

  hs.hotkey.bind(hyperControl, 'j', function ()
    local win = hs.window.focusedWindow()

    win:moveOneScreenSouth(true, true)
  end)

  hs.hotkey.bind(hyperControl, 'k', function ()
    local win = hs.window.focusedWindow()

    win:moveOneScreenNorth(true, true)
  end)

  hs.hotkey.bind(hyperControl, 'l', function ()
    local win = hs.window.focusedWindow()

    win:moveOneScreenEast(true, true)
  end)
end

return windows
