Config = Config or {}
Config.DiscordWebhook = ""
Config.Garages = {
    { name = "Los Santos", coords = vector3(215.124, -791.377, 30.946) },
    { name = "Centro", coords = vector3(-340.965, -874.885, 31.083) },
    { name = "Sandy Shores", coords = vector3(1174.76, 2635.92, 37.75) },
    { name = "Paleto Bay", coords = vector3(-773.34, 5594.43, 33.60) }
}


RegisterNetEvent("antiLimbo:requestConfig")
AddEventHandler("antiLimbo:requestConfig", function()
    TriggerClientEvent("antiLimbo:receiveConfig", source, Config)
end)


RegisterNetEvent("antiLimbo:deleteVehicle")
AddEventHandler("antiLimbo:deleteVehicle", function(vehicleNetId)
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
    if DoesEntityExist(vehicle) then
        DeleteEntity(vehicle)
    end
end)

RegisterNetEvent("antiLimbo:logDiscord")
AddEventHandler("antiLimbo:logDiscord", function(playerName, location)
    if location and location.x and location.y and location.z then
        local locationName = "Desconhecido"
        
        for _, garage in ipairs(Config.Garages) do
            local distance = CalculateDistance(location, garage.coords)
            
            if distance < 50.0 then
                locationName = garage.name
                break
            end
        end

        local message = {
            {
                ["color"] = 16711680,
                ["title"] = "🚨 Jogador salvo do limbo! 🚨",
                ["description"] = "**Nome:** " .. playerName .. 
                    "\n**Local de Spawn:** " .. locationName,
                ["footer"] = {
                    ["text"] = os.date("%d/%m/%Y %X")
                }
            }
        }

        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, "POST", json.encode({username = "Anti-Limbo", embeds = message}), {["Content-Type"] = "application/json"})
    else
        print("Erro: Localização inválida para o jogador " .. playerName)
    end
end)

function CalculateDistance(coords1, coords2)
    local dx = coords2.x - coords1.x
    local dy = coords2.y - coords1.y
    local dz = coords2.z - coords1.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end
