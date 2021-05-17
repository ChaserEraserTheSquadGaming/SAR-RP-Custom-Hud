-- Made by Zua @ https://github.com/thatziv/z-speedometer -- Discord: http://zavaar.cf/discord

-----------------------------USER--CONFIG-----------------------------------------------
local locationOnscreen = 'middle-bottom' --[[ Types -> 'bottom-left', 'bottom-right', 'top-right' of the screen ]]
local legalSpeed = 65 -- This speed limit will trigger red number and the warning speed message
local mph = true -- change to false if you want KPH and Make sure you change the type var to 'kph' in case you made mph = false 
local type = 'MPH'
local typeFont = 'default' --[[ Types -> 'default': The best one, 'fancy' : Cursive and looks likes pure shit but the fivem community has shit taste so i left it here for you shitters, 'normal': fancy, but not cursive and also looks like poop ]]
local warningSpeedMsg = false --This meessage will stay for ~10-15 seconds when past the speed limit (legalspeed)
local warningSpeedMsgSTRING = "Warning: ~w~You are above the speed limit."
local RichPresence = true -- Makes a discord rich presence with Fivem that tells the speed
----------------------------------------------------------------------------------------
if(locationOnscreen == 'bottom-right') then
    x1 = 0.9
    y1 = 0.87
    x2 = 0.9
    y2 = 0.83
elseif(locationOnscreen == 'bottom-left') then
    x1 = 0.016
    y1 = 0.843
    x2 = 0.016
    y2 = 0.803
elseif(locationOnscreen == 'top-right') then
    x1 = 0.915
    y1 = 0.104
    x2 = 0.915
    y2 = 0.065
elseif(locationOnscreen == 'middle-bottom') then
    x1 = 0.175
    y1 = 0.865
    x2 = 0.2
    y2 = 0.865
end

if(typeFont == 'fancy') then
    font = 1
elseif(typeFont == 'default') then
    font = 2
elseif(typeFont == 'normal') then
    font = 0
end
function onScreen(content) -- The speed integer itself
        SetTextFont(font)
        SetTextProportional(0)
        SetTextScale(0.69, 0.69)
        SetTextEntry("STRING")
        AddTextComponentString(content)
        DrawText(x1, y1)
end

function unScreen(content) -- the MPH or KPH string (above the int)
		SetTextFont(font)
        SetTextScale(0.7, 0.7)
		SetTextEntry("STRING")
		AddTextComponentString(content)
        DrawText(x2, y2)
end

