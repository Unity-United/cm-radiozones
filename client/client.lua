local QBCore = exports['qb-core']:GetCoreObject()
frequency = nil

CreateThread(function()
    for k, v in pairs(Config.RadioDeadZones) do
        exports["ps-zones"]:CreateCircleZone(v.name, v.coords, v.radius, {
            debugPoly = v.debug,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 1,
        })
    end
end)


RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
local plyState = LocalPlayer.state
frequency = plyState.radioChannel
    if frequency > 0 then
        exports ['pma-voice']:setRadioChannel(0)
     QBCore.Functions.Notify('Your radio has lost connection', 'error', 3000)
     TriggerEvent('InteractSound_CL:PlayOnOne', "monkeyopening", 0.3)
    end
    
 end)
 
 RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    exports ['pma-voice']:setRadioChannel(frequency)
     QBCore.Functions.Notify('Your radio has reconnected', 'success', 3000)
     TriggerEvent('InteractSound_CL:PlayOnOne', "monkeyopening", 0.3)
 end)
