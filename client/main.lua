local function loadAudioBank(audioBank)
    local timeout = 500
    while not RequestScriptAudioBank(audioBank, false) do
        if timeout == 0 then
            return false
        else
            timeout -= 1
        end
        Wait(0)
    end
    return true
end

---@class PlaySoundParams
---@field audioBank string
---@field audioName string|string[]
---@field audioRef string

local function playSound(data)
    if type(data.audioName) == 'string' then
        data.audioName = {data.audioName}
    end
    loadAudioBank(data.audioBank)
    for i = 1, #data.audioBank do
        local audioName = data.audioName[i]
        local soundId = GetSoundId()
        PlaySoundFrontend(soundId, audioName, data.audioRef, false)
        ReleaseSoundId(soundId)
    end
    ReleaseScriptAudioBank()
end

---@class PlaySoundExportParams: PlaySoundParams
---@field isNetworked boolean

---@param data PlaySoundExportParams
exports('PlaySound', function(data)
    if data.isNetworked then
        TriggerServerEvent('mana_audio:server:playSound', {
            audioBank = data.audioBank,
            audioName = data.audioName,
            audioRef = data.audioRef,
        })
    else
        playSound({
            audioBank = data.audioBank,
            audioName = data.audioName,
            audioRef = data.audioRef,
        })

    end
end)

RegisterNetEvent('mana_audio:client:playSoundFromEntity', playSound)

---@class PlaySoundFromEntityParams: PlaySoundParams
---@field entity number

---@param data PlaySoundFromEntityParams
local function playSoundFromEntity(data)
    if type(data.audioName) == 'string' then
        data.audioName = {data.audioName}
    end
    loadAudioBank(data.audioBank)
    for i = 1, #data.audioBank do
        local audioName = data.audioName[i]
        local soundId = GetSoundId()
        PlaySoundFromEntity(soundId, audioName, data.entity, data.audioRef, false, false)
        ReleaseSoundId(soundId)
    end
    ReleaseScriptAudioBank()
end

---@class PlaySoundFromEntityExportParams: PlaySoundFromEntityParams
---@field isNetworked boolean

---@param data PlaySoundFromEntityExportParams
exports('PlaySoundFromEntity', function(data)
    if data.isNetworked then
        TriggerServerEvent('mana_audio:server:playSoundFromEntity', {
            audioBank = data.audioBank,
            audioName = data.audioName,
            audioRef = data.audioRef,
            netId = NetworkGetNetworkIdFromEntity(data.entity)
        })
    else
        playSoundFromEntity(data)
    end
end)

RegisterNetEvent('mana_audio:client:playSoundFromEntity', function(data)
    playSoundFromEntity({
        audioBank = data.audioBank,
        audioName = data.audioName,
        audioRef = data.audioRef,
        entity = NetworkGetEntityFromNetworkId(data.netId),
    })
end)

---@class PlaySoundFromCoordsParams: PlaySoundParams
---@field coords vector3
---@field range number

---@param data PlaySoundFromCoordsParams
local function playSoundFromCoords(data)
    if type(data.audioName) == 'string' then
        data.audioName = {data.audioName}
    end
    loadAudioBank(data.audioBank)
    for i = 1, #data.audioBank do
        local audioName = data.audioName[i]
        local soundId = GetSoundId()
        PlaySoundFromCoord(soundId, audioName, data.coords.x, data.coords.y, data.coords.z, data.audioRef, false, data.range, false)
        ReleaseSoundId(soundId)
    end
    ReleaseScriptAudioBank()
end

---@class PlaySoundFromCoordsExportParams: PlaySoundFromCoordsParams
---@field isNetworked boolean

---@param data PlaySoundFromCoordsExportParams
exports('PlaySoundFromCoords', function(data)
    if data.isNetworked then
        TriggerServerEvent('mana_audio:server:playSoundFromCoords', {
            audioBank = data.audioBank,
            audioName = data.audioName,
            audioRef = data.audioRef,
            coords = data.coords,
            range = data.range,
        })
    else
        playSoundFromCoords({
            audioBank = data.audioBank,
            audioName = data.audioName,
            audioRef = data.audioRef,
            coords = data.coords,
            range = data.range,
        })
    end
end)

RegisterNetEvent('mana_audio:client:playSoundFromCoords', playSoundFromCoords)