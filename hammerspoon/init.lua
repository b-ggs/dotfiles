-- Yoinked original version from here: https://github.com/aleks/hammerspoon-dotfiles

-- Window Fullscreen
hs.hotkey.bind({"cmd", "alt"}, "Up", function()
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

-- Window with borders
hs.hotkey.bind({"cmd", "alt"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 6)
  f.y = max.y
  f.w = max.w - (max.w / 6 * 2)
  f.h = max.h
  win:setFrame(f)
end)

-- Window 50% left
hs.hotkey.bind({"cmd", "alt"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Window 50% right
hs.hotkey.bind({"cmd", "alt"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- -- Spotify Controls
-- hs.hotkey.bind({"ctrl", "cmd"}, "f12", function()
--   hs.spotify.playpause()
-- end)
--
-- hs.hotkey.bind({"ctrl", "cmd"}, "f10", function()
--   hs.spotify.previous()
--
--   artist = hs.spotify.getCurrentArtist()
--   track = hs.spotify.getCurrentTrack()
--
--   hs.alert.closeAll()
--   hs.alert(artist .. " - " .. track)
-- end)
--
-- hs.hotkey.bind({"ctrl", "cmd"}, "f11", function()
--   hs.spotify.next()
--
--   artist = hs.spotify.getCurrentArtist()
--   track = hs.spotify.getCurrentTrack()
--
--   hs.alert.closeAll()
--   hs.alert(artist .. " - " .. track)
-- end)


-- Remap HJKL to arrow keys
function arrow_keys(direction)
  return function() hs.eventtap.keyStroke({}, direction, 100) end
end

-- Call arrow_* on press and repeat!
hs.hotkey.bind({"ctrl", "cmd"}, "H", arrow_keys("left"),  nil, arrow_keys("left"))
hs.hotkey.bind({"ctrl", "cmd"}, "J", arrow_keys("down"),  nil, arrow_keys("down"))
hs.hotkey.bind({"ctrl", "cmd"}, "K", arrow_keys("up"),  nil, arrow_keys("up"))
hs.hotkey.bind({"ctrl", "cmd"}, "L", arrow_keys("right"),  nil, arrow_keys("right"))

-- hs.alert.show("Config loaded")
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
