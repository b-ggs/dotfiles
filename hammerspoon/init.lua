-- Window full
hs.hotkey.bind({"cmd", "alt"}, "f", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Window 50% up
hs.hotkey.bind({"cmd", "alt"}, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Window 50% down
hs.hotkey.bind({"cmd", "alt"}, "j", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Window 50% left
hs.hotkey.bind({"cmd", "alt"}, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w / 2
  win:setFrame(f)
end)

-- Window 50% right
hs.hotkey.bind({"cmd", "alt"}, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.w = max.w / 2
  win:setFrame(f)
end)

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
