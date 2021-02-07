Slife = nil

Citizen.CreateThread(function() 
    while Slife == nil do 
        TriggerEvent('Slife:GetObject', function(obj) Slife = obj end) 
        Citizen.Wait(0)
    end 
end)


function RoundNumber(num, numRoundNumber)
    local mult = 10^(numRoundNumber or 0)
    return math.floor(num * mult + 0.5) / mult
end



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(50)
        local jugador = GetPlayerPed(-1)
        if IsPedInAnyVehicle(jugador) then

            local vehiculo = GetVehiclePedIsUsing(jugador)
            local velo = (GetEntitySpeed(vehiculo)* 3.6) -- Relación con km/h http://www.kronzky.info/fivemwiki/index.php?title=GetEntitySpeed
            local gaso = (GetEntitySpeed(vehiculo)* 3.6)
            local marcha = GetVehicleCurrentGear(vehiculo)
            local rpm = (GetVehicleCurrentRpm(vehiculo)) *100 --5444
            local revoluciones = RoundNumber(rpm) --5444
            local vida = GetVehicleEngineHealth(vehiculo)
            local coche = IsPedSittingInAnyVehicle(jugador)

        
            Citizen.Wait(20)
            SendNUIMessage({
                coche = coche; 
                vel = velo; 
                gasolina = gaso;
                cuent = marcha;
                rpm = revoluciones;
                vida = vida;
            })
        else
            SendNUIMessage({
                coche = false;
            })
        end
    end
end)



-- Slife = nil

-- Citizen.CreateThread(function() 
--     while Slife == nil do 
--         TriggerEvent('Slife:GetObject', function(obj) Slife = obj end) 
--         Citizen.Wait(0)
--     end 
-- end)


-- function RoundNumber(num, numRoundNumber)
--     local mult = 10^(numRoundNumber or 0)
--     return math.floor(num * mult + 0.5) / mult
-- end

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(50)
--         local jugador = GetPlayerPed(-1)
--         if IsPedInAnyVehicle(jugador) then

--             local vehiculo = GetVehiclePedIsUsing(jugador)
--             local velo = (GetEntitySpeed(vehiculo)* 3.6) -- Relación con km/h http://www.kronzky.info/fivemwiki/index.php?title=GetEntitySpeed
--             local gaso = GetVehicleFuelLevel(vehiculo)
--             local marcha = GetVehicleCurrentGear(vehiculo)
--             local revoluciones = (RoundNumber(GetVehicleCurrentRpm(vehiculo), 3) *10000000000)
--             local vida = GetVehicleEngineHealth(vehiculo)
--             local coche = IsPedSittingInAnyVehicle(jugador)

        
--             Citizen.Wait(20)
--             SendNUIMessage({
--                 coche = coche; 
--                 vel = velo; 
--                 gasolina = gaso;
--                 cuent = marcha;
--                 rpm = revoluciones;
--                 vida = vida;
--             })
--         else
--             SendNUIMessage({
--                 coche = false;
--             })
--         end
--     end
-- end)