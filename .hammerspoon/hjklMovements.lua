local function remap(mods, key, keyCodeFunc)
  hs.hotkey.bind(mods, key, keyCodeFunc, nil, keyCodeFunc)
end

local function keyCode(mods, key)
  return function()
    hs.eventtap.keyStroke(mods, key, 0)
  end
end

local function hjklMovements(hyper, hyperShift)
  remap(hyper, 'h', keyCode(nil, 'left'))
  remap(hyper, 'j', keyCode(nil, 'down'))
  remap(hyper, 'k', keyCode(nil, 'up'))
  remap(hyper, 'l', keyCode(nil, 'right'))
end

return hjklMovements
