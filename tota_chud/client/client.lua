-- CORE

-- END CORE


-- CODE
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(20)
        local playerped = PlayerPedId()
        local inMenu = IsPauseMenuActive()
        local veh = GetVehiclePedIsIn(playerped)
        local hasKM = 0
        local matricula = GetVehicleNumberPlateText(veh)
        local ms = true

        if IsPedInAnyVehicle(playerped, false) and not inMenu then
            ms = false
            local valocidad = math.ceil(GetEntitySpeed(veh) * 3.6)
            local gasolina = math.ceil(GetVehicleFuelLevel(veh))
            local pos = GetEntityCoords(playerped)
            local coords = GetEntityCoords(PlayerPedId())
		    local zone = GetNameOfZone(coords.x, coords.y, coords.z)
            local zoneLabel = GetLabelText(zone)
            local function getFirst( var )
                return tonumber( tostring(var):sub( 1, -4) )
            end
            local var1, var2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			streetHash1 = GetStreetNameFromHashKey(var1)
			streetHash2 = GetStreetNameFromHashKey(var2)
            local vehBody = (GetVehicleEngineHealth(veh) /10)
            local vueltas = GetVehicleCurrentRpm(veh)
            local revoluciones = math.ceil(vueltas * 10000 - 2001, 2)
            SendNUIMessage({
                display = true,
                street = streetHash1 .. " | " ..  zoneLabel,
                speed = valocidad,
                engine = vehBody,
                gas = gasolina,
                kilometraje = revoluciones,
            })
            Citizen.Wait(20)
        else
            SendNUIMessage({
                display = false
            })
        end
        if ms then Citizen.Wait(1000) end
    end
end)
-- END CODE