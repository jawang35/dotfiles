local function reloadConfig(hyper)
  hs.hotkey.bind(hyper, 'r', hs.reload)
  hs.alert.show('Hammerspoon config loaded')
end

return reloadConfig
