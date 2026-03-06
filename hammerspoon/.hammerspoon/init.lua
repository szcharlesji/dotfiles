hs = hs

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "H", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()

	f.x = f.x - 20
	win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "L", function()
	local win = hs.window.focusedWindow()
	local f = win:frame()

	f.x = f.x + 20
	win:setFrame(f)
end)