function notify(string)
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
end

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        local spd = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*2.2369
        if(mph == true)then
            local spd = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*2.2369
        else
            local spd = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6
        end
            if(IsPedInAnyVehicle(GetPlayerPed(-1), false))
            then
		local playerloc = GetEntityCoords(GetPlayerPed(-1))
	        local streethash = GetStreetNameAtCoord(playerloc.x, playerloc.y, playerloc.z)
        	street = GetStreetNameFromHashKey(streethash)
		
		if street == "Joshua Rd" then
                legalSpeed = 55
            elseif street == "East Joshua Road" then
                legalSpeed = 50
            elseif street == "Marina Dr" then
                legalSpeed = 35
            elseif street == "Alhambra Dr" then
                legalSpeed = 35
            elseif street == "Niland Ave" then
                legalSpeed = 35
            elseif street == "Zancudo Ave" then
                legalSpeed = 35
            elseif street == "Armadillo Ave" then
                legalSpeed = 35
            elseif street == "Algonquin Blvd" then
                legalSpeed = 35
            elseif street == "Mountain View Dr" then
                legalSpeed = 35
            elseif street == "Cholla Springs Ave" then
                legalSpeed = 35
            elseif street == "Panorama Dr" then
                legalSpeed = 40
            elseif street == "Lesbos Ln" then
                legalSpeed = 35
            elseif street == "Calafia Rd" then
                legalSpeed = 30
            elseif street == "North Calafia Way" then
                legalSpeed = 30
            elseif street == "Cassidy Trail" then
                legalSpeed = 25
            elseif street == "Seaview Rd" then
                legalSpeed = 35
            elseif street == "Grapeseed Main St" then
                legalSpeed = 35
            elseif street == "Grapeseed Ave" then
                legalSpeed = 35
            elseif street == "Joad Ln" then
                legalSpeed = 35
            elseif street == "Union Rd" then
                legalSpeed = 40
            elseif street == "O'Neil Way" then
                legalSpeed = 25
            elseif street == "Senora Fwy" then
                legalSpeed = 65
            elseif street == "Catfish View" then
                legalSpeed = 35
            elseif street == "Great Ocean Hwy" then
                legalSpeed = 60
            elseif street == "Paleto Blvd" then
                legalSpeed = 35
            elseif street == "Duluoz Ave" then
                legalSpeed = 35
            elseif street == "Procopio Dr" then
                legalSpeed = 35
            elseif street == "Cascabel Ave" then
                legalSpeed = 30
            elseif street == "Procopio Promenade" then
                legalSpeed = 25
            elseif street == "Pyrite Ave" then
                legalSpeed = 30
            elseif street == "Fort Zancudo Approach Rd" then
                legalSpeed = 25
            elseif street == "Barbareno Rd" then
                legalSpeed = 30
            elseif street == "Ineseno Road" then
                legalSpeed = 30
            elseif street == "West Eclipse Blvd" then
                legalSpeed = 35
            elseif street == "Playa Vista" then
                legalSpeed = 30
            elseif street == "Bay City Ave" then
                legalSpeed = 30
            elseif street == "Del Perro Fwy" then
                legalSpeed = 65
            elseif street == "Equality Way" then
                legalSpeed = 30
            elseif street == "Red Desert Ave" then
                legalSpeed = 30
            elseif street == "Magellan Ave" then
                legalSpeed = 25
            elseif street == "Sandcastle Way" then
                legalSpeed = 30
            elseif street == "Vespucci Blvd" then
                legalSpeed = 40
            elseif street == "Prosperity St" then
                legalSpeed = 30
            elseif street == "San Andreas Ave" then
                legalSpeed = 40
            elseif street == "North Rockford Dr" then
                legalSpeed = 35
            elseif street == "South Rockford Dr" then
                legalSpeed = 35
            elseif street == "Marathon Ave" then
                legalSpeed = 30
            elseif street == "Boulevard Del Perro" then
                legalSpeed = 35
            elseif street == "Cougar Ave" then
                legalSpeed = 30
            elseif street == "Liberty St" then
                legalSpeed = 30
            elseif street == "Bay City Incline" then
                legalSpeed = 40
            elseif street == "Conquistador St" then
                legalSpeed = 25
            elseif street == "Cortes St" then
                legalSpeed = 25
            elseif street == "Vitus St" then
                legalSpeed = 25
            elseif street == "Aguja St" then
                legalSpeed = 25
            elseif street == "Goma St" then
                legalSpeed = 25
            elseif street == "Melanoma St" then
                legalSpeed = 25
            elseif street == "Palomino Ave" then
                legalSpeed = 35
            elseif street == "Invention Ct" then
                legalSpeed = 25
            elseif street == "Imagination Ct" then
                legalSpeed = 25
            elseif street == "Rub St" then
                legalSpeed = 25
            elseif street == "Tug St" then
                legalSpeed = 25
            elseif street == "Ginger St" then
                legalSpeed = 30
            elseif street == "Lindsay Circus" then
                legalSpeed = 30
            elseif street == "Calais Ave" then
                legalSpeed = 35
            elseif street == "Adam's Apple Blvd" then
                legalSpeed = 40
            elseif street == "Alta St" then
                legalSpeed = 40
            elseif street == "Integrity Way" then
                legalSpeed = 30
            elseif street == "Swiss St" then
                legalSpeed = 30
            elseif street == "Strawberry Ave" then
                legalSpeed = 40
            elseif street == "Capital Blvd" then
                legalSpeed = 30
            elseif street == "Crusade Rd" then
                legalSpeed = 30
            elseif street == "Innocence Blvd" then
                legalSpeed = 40
            elseif street == "Davis Ave" then
                legalSpeed = 40
            elseif street == "Little Bighorn Ave" then
                legalSpeed = 35
            elseif street == "Roy Lowenstein Blvd" then
                legalSpeed = 35
            elseif street == "Jamestown St" then
                legalSpeed = 30
            elseif street == "Carson Ave" then
                legalSpeed = 35
            elseif street == "Grove St" then
                legalSpeed = 30
            elseif street == "Brouge Ave" then
                legalSpeed = 30
            elseif street == "Covenant Ave" then
                legalSpeed = 30
            elseif street == "Dutch London St" then
                legalSpeed = 40
            elseif street == "Signal St" then
                legalSpeed = 30
            elseif street == "Elysian Fields Fwy" then
                legalSpeed = 50
            elseif street == "Plaice Pl" then
                legalSpeed = 30
            elseif street == "Chum St" then
                legalSpeed = 40
            elseif street == "Chupacabra St" then
                legalSpeed = 30
            elseif street == "Miriam Turner Overpass" then
                legalSpeed = 30
            elseif street == "Autopia Pkwy" then
                legalSpeed = 35
            elseif street == "Exceptionalists Way" then
                legalSpeed = 35
            elseif street == "La Puerta Fwy" then
                legalSpeed = 60
            elseif street == "New Empire Way" then
                legalSpeed = 30
            elseif street == "Runway1" then
                legalSpeed = "--"
            elseif street == "Greenwich Pkwy" then
                legalSpeed = 35
            elseif street == "Kortz Dr" then
                legalSpeed = 30
            elseif street == "Banham Canyon Dr" then
                legalSpeed = 40
            elseif street == "Buen Vino Rd" then
                legalSpeed = 40
            elseif street == "Route 68" then
                legalSpeed = 55
            elseif street == "Zancudo Grande Valley" then
                legalSpeed = 40
            elseif street == "Zancudo Barranca" then
                legalSpeed = 40
            elseif street == "Galileo Rd" then
                legalSpeed = 40
            elseif street == "Mt Vinewood Dr" then
                legalSpeed = 40
            elseif street == "Marlowe Dr" then
                legalSpeed = 40
            elseif street == "Milton Rd" then
                legalSpeed = 35
            elseif street == "Kimble Hill Dr" then
                legalSpeed = 35
            elseif street == "Normandy Dr" then
                legalSpeed = 35
            elseif street == "Hillcrest Ave" then
                legalSpeed = 35
            elseif street == "Hillcrest Ridge Access Rd" then
                legalSpeed = 35
            elseif street == "North Sheldon Ave" then
                legalSpeed = 35
            elseif street == "Lake Vinewood Dr" then
                legalSpeed = 35
            elseif street == "Lake Vinewood Est" then
                legalSpeed = 35
            elseif street == "Baytree Canyon Rd" then
                legalSpeed = 40
            elseif street == "North Conker Ave" then
                legalSpeed = 35
            elseif street == "Wild Oats Dr" then
                legalSpeed = 35
            elseif street == "Whispymound Dr" then
                legalSpeed = 35
            elseif street == "Didion Dr" then
                legalSpeed = 35
            elseif street == "Cox Way" then
                legalSpeed = 35
            elseif street == "Picture Perfect Drive" then
                legalSpeed = 35
            elseif street == "South Mo Milton Dr" then
                legalSpeed = 35
            elseif street == "Cockingend Dr" then
                legalSpeed = 35
            elseif street == "Mad Wayne Thunder Dr" then
                legalSpeed = 35
            elseif street == "Hangman Ave" then
                legalSpeed = 35
            elseif street == "Dunstable Ln" then
                legalSpeed = 35
            elseif street == "Dunstable Dr" then
                legalSpeed = 35
            elseif street == "Greenwich Way" then
                legalSpeed = 35
            elseif street == "Greenwich Pl" then
                legalSpeed = 35
            elseif street == "Hardy Way" then
                legalSpeed = 35
            elseif street == "Richman St" then
                legalSpeed = 35
            elseif street == "Ace Jones Dr" then
                legalSpeed = 35
            elseif street == "Los Santos Freeway" then
                legalSpeed = 65
            elseif street == "Senora Rd" then
                legalSpeed = 40
            elseif street == "Nowhere Rd" then
                legalSpeed = 25
            elseif street == "Smoke Tree Rd" then
                legalSpeed = 25
            elseif street == "Cholla Rd" then
                legalSpeed = 35
            elseif street == "Cat-Claw Ave" then
                legalSpeed = 25
            elseif street == "Senora Way" then
                legalSpeed = 40
            elseif street == "Palomino Fwy" then
                legalSpeed = 60
            elseif street == "Shank St" then
                legalSpeed = 25
            elseif street == "Macdonald St" then
                legalSpeed = 35
            elseif street == "Route 68 Approach" then
                legalSpeed = 55
            elseif street == "Vinewood Park Dr" then
                legalSpeed = 35
            elseif street == "Vinewood Blvd" then
                legalSpeed = 40
            elseif street == "Mirror Park Blvd" then
                legalSpeed = 35
            elseif street == "Glory Way" then
                legalSpeed = 35
            elseif street == "Bridge St" then
                legalSpeed = 35
            elseif street == "West Mirror Drive" then
                legalSpeed = 35
            elseif street == "Nikola Ave" then
                legalSpeed = 35
            elseif street == "East Mirror Dr" then
                legalSpeed = 35
            elseif street == "Nikola Pl" then
                legalSpeed = 25
            elseif street == "Mirror Pl" then
                legalSpeed = 35
            elseif street == "El Rancho Blvd" then
                legalSpeed = 40
            elseif street == "Olympic Fwy" then
                legalSpeed = 60
            elseif street == "Fudge Ln" then
                legalSpeed = 25
            elseif street == "Amarillo Vista" then
                legalSpeed = 25
            elseif street == "Labor Pl" then
                legalSpeed = 35
            elseif street == "El Burro Blvd" then
                legalSpeed = 35
            elseif street == "Sustancia Rd" then
                legalSpeed = 45
            elseif street == "South Shambles St" then
                legalSpeed = 30
            elseif street == "Hanger Way" then
                legalSpeed = 30
            elseif street == "Orchardville Ave" then
                legalSpeed = 30
            elseif street == "Popular St" then
                legalSpeed = 40
            elseif street == "Buccaneer Way" then
                legalSpeed = 45
            elseif street == "Abattoir Ave" then
                legalSpeed = 35
            elseif street == "Voodoo Place" then
                legalSpeed = 30
            elseif street == "Mutiny Rd" then
                legalSpeed = 35
            elseif street == "South Arsenal St" then
                legalSpeed = 35
            elseif street == "Forum Dr" then
                legalSpeed = 35
            elseif street == "Morningwood Blvd" then
                legalSpeed = 35
            elseif street == "Dorset Dr" then
                legalSpeed = 40
            elseif street == "Caesars Place" then
                legalSpeed = 25
            elseif street == "Spanish Ave" then
                legalSpeed = 30
            elseif street == "Portola Dr" then
                legalSpeed = 30
            elseif street == "Edwood Way" then
                legalSpeed = 25
            elseif street == "San Vitus Blvd" then
                legalSpeed = 40
            elseif street == "Eclipse Blvd" then
                legalSpeed = 35
            elseif street == "Gentry Lane" then
                legalSpeed = 30
            elseif street == "Las Lagunas Blvd" then
                legalSpeed = 40
            elseif street == "Power St" then
                legalSpeed = 40
            elseif street == "Mt Haan Rd" then
                legalSpeed = 40
            elseif street == "Elgin Ave" then
                legalSpeed = 40
            elseif street == "Hawick Ave" then
                legalSpeed = 35
            elseif street == "Meteor St" then
                legalSpeed = 30
            elseif street == "Alta Pl" then
                legalSpeed = 30
            elseif street == "Occupation Ave" then
                legalSpeed = 35
            elseif street == "Carcer Way" then
                legalSpeed = 40
            elseif street == "Eastbourne Way" then
                legalSpeed = 30
            elseif street == "Rockford Dr" then
                legalSpeed = 35
            elseif street == "Abe Milton Pkwy" then
                legalSpeed = 35
            elseif street == "Laguna Pl" then
                legalSpeed = 30
            elseif street == "Sinners Passage" then
                legalSpeed = 30
            elseif street == "Atlee St" then
                legalSpeed = 30
            elseif street == "Sinner St" then
                legalSpeed = 30
            elseif street == "Supply St" then
                legalSpeed = 30
            elseif street == "Amarillo Way" then
                legalSpeed = 35
            elseif street == "Tower Way" then
                legalSpeed = 35
            elseif street == "Decker St" then
                legalSpeed = 35
            elseif street == "Tackle St" then
                legalSpeed = 25
            elseif street == "Low Power St" then
                legalSpeed = 35
            elseif street == "Clinton Ave" then
                legalSpeed = 35
            elseif street == "Fenwell Pl" then
                legalSpeed = 35
            elseif street == "Utopia Gardens" then
                legalSpeed = 25
            elseif street == "Cavalry Blvd" then
                legalSpeed = 35
            elseif street == "South Boulevard Del Perro" then
                legalSpeed = 35
            elseif street == "Americano Way" then
                legalSpeed = 25
            elseif street == "Sam Austin Dr" then
                legalSpeed = 25
            elseif street == "East Galileo Ave" then
                legalSpeed = 35
            elseif street == "Galileo Park" then
                legalSpeed = 35
            elseif street == "West Galileo Ave" then
                legalSpeed = 35
            elseif street == "Tongva Dr" then
                legalSpeed = 40
            elseif street == "Zancudo Rd" then
                legalSpeed = 35
            elseif street == "Movie Star Way" then
                legalSpeed = 35
            elseif street == "Heritage Way" then
                legalSpeed = 35
            elseif street == "Perth St" then
                legalSpeed = 25
            elseif street == "Chianski Passage" then
                legalSpeed = 30
			elseif street == "Lolita Ave" then
				legalSpeed = 35
			elseif street == "Meringue Ln" then
				legalSpeed = 35
		end


		if(RichPresence == true) then
                    SetRichPresence("Going " .. math.ceil(spd) .. " " .. type)
                elseif (RichPresence == false) then
                    SetRichPresence(nil)
                end
                if(spd > legalSpeed)then
                    onScreen("~r~" .. math.ceil(spd))
                        if(warningSpeedMsg == true)then
                            notify("~r~".. warningSpeedMsgSTRING)
                        end
                end
                if(spd < legalSpeed)then
                    onScreen("~g~" .. math.ceil(spd))
                 end
                 unScreen( type )
          
        end
--[[          if IsControlJustReleased(1,  38) then
            notify("~r~U ded")
            SetEntityHealth(PlayerPedId(), 0)
        end   ]]
    end
end)

