x = 0
y = 0
fadeinAlpha = 1
depth = -10001
alarm[0] = 600
with (obj_music)
{
    if (music != noone)
        fmod_event_stop(music.music_inst, true)
}
with (obj_player)
    state = (20 << 0)
