local component     = require("component")
local bit32         = require("bit32")
local internet      = component.getPrimary("internet")
local term          = require("term")
local gpu           = term.gpu()
local event         = require("event")
local filesystem    = require("filesystem")
local width, height = gpu.getResolution()


local function download(url)
	local con = internet.request(url)
	local buf = ""
	local data = ""
	while data ~= nil do
		data = con.read(math.huge)
		if data ~= nil then
			buf = buf .. data
		end
	end
	con.close()
	return buf
end

function Install(url)
  if not component.internet then
    error("internet component not found")
  else

end

function CheckandInstall(userstr)
  if (userstr == "Tetris")
    Install("https://raw.githubusercontent.com/Minecon300/installer/main/tetris.lua")
  end
end
  
local userstr = ""
function keyPressed(event_name, player_uuid, ascii)
    local c = string.char(ascii)
    if c=='\n' then
        print(userstr)
        --CheckandInstall(userstr)
        userstr = ""
    else
        userstr=userstr..c
    end
    --stores keys typed by user and prints them as a string when you press enter
end

event.register("key_down", keyPressed)
