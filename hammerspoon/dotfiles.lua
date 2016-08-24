local function open()
  local _, success = hs.execute('atom ~/.dotfiles', true)

  if not success then
    hs.alert.show('Atom not found')
  end
end

local function dotfiles(hyper)
  hs.hotkey.bind(hyper, '.', open)
end

return dotfiles
