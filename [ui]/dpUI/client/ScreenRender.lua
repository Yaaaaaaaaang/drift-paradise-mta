ScreenRender = {}
local SCREENS_PATH = "html/screens/"
local SCREENS_URL = "http://mta/local/" .. SCREENS_PATH
local INDEX_URL = "http://mta/local/html/index.html"
local isReady = false
local renderWhenReady = nil

setDevelopmentMode(true, true)

local function readFile(path)
	local file = File(path)
	if not file then
		return false
	end
	local str = file:read(file.size)
	file:close()
	return str
end

function ScreenRender.start()
	ScreenManager.browser:loadURL(INDEX_URL)
	addEventHandler("onClientBrowserDocumentReady", ScreenManager.browser, function (url)
		if url == INDEX_URL then
			isReady = true
			local strings = exports.dpLang:getAllStrings()
			if strings then
				ScreenManager.browser:executeJavascript("Screens.passLocales('" .. toJSON(strings) .."');")	
			end	
			if renderWhenReady then
				ScreenRender.renderScreen(renderWhenReady)
				renderWhenReady = nil
			end			
		end
	end) 
end

function ScreenRender.renderScreen(name)
	if not isReady then
		renderWhenReady = name
		return false
	end
	if type(name) ~= "string" then
		return false
	end
	local data = {
		message = "Wherry" .. math.random(1000, 9999),
		users = {
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},		
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},	
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 1, name = "User1", score = 123},
			{id = 2, name = "User2", score = 124},
			{id = 3, name = "User3", score = 23},
			{id = 4, name = "User4", score = 121233},
			{id = 5, name = "User5", score = 125123},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},
			{id = 6, name = "User6", score = 121323},																				
		}
	}
	ScreenManager.browser:executeJavascript("Screens.load(\"" .. name .. "\", '" .. toJSON(data) .."');")
end