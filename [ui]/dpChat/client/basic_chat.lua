-- Расстояние, на котором видны локальные сообщения
local MAX_MESSAGE_DISTANCE = 100
-- Цвет сообщений при наибольшем расстоянии; 0 - черный, 1 - белый
local MIN_BRIGHTNESS = 0.4

local langTitles = {
	ru = "chat_tab_russian"
}

local function getLang()
	local lang = localPlayer:getData("langChat")
	if not lang or string.upper(lang) == "O1" then
		lang = "en"
	end
	return lang
end

local function setupLangTabTitle()
	local lang = getLang()
	local title = string.upper(lang)
	if langTitles[lang] then
		title = exports.dpLang:getString(langTitles[lang])
	end
	Chat.setTabTitle("lang", title)
end

local function setupGlobalTabTitle()
	Chat.setTabTitle("global", exports.dpLang:getString("chat_tab_global"))
end

local function setupLocalTabTitle()
	Chat.setTabTitle("local", exports.dpLang:getString("chat_tab_local"))
end

addEventHandler("onClientResourceStart", resourceRoot, function ()
	Chat.createTab("global", "Global", true)
	setupGlobalTabTitle()

	Chat.createTab("local", "Local", true)
	setupLocalTabTitle()

	Chat.createTab("web", "Web", true)	

	if getLang() ~= "en" then
		Chat.createTab("lang", "Lang", true)
		setupLangTabTitle()
	end
end)

addEvent("dpChat.message")
addEventHandler("dpChat.message", root, function (tabName, message)
	if tabName == "global" or tabName == "lang" or tabName == "local" or tabName == "web" then
		triggerServerEvent("dpChat.broadcastMessage", root, tabName, message)
	end
end)

local function getColorFromDistance(distance, r, g, b)
	local multiplier = MIN_BRIGHTNESS + math.min(1 - distance / MAX_MESSAGE_DISTANCE, 1) * (1 - MIN_BRIGHTNESS)
	if not r or not g or not b then
		r, g, b = 255, 255, 255
	end
	r = math.floor(multiplier * r)
	g = math.floor(multiplier * g)
	b = math.floor(multiplier * b)
	return exports.dpUtils:RGBToHex(r, g, b)
end

addEvent("dpChat.broadcastMessage", true)
addEventHandler("dpChat.broadcastMessage", root, function (tabName, message, sender, distance)
	if tabName == "local" then
		local message = sender.name .. tostring(getColorFromDistance(distance)) .. ": " .. tostring(message)
		Chat.message(tabName, message)
	else
		Chat.message(tabName, message)
	end
end)

addEvent("dpChat.me", true)
addEventHandler("dpChat.me", root, function (tabName, message, sender, distance)
	if tabName == "local" then
		local senderName = exports.dpUtils:removeHexFromString(tostring(sender.name))
		message = exports.dpUtils:removeHexFromString(tostring(message))
		message = getColorFromDistance(distance, 255, 0, 255) .. "* " ..  senderName .. " " .. message
		Chat.message(tabName, message)
	else
		local senderName = exports.dpUtils:removeHexFromString(tostring(sender.name))
		message = exports.dpUtils:removeHexFromString(tostring(message))
		message = "#FF00FF* " .. senderName .. " " .. message		
		Chat.message(tabName, message)
	end
end)

addEventHandler("onClientElementDataChange", localPlayer, function(dataName)
	if dataName == "langChat" then
		Chat.clearTab("lang")
		setupLangTabTitle()
	end
end)

addEventHandler("dpLang.languageChanged", root, function ()
	setupLangTabTitle()
	setupGlobalTabTitle()
	setupLocalTabTitle()
end)

addEvent("dpChat.serverMessage", true)
addEventHandler("dpChat.serverMessage", resourceRoot, function (tabName, message)
	Chat.message(tabName, message)
end)