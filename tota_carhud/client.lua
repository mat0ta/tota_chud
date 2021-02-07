Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerped = GetPlayerPed(-1)
        local inMenu = IsPauseMenuActive()
    
        if IsPedInAnyVehicle(playerped, false) and not inMenu then
            Citizen.Wait(20)
            local years, months, days, hours, minutes, seconds = Citizen.InvokeNative(0x50C7A99057A69748, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
            local veh = GetVehiclePedIsIn(playerped)
            local VehicleSpeed = math.ceil(GetEntitySpeed(veh) * 3.6)
            local VehicleGasoline = math.ceil(GetVehicleFuelLevel(veh))
            local vueltas = GetVehicleCurrentRpm(veh)
            local revoluciones = math.ceil(vueltas * 10000 - 2001, 2)
            local pos = GetEntityCoords(playerped)
            local street1, street2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
            local vehBody = (GetVehicleEngineHealth(veh) /10)
            SendNUIMessage({
                display = true,
                speed = VehicleSpeed,
                gasoline = VehicleGasoline,
                hours = hours,
                minutes = minutes,
                rpm = revoluciones,
                body = vehBody,
                street1 = GetStreetNameFromHashKey(street1),
                street2 = GetStreetNameFromHashKey(street2),
            })
            Citizen.Wait(20)
        else
            SendNUIMessage({
                display = false
            })
        end
    end
end)