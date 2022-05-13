local fireModel = 2023
local isFireOn = false

local fireTable = {
		--  { x, y, z, "Location", "Incident description", "special or regular", carID(or blank) }
		{ 2116.5451660156, -1790.5614013672, 14.370749473572, "Los Santos, Idlewood Pizza Stack", "هناك بعض الدخان يتصاعد من هذا الصندوق ، يبدو أنه سيشتعل!", "regular" },
		{ 1892.892578125,-1800.7572021484, 15.758026123047, "Los Santos, Old Idlewood Gas Station", "كان بعض الحمقى يلعبون بعلبة مزيل العرق وولاعة ، لقد أشعلوا النار !", "regular" },
		{ 1858.4833984375,-1454.541015625, 13.395030975342, "Los Santos, next to the Skate Park", "انحرفت شاحنة الصندوق هذه بعيدًا عن دراجة وتحطمت في الحائط ، وسيارته تدخن. الرجاء المساعدة!", "special", 414 },
		{ 1872.6904296875, -1597.5771484375, 16.140625, "Los Santos, Panopticon.", "هناك دخان قادم من المنزل ... تحققوا من هذا يا رفاق!" },
		{ 1706.869140625,-546.01953125,35.386379241943, "Red County, Interstate 25", "هناك دخان قادم من حديقة مقطورات ... قد ترغبون في التحقق من هذا يا رفاق!", 513 },
		{ 2499.7451171875,-1670.771484375,13.348224639893, "Los Santos, Grove Street", "جاءت عربة الكثبان الرملية هذه تتسابق في الشارع ثم انفجر المحرك ، وكان هناك الكثير من الدخان الأسود ويمكن أن ترى النار", "regular", 568 },
		{ 2713.423828125,-2049.33984375,13.4275598526, "Los Santos, South Street - Playa Del Seville, near Sun Street", "إحدى شاحناتنا غادرت للتو مصنع الكيماويات واشتعلت فيها النيران ، وهناك بعض المواد الكيميائية في تلك الشاحنة .. تعال بسرعة!", "special", 573 },
		{ 1873.32421875,-2497.193359375,13.5546875, "Los Santos International, Runway A!", "لدينا هبوط اضطراري ومحرك الطائرة معطل والمحرك على وشك الاشتعال! نحن بحاجة إلى محرك هنا بسرعة!", "regular", 577 },
		{  2295.1318359375, -1693.37109375, 13.517011642456, "The alleyway behind Ganton Gym!", "بعض الناس خرجوا للتو من الزقاق وهم يركضون. أستطيع أن أرى الدخان!, ", "regular", 516 },
		{  1961.8642578125, -1955.6796875, 13.751493453979, "El Corona train tracks", "أبلغ أحد قطاراتنا عن رائحة الدخان المنبعثة من أسفل القطار. نود أن يقوم شخص ما بفحصه قبل أن يتحول إلى شيء أسوأ.", "special", 538 },
		{  1021.109375, -1916.8505859375, 12.66853427887, "The market stalls South of the DMV.", "قام شخص ما بخلع الشواية وإشعال الكشك ، النار ليست ضخمة ، لكن ليس لدينا ما نطفئها!", "regular", },
		{  1769.9755859375, -1748.044921875, 13.555773735046, "Los Santos, White ST..", "بعض الأطفال فقط أشعلوا النار في بعض القمامة ، وانتشرت في الأشجار.", "regular", },
		{  1758.3310546875, -1710.2021484375, 13.51858997345, "Los Santos, White ST..", "حريق !.", "regular", },
		{  2346.1953125, -1170.5419921875, 28.070589065552, "East Broadway.", "حريق البون فاير أخطأ ، انتشر في الكوخ الخشبي.", "regular", },
		{  1874.126953125, -1313.33203125, 14.500373840332, "The construction site on the Northern side of the Skate Park.", "لهيكل.", "regular", 524 },
		{ 2116.5451660156, -1790.5614013672, 14.370749473572, "Los Santos, Idlewood Pizza Stack", "هنا بعض الدخان يتصاعد من هذا الصندوق ، يبدو أنه سيشتعل!", "regular", },
		{ 1892.892578125, -1800.7572021484, 15.758026123047, "Los Santos, Old Idlewood Gas Station", "كان بعض الحمقى يلعبون بعلبة مزيل العرق وولاعة ، لقد أشعلوا النار في هذا التخطي!", "regular", },
		{ 1858.4833984375, -1454.541015625, 13.395030975342, "Los Santos, next to the Skate Park", "انحرفت شاحنة الصندوق هذه بعيدًا عن دراجة وتحطمت في الحائط ، وسيارته تدخن. الرجاء المساعدة!", "special", 414 },
		{ -76.41796875, -1593.662109375, 2.6171875, "Flint Intersection, trailer park LS South-West.", "هناك دخان قادم من حديقة مقطورات ... قد ترغبون في التحقق من هذا يا رفاق!" },
		{ 1100.67578125, -1400.60546875, 13.435691833496, "Los Santos, Pasadena ST", "هذه الطائرة هبطت للتو على الطريق السريع ، محركها بدأ يدخن!", "regular", 513 },
		{ 2499.7451171875, -1670.771484375, 13.348224639893, "Los Santos, Grove Street", "جاءت عربة الكثبان الرملية هذه تتسابق في الشارع ثم انفجر المحرك ، وكان هناك الكثير من الدخان الأسود ويمكن أن ترى النار", "regular", 568 },
		{ 2713.423828125, -2049.33984375, 13.4275598526, "Los Santos, South Street - Playa Del Seville, near Sun Street", "إحدى شاحناتنا غادرت للتو مصنع الكيماويات واشتعلت فيها النيران ، وهناك بعض المواد الكيميائية في تلك الشاحنة .. تعال بسرعة!", "special", 573 },
		{ 1873.32421875, -2497.193359375, 13.5546875, "Los Santos International, Runway A!", "لدينا هبوط اضطراري ومحرك الطائرة معطل والمحرك على وشك الاشتعال! نحن بحاجة إلى محرك هنا بسرعة!", "regular", 577 },
		{ 949.349609375, -1103.1376953125, 24.07465171814, "Los Santos , Liberty Ave", "هناك سيارة تدخن ، وربما تشتعل فيها النيران!", "regular", 401 },
		{ 2070.79296875, -1795.1337890625, 13.55327796936, "Los Santos, Washington St!", "نحاول إخماده وهو لا يعمل! إنهم مشتعلون!" },
		{ -76.41796875, -1593.662109375, 2.6171875, "Flint Intersection, trailer park LS South-West.", "هناك دخان قادم من حديقة مقطورات ... قد ترغبون في التحقق من هذا يا رفاق!" },
		{ 2101.9990234375, -1416.3076171875, 23.995027542114, "East Los Santos, Gyantanamo - Hospital!!", "لست متأكدًا ، لكن الأمر يستحق التحقق منه! هناك الكثير من الدخان يتصاعد من هناك!", "special", 410 },
		{ 2626.9677734375, -846.2607421875, 84.179885864258, "North Rock, by a shack on the hill!", "هناك شجرة تحترق, تباً لشمس سان اندرياس!" },
		{ 2859.03515625, -598.166015625, 10.928389549255, "Interstate 425 East, by the highway.", "السيارة تبدو متضررة بشدة ، تدخن ، وهناك حريق بجانبها! عجل!", "regular", 420 },
		{ 392.51171875, -1924.5078125, 10.25, "Santa Monica Pier.", "اشتعلت النيران في أحد المباني الخشبية!", "special" },
		{ 1971.1845703125, -2084.765625, 13.554307937622, "Los Santos, Gates ST.", "لست متأكدًا مما أصاب الخزان ، لكنني أشعر بنيران ستنطلق قريبًا!", "regular", 403 },
		{ 1490.6257324219, -1583.3851318359, 16.216003417969, "Los Santos, Central Ave.", "لست متأكدًا مما أصاب الخزان ، لكنني أشعر بنيران ستنطلق قريبًا!", "regular", 403 },
		{ 1368.8466796875, -291.900390625, 1.7080450057983, "Mulholland canal!", "مقشدة تحطمت للتو هنا على الشاطئ!", "regular", 460 },
}

function loadthescript()
    outputDebugString("LeFire Script loaded ...")
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadthescript)

function fdfire()
    math.randomseed(getTickCount())
    local randomfire = math.random(1,#fireTable)
    local fX, fY, fZ = fireTable[randomfire][1],fireTable[randomfire][2],fireTable[randomfire][3]
            local playersOnFireTeam = exports.factions:getPlayersInFaction(2)
            for k, v in ipairs (playersOnFireTeam) do
                outputChatBox("[RADIO] This is dispatch. We received an anonymous call regarding a major incident.",v,245, 40, 135)
				outputChatBox("[RADIO] Incident is as follow: "..fireTable[randomfire][5],v,245, 40, 135)
                outputChatBox("[RADIO] Location: "..fireTable[randomfire][4].." Please report there immediately. We added a blip on your GPS.",v,245, 40, 135)
            end

            -- You can get table info like this below, i set the variable above to make it shorter to call from.
            --outputDebugString("x:"..fireTable[randomfire][1].." y:"..fireTable[randomfire][2].." z:"..fireTable[randomfire][3])
			if (fireTable[randomfire][7]) then
				local fireveh = createVehicle(fireTable[randomfire][7], fX, fY, fZ)
				setTimer( function ()
					destroyElement(fireveh)
				end, 1800000, 1)
				blowVehicle(fireveh)
			end
			if (fireTable[randomfire][6] == "special") then
				local fireElem1 = createObject(fireModel,fX+2,fY+2,fZ)
				setElementCollisionsEnabled(fireElem,false)
				local col1 = createColSphere(fX+2,fY+2,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem1)
					destroyElement(col1)
				end, 420000, 1)

				local fireElem2 = createObject(fireModel,fX+4,fY+4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col2 = createColSphere(fX+4,fY+4,fZ+2,2)
				setTimer ( function ()
					destroyElement(fireElem2)
					destroyElement(col2)
				end, 420000, 1)

				local fireElem3 = createObject(fireModel,fX-2,fY-2,fZ)
				setElementCollisionsEnabled(fireElem,false)
				local col3 = createColSphere(fX-2,fY-2,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem3)
					destroyElement(col3)
				end, 420000, 1)

				local fireElem4 = createObject(fireModel,fX-4,fY-4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col4 = createColSphere(fX-4,fY-4,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem4)
					destroyElement(col4)
				end, 420000, 1)

				local fireElem5 = createObject(fireModel,fX,fY-4,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col5 = createColSphere(fX,fY-4,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem5)
					destroyElement(col5)
				end, 420000, 1)

				local fireElem6 = createObject(fireModel,fX-4,fY,fZ+2)
				setElementCollisionsEnabled(fireElem,false)
				local col6 = createColSphere(fX-4,fY,fZ+1,2)
				setTimer ( function ()
					destroyElement(fireElem6)
					destroyElement(col6)
				end, 420000, 1)
			end
            outputDebugString(fX.." "..fY.." "..fZ)
			-- Fire sync
			local fireElem = createObject(fireModel,fX,fY,fZ)
			setElementCollisionsEnabled(fireElem,false)
			local col = createColSphere(fX,fY,fZ+1,2)
			setTimer ( function ()
				destroyElement(fireElem)
				destroyElement(col)
			end, 420000, 1)


            triggerClientEvent("startTheFire", getRootElement(),fX,fY,fZ)
            local blip = createBlip(fX,fY,fZ, 43, 0, 0, 0, 255)
            setTimer ( function ()
                destroyElement(blip)
            end, 900000, 1)

			isFireOn = true
			setTimer ( function ()
				isFireOn = false
			end, 900000, 1)
end

-- /randomfire - Start a random fire from the table
function randomfire (thePlayer)
	if ( exports.integration:isPlayerTrialAdmin ( thePlayer ) ) then
		outputDebugString(isFireOn)
		if (isFireOn) then
			outputChatBox ("AdmCMD: There is already a fire. Use /cancelfire or wait 30 minutes.", thePlayer,255,0,0)
		else
			fdfire()
			outputChatBox ("AdmCMD: You have random triggered a fire for FD!", thePlayer,255,0,0)
			outputChatBox ("AdmCMD: Type /cancelfire to cancel it!", thePlayer,255,0,0)
		end
	end
end
addCommandHandler("randomfire", randomfire)

-- /cancelfire - Stops the whole fire process (restarts the resource)
function cancelrandomfire (thePlayer)
	if ( exports.integration:isPlayerTrialAdmin ( thePlayer ) ) then
		outputDebugString(isFireOn)
		if (isFireOn) then
			local thisResource = getThisResource()
			outputChatBox ("AdmCMD: You have stopped the random fire for FD!", thePlayer,255,0,0)
			outputChatBox ("AdmCMD: It may take up to five minutes before it is fully cancelled.", thePlayer,255,0,0)
			restartResource(thisResource)
			isFireOn = false
		else
			outputChatBox ("AdmCMD: There is no fire started. Use /randomfire to start it.", thePlayer,255,0,0)
		end
	end
end
addCommandHandler("cancelfire", cancelrandomfire)
