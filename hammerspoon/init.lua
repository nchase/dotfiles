hs.window.animationDuration = 0 -- disable animations

-- left:
hs.hotkey.bind({ "ctrl", "cmd" }, "h", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	if win:isFullScreen() then
		return
	end

	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h

	win:setFrame(f)
end)

-- right:
hs.hotkey.bind({ "ctrl", "cmd" }, "l", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	if win:isFullScreen() then
		return
	end

	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

-- full-screen:
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "space", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	if win:isFullScreen() then
		return
	end

	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h
	win:setFrame(f)
end)

-- center:
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "C", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()

	if win:isFullScreen() then
		return
	end

	f.x = max.w / 2 - (max.w / 4)
	f.y = max.h / 2 - (max.h / 4)
	win:setFrame(f)
end)

-- reload:
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")
