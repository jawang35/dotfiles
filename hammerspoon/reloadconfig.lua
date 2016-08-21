local function reloadConfig(hyper)
  hs.hotkey.bind(hyper, 'r', hs.reload)
end

hs.alert.show('Hammerspoon config loaded')

return reloadConfig
