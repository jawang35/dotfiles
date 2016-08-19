hyper = { 'cmd', 'alt' }

hs.window.animationDuration = 0

hs.hotkey.bind(hyper, 'F', function ()
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

hs.hotkey.bind(hyper, 'H', function ()
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

hs.hotkey.bind(hyper, 'J', function ()
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

hs.hotkey.bind(hyper, 'K', function ()
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

hs.hotkey.bind(hyper, 'L', function ()
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
