function setFrame(frameBuilder, multiplier)
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local gap = 10

  local frame = frameBuilder(win, frame, max, gap, multiplier)

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

function up(win, frame, max, gap, multiplier)
  frame.y = max.y + gap
  frame.h = (max.h * multiplier) - (gap * 3 *  multiplier)
  return frame
end

function down(win, frame, max, gap, multiplier)
  frame.y = max.y + (max.h * multiplier) + (gap * multiplier)
  frame.h = (max.h * multiplier) - (gap * 3 * multiplier)
  return frame
end

function left(win, frame, max, gap, multiplier)
  frame.x = max.x + gap
  frame.w = (max.w * multiplier) - (gap * 3 * multiplier)
  return frame
end

function right(win, frame, max, gap, multiplier)
  frame.x = max.x + (max.w * multiplier) + (gap * multiplier)
  frame.w = (max.w * multiplier) - (gap * 3 * multiplier)
  return frame
end

hs.hotkey.bind({"cmd", "alt"}, "r", hs.reload)
hs.hotkey.bind({"cmd", "alt"}, "f", function() setFrame(full) end)
hs.hotkey.bind({"cmd", "alt"}, "h", function() setFrame(left, 1 / 2) end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "h", function() setFrame(left, 2 / 3) end)
hs.hotkey.bind({"cmd", "alt"}, "j", function() setFrame(down, 1 / 2) end)
hs.hotkey.bind({"cmd", "alt"}, "k", function() setFrame(up , 1 / 2) end)
hs.hotkey.bind({"cmd", "alt"}, "l", function() setFrame(right, 1 / 2) end)
hs.hotkey.bind({"cmd", "alt", "shift"}, "l", function() setFrame(right, 1 / 3) end)

hs.window.animationDuration = 0.1

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
