hs = hs

local function moveAppToHalf(appName, half)
	local margin = 5
	local gap = margin / 2

	hs.application.launchOrFocus(appName)

	local app = hs.appfinder.appFromName(appName)
	if not app then
		return
	end

	local win = app:mainWindow()
	if not win then
		return
	end

	local screenFrame = win:screen():frame()
	local frame = {
		x = screenFrame.x + margin,
		y = screenFrame.y + margin,
		w = (screenFrame.w / 2) - margin - gap,
		h = screenFrame.h - (margin * 2),
	}

	if half == "right" then
		frame.x = screenFrame.x + (screenFrame.w / 2) + gap
	end

	win:setFrame(frame)
	win:focus()
end

hs.hotkey.bind({ "cmd", "alt", "ctrl", "shift" }, "1", function()
	moveAppToHalf("Dia", "left")
	moveAppToHalf("Obsidian", "right")
end)
