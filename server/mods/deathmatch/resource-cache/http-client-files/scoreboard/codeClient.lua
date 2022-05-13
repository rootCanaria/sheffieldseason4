local ekran = {guiGetScreenSize()}
local playerBarSize = {420,520}
local alpha = 0 
local alphaText = 0 
local alphaPercent = 0.5
local KepAlpha = 0  
local normalScoreGorget = 0 
local maxMegjelenit = 15 
local maxPlayers = 128
local onlinePlayers = {} 
local Tick = getTickCount()
local progress = "Linear"
local panelHeight = 0
local playerBarPos = {ekran[1]/2-playerBarSize[1]/2,ekran[2]/2-playerBarSize[2]/2} 
local font = dxCreateFont("files/Nagista FREE.ttf",9) 
local colornames = tocolor(255,255,255,255)
local showTab = false 
local testTEr = true


addEvent("receiveServerSlot",true) 
addEventHandler("receiveServerSlot",root,function(s)
	maxPlayers = s
end)


bindKey("tab", "down", 
	function() 
		if getElementData(localPlayer, "loggedin") then
			onlinePlayers = {}
			showTab = true
			showChat(true)
			testTEr = true
			Tick = getTickCount()
			progress = "Linear"
			playerBarPos = {ekran[1]/2-playerBarSize[1]/2,ekran[2]/2-playerBarSize[2]/2} 
		end
	end
)


bindKey("tab", "up", 
	function() 
		if getElementData(localPlayer, "loggedin") then	
			testTEr = false
			showChat(true)
			Tick = getTickCount()
			progress = "Linear"
			onlinePlayers = {}
		end
	end		
)
local Size1 = 0
local Size2 = 0


