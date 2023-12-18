# mana_audio
API for playing native audio.

Thanks to PrinceAlbert, Demi-Automatic, ChatDisabled, Joe Szymkowicz, and Zoo

## Client

### PlaySound
Plays a sound not located within the 3D world

```lua
exports.mana_audio:PlaySound({
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef'
    isNetworked = false, -- replicates sound to all clients
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
    isNetworked = true, -- replicates sound to all clients
})
```

### PlaySoundFromCoords
Plays a sound originating from coordinates

```lua
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    coords = vec3(0, 0, 0),
    range = 10,
    isNetworked = true, -- replicates sound to all clients
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
    audioBank = 'myAudioBank',
    audioName = {'myAudioName1', 'myAudioName2'},
    audioRef = 'myAudioRef',
    coords = vec3(0, 0, 0),
    range = 10,
```