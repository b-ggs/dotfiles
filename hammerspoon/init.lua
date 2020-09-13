function setFrame(frameBuilder)
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local gap = 10

  local frame = frameBuilder(win, frame, max, gap)

  informativeText = "x: " .. frame.x .. " y: " .. frame.y .. " w: " .. frame.w .. " h: ".. frame.h
  hs.notify.new({title="Hammerspoon", informativeText=informativeText}):send()

  win:setFrame(frame)
end

function full(win, frame, max, gap)
  frame.x = max.x + gap
  frame.y = max.y + gap
  frame.w = max.w - gap * 2
  frame.h = max.h - gap * 2
  return frame
end

function up50(win, frame, max, gap)
  frame.y = max.y + gap
  frame.h = (max.h / 2) - (gap * 3 / 2)
  return frame
end

function down50(win, frame, max, gap)
  frame.y = max.y + (max.h / 2) + (gap / 2)
  frame.h = (max.h / 2) - (gap * 3 / 2)
  return frame
end

function left50(win, frame, max, gap)
  frame.x = max.x + gap
  frame.w = (max.w / 2) - (gap * 3 / 2)
  return frame
end

function right50(win, frame, max, gap)
  frame.x = max.x + (max.w / 2) + (gap / 2)
  frame.w = (max.w / 2) - (gap * 3 / 2)
  return frame
end

function left66(win, frame, max, gap)
  frame.x = max.x + gap
  frame.w = (max.w / 3 * 2) - (gap * 3 / 2)
  return frame
end

function right33(win, frame, max, gap)
  frame.x = max.x + (max.w / 3 * 2) + (gap / 2)
  frame.w = (max.w / 3) - (gap * 3 / 2)
  return frame
end

hs.hotkey.bind({"cmd", "alt"}, "r", hs.reload)
hs.hotkey.bind({"cmd", "alt"}, "f", function() setFrame(full) end)
hs.hotkey.bind({"cmd", "alt"}, "h", function() setFrame(left50) end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "h", function() setFrame(left66) end)
hs.hotkey.bind({"cmd", "alt"}, "j", function() setFrame(down50) end)
hs.hotkey.bind({"cmd", "alt"}, "k", function() setFrame(up50) end)
hs.hotkey.bind({"cmd", "alt"}, "l", function() setFrame(right50) end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "l", function() setFrame(right33) end)

hs.window.animationDuration = 0.1

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
