local Garages = {}
local alreadyTeleported = false

RegisterNetEvent("antiLimbo:receiveConfig")
AddEventHandler("antiLimbo:receiveConfig", function(config)
    Garages = config.Garages
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)

        local playerPed = PlayerPedId()
        if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
            local playerCoords = GetEntityCoords(playerPed)

            if playerCoords.z < -50.0 and not alreadyTeleported then
                alreadyTeleported = true

                local vehicle = GetVehiclePedIsIn(playerPed, false)
                if vehicle ~= 0 then
                    local driver = GetPedInVehicleSeat(vehicle, -1)
                    if driver == playerPed or IsPedInAnyVehicle(playerPed, false) then
                        TriggerServerEvent("antiLimbo:deleteVehicle", VehToNet(vehicle))
                    end
                end

                local safeCoords = GetClosestGarage(playerCoords)

                SetEntityCoords(playerPed, safeCoords.x, safeCoords.y, safeCoords.z, false, false, false, false)

                TriggerServerEvent("antiLimbo:logDiscord", GetPlayerName(PlayerId()), safeCoords)

                ShowNotification("🚀 Você foi salvo do limbo! Foi levado à garagem mais próxima! Pode retirar seu veículo!")

            elseif playerCoords.z > -50.0 and alreadyTeleported then
                alreadyTeleported = false
            end
        end
    end
end)

-- Função para encontrar a garagem mais próxima
function GetClosestGarage(playerCoords)
    local closestGarage = Garages[1]
    local shortestDistance = #(playerCoords - closestGarage.coords)

    for _, garage in ipairs(Garages) do
        local distance = #(playerCoords - garage.coords)

        if distance < shortestDistance then
            closestGarage = garage
            shortestDistance = distance
        end
    end

    return closestGarage.coords
end

-- Função para mostrar a notificação nativa do FiveM
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, true)
end

TriggerServerEvent("antiLimbo:requestConfig")
