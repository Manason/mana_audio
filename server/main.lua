---@param src number
---@param data PlaySoundParams
local function playSound(src, data)
    TriggerClientEvent('mana_audio:client:playSound', src, data)
end

exports('PlaySound', playSound)

RegisterNetEvent('mana_audio:server:playSound', function(data)
    playSound(-1, data)
end)

--- from entity

local function playSoundFromEntity(data)
    TriggerClientEvent('mana_audio:client:playSoundFromEntity', -1, {
        audioBank = data.audioBank,
        audioName = data.audioName,
        audioRef = data.audioRef,
        netId = data.netId or NetworkGetNetworkIdFromEntity(data.entity),
    })
end

---@param data PlaySoundFromEntityParams
exports('PlaySoundFromEntity', playSoundFromEntity)

RegisterNetEvent('mana_audio:server:playSoundFromEntity', function(data)
    playSoundFromEntity({
        audioBank = data.audioBank,
        audioName = data.audioName,
        audioRef = data.audioRef,
        netId = data.netId
    })
end)

--- from coords

local function playSoundFromCoords(data)
    TriggerClientEvent('mana_audio:client:playSoundFromCoords', -1, data)
end

exports('PlaySoundFromCoords', playSoundFromCoords)

RegisterNetEvent('mana_audio:server:playSoundFromCoords', playSoundFromCoords)
