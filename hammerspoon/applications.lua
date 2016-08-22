local function applications(hyper)
  local applicationModal = hs.hotkey.modal.new(hyper, 'a')

  local function launch(application)
    applicationModal:exit()

    if not hs.application.launchOrFocus(application) then
      hs.alert.show(application .. ' not found')
    end
  end

  applicationModal:bind(hyper, 'a', function () launch('Atom') end)
  applicationModal:bind(hyper, 'c', function () launch('Google Chrome') end)
  applicationModal:bind(hyper, 'm', function () launch('Messages') end)
  applicationModal:bind(hyper, 's', function () launch('Slack') end)
  applicationModal:bind(hyper, 't', function () launch('Terminal') end)
  applicationModal:bind('', 'escape', function () applicationModal:exit() end)
end

return applications
