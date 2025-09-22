local function applications(hyper)
  local applicationModal = hs.hotkey.modal.new(hyper, 'a')
  local menubar

  function applicationModal:entered()
    menubar = hs.menubar.new()
    menubar:setTitle('Application Mode')
  end

  function applicationModal:exited()
    menubar:delete()
  end

  local function launch(application)
    applicationModal:exit()

    if not hs.application.launchOrFocus(application) then
      hs.alert.show(application .. ' not found')
    end
  end

  hs.hotkey.bind(hyper, '`', function () launch('kitty') end)
  hs.hotkey.bind(hyper, '1', function () launch('Brave Browser') end)

  applicationModal:bind('', 'escape', function () applicationModal:exit() end)
  applicationModal:bind(hyper, 'a', function () launch('Ente Auth') end)
  applicationModal:bind(hyper, 'm', function () launch('Messages') end)
  applicationModal:bind(hyper, 'o', function () launch('Microsoft Outlook') end)
  applicationModal:bind(hyper, 'p', function () launch('Bitwarden') end)
  applicationModal:bind(hyper, 's', function () launch('Slack') end)
  applicationModal:bind(hyper, 't', function () launch('Microsoft Teams') end)

  applicationModal:enter()
  applicationModal:exit()
end

return applications
