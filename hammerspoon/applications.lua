local function applications(hyper)
  local applicationModal = hs.hotkey.modal.new(hyper, 'a')
  local menubar = hs.menubar.new()

  function applicationModal:entered()
    menubar:setTitle('Application Mode')
  end

  function applicationModal:exited()
    menubar:setTitle(nil)
  end

  local function launch(application)
    applicationModal:exit()

    if not hs.application.launchOrFocus(application) then
      hs.alert.show(application .. ' not found')
    end
  end

  applicationModal:bind(hyper, 'c', function () launch('Google Chrome') end)
  applicationModal:bind(hyper, 'm', function () launch('Messages') end)
  applicationModal:bind(hyper, 'o', function () launch('Microsoft Outlook') end)
  applicationModal:bind(hyper, 'p', function () launch('1Password 6') end)
  applicationModal:bind(hyper, 's', function () launch('Slack') end)
  hs.hotkey.bind(hyper, '`', function () launch('Terminal') end)
  hs.hotkey.bind(hyper, '1', function () launch('Atom') end)
  applicationModal:bind('', 'escape', function () applicationModal:exit() end)
end

return applications