function renderScoreBoard()
	if not showTab then return end
	for k,v in ipairs(getElementsByType("player")) do
		onlinePlayers[k] = v
	end
	
		table.sort(onlinePlayers, function(a, b)
		if a ~= localPlayer and b ~= localPlayer and getElementData(a, "playerid") and getElementData(b, "playerid" ) then
			return tonumber(getElementData(a, "playerid") or 0) < tonumber(getElementData(b, "playerid") or 0)
		end
	end)
	if testTEr then 
		if alpha < 255*alphaPercent then
			alpha = alpha + ((255*alphaPercent)/100)*(alphaPercent*10)
			alphaText = alphaText + ((255*alphaPercent)/100)*(alphaPercent*10)
		else
			alpha = 255*alphaPercent
			alphaText = 255
		end
		KepAlpha = KepAlpha + 2.5 
		if KepAlpha >= 255 then 
			KepAlpha = 0
		end	
		
	elseif not testTEr then 
		if alpha >	0 then
			alpha = alpha - ((255*alphaPercent)/100)*(alphaPercent*10)
			if alphaText > 0 then 
				alphaText = alphaText - ((255*alphaPercent)/100)*(alphaPercent*10)
			elseif alphaText < 0 then 
				alphaText = 0
			end
		else
			alpha = 0
			alphaText = 0
			Anim = 3 
			testTEr = true
			showTab = false
			normalScoreGorget = 0
			onlinePlayers = {}
			maxPlayers = 0
		end
	end
	local elem = 0
	for l,value in ipairs(onlinePlayers) do	
		if (l > normalScoreGorget and elem < maxMegjelenit) then
			
			elem = elem + 1


			local myNameColor = ""

			if  getElementData(value,"loggedin") then
				myNameColor = "#4f4745"
				bgColor = tocolor(101, 101, 101,alphaText) --
			elseif not getElementData(value,"loggedin") then
				myNameColor = "#ffe900"
				bgColor = tocolor(0,0,0,alphaText)

			end
					if getElementData(value, "loggedin") == 0 then
			colornames = tocolor(101, 101, 101, alphaText)
			else
			colornames = tocolor(255,255,255,alphaText)
			end
			
			if getElementData(value, "duty_admin") == 1 and getElementData(value, "loggedin") ~= 0 then
			colornames = tocolor(255, 255, 255, alphaText)
			else
			if getElementData(value, "loggedin") ~= 0  then
			colornames = tocolor(255,255,255,alphaText)
			end
			end
			
			--<[ PING ]>--
			local ping = getPlayerPing(value)
			if getElementData(value,"loggedin") then 
				
			else
				ping = ""
			end
				
			local oyuncuID = getElementData(value,"playerid")
			local level = getElementData(value,"hoursplayed")
			local oyuncuAdi = getPlayerName(value):gsub("_"," ")

		if (getElementData(localPlayer, "duty_admin") == 1) then
		if getElementData(value,"account:username") then 
		 oyuncuAdi = ""..getPlayerName(value):gsub("_"," ").." ("..getElementData(value,"account:username")..")"
		else 
		
		end
		end
		
			dxDrawRectangle(playerBarPos[1]+5,playerBarPos[2]+30 + (elem * 30),playerBarSize[1]-10,25, tocolor(0, 0, 0,alpha)) 
			
			dxDrawText(oyuncuID,playerBarPos[1]+15,playerBarPos[2]+43 + (elem * 30),playerBarSize[1]+playerBarPos[1],playerBarPos[2]+43 + (elem * 30), tocolor(255, 255, 255, alphaText),1, font, "left", "center", false, false, true, true) 
			
			dxDrawText(oyuncuAdi,playerBarPos[1]+50,playerBarPos[2]+43 + (elem * 30),playerBarSize[1]+playerBarPos[1],playerBarPos[2]+43 + (elem * 30), colornames,1, font, "left", "center", false, false, true, true)
			
			dxDrawText(level,playerBarPos[1]+playerBarSize[1]-125,playerBarPos[2]+43 + (elem * 30),playerBarSize[1]+playerBarPos[1],playerBarPos[2]+43 + (elem * 30), tocolor(255, 255, 255, alphaText),1, font, "left", "center", false, false, true, true)
			
			dxDrawText(ping, playerBarPos[1]+playerBarSize[1]-50, playerBarPos[2]+43 + (elem * 30), playerBarSize[1]+playerBarPos[1], playerBarPos[2]+43 + (elem * 30), tocolor(255, 255, 255, alphaText),1, font, "left", "center", false, false, true, true) 
			
			dxDrawRectangle(playerBarPos[1], playerBarPos[2]+30 + (elem * 30), playerBarSize[1], 30, tocolor(0, 0, 0, alpha))
			

			dxDrawImage(playerBarPos[1]+playerBarSize[1]/2-80, playerBarPos[2]-130, 150, 150, "files/red.png",0,0,0, tocolor(255, 255, 255, KepAlpha))
			panelHeight = (elem * 30)
		end
	end
		dxDrawText("#ffe900Sheffield #FFFFFF - Roleplay                                  Scoreboard",playerBarPos[1]+5, playerBarPos[2]+5, playerBarSize[1], playerBarSize[2], tocolor(0, 143, 254, alphaText),1, font, "left", "top", false, false, true, true)  --221, 9, 9
		dxDrawText("#ffe900Online: #FFFFFF"..getOnlinePlayers().."/1024",playerBarPos[1]+playerBarSize[1]-100, playerBarPos[2]+5, playerBarSize[1], playerBarSize[2], tocolor(0, 143, 254, alphaText),1, font, "left", "top", false, false, true, true) 
		
		dxDrawRectangle(playerBarPos[1],playerBarPos[2] ,playerBarSize[1],25, tocolor(0, 0, 0,alpha+100)) 
		dxDrawRectangle(playerBarPos[1],playerBarPos[2]+25 ,playerBarSize[1],2, tocolor(221, 176,0,alpha+100)) 
	
		dxDrawRectangle(playerBarPos[1], playerBarPos[2], playerBarSize[1], 60, tocolor(0, 0, 0, alpha)) 

		dxDrawRectangle(playerBarPos[1]+5,playerBarPos[2]+30 ,playerBarSize[1]-10,25, tocolor(0, 0, 0,alpha))
		dxDrawText("ID         Name                                                                Hours                Ping",playerBarPos[1]+10, playerBarPos[2]+35, playerBarSize[1], playerBarSize[2], tocolor(221, 176, 0, alphaText),1, font, "left", "top", false, false, true, true)


end
addEventHandler("onClientRender", root, renderScoreBoard)


function getOnlinePlayers()
	return #getElementsByType("player")
end


bindKey("mouse_wheel_down", "down", 
	function() 
		if showTab then
			if normalScoreGorget < #onlinePlayers - maxMegjelenit then
				normalScoreGorget = normalScoreGorget + 1	
			end
		end
	end
)

bindKey("mouse_wheel_up", "down", 
	function() 
		if showTab then
			if normalScoreGorget > 0 then
				normalScoreGorget = normalScoreGorget - 1		
			end
		end
	end
)


function timeAdd()
	if not getElementData(getLocalPlayer(),"afk") then 
		if isTimer(timeAddTimer) then 
			killTimer(timeAddTimer)
		end
	end
		timeAddTimer = setTimer(timeAdd, 60*1000, 1)
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), function ()
	timeAddTimer = setTimer(timeAdd, 60*1000, 1)
end)


addEventHandler("onClientPlayerQuit", root, function() 
	if source then
		onlinePlayers = {}
	end
end)