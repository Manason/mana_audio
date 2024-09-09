# mana_audio
API for playing native audio. Stopping audio early or looping are not supported. 

Thanks to PrinceAlbert, Demi-Automatic, ChatDisabled, Joe Szymkowicz, and Zoo

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/O5O0NX2Q4)


## Client

### PlaySound
Plays a sound not located within the 3D world

```lua
exports.mana_audio:PlaySound({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef'
})
```

### PlaySoundFromEntity
Plays a sound originating from an entity

```lua
exports.mana_audio:PlaySoundFromEntity({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    entity = PlayerPedId()
})
```

### PlaySoundFromCoords
Plays a sound originating from coordinates

```lua
exports.mana_audio:PlaySoundFromCoords({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    coords = vec3(0, 0, 0),
    range = 10,
})
```

## Server

### PlaySound
Plays a sound not located within the 3D world to the given client or -1 for all clients

```lua
exports.mana_audio:PlaySound(-1, {
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef'
})
```

### PlaySoundFromEntity
Plays a sound originating from an entity to all clients

```lua
exports.mana_audio:PlaySoundFromEntity({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    entity = GetPlayerPed(1)
})
```

### PlaySoundFromCoords
Plays a sound originating from coordinates to all clients in range

```lua
exports.mana_audio:PlaySoundFromCoords({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    coords = vec3(0, 0, 0),
    range = 10,
})
```
