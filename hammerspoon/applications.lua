local function applications(hyper)
  local applicationModal = hs.hotkey.modal.new(hyper, 'a')

  local function launch(application)
    applicationModal:exit()

    if not hs.application.launchOrFocus(application) then
      hs.alert.show(application .. ' not found')
    end
  end

  applicationModal:bind(hyper, 'a', nil, function () launch('Atom') end)
  applicationModal:bind(hyper, 'c', nil, function () launch('Google Chrome') end)
  applicationModal:bind(hyper, 'm', nil, function () launch('Messages') end)
  applicationModal:bind(hyper, 's', nil, function () launch('Slack') end)
  applicationModal:bind(hyper, 't', nil, function () launch('Terminal') end)
end

return applications
