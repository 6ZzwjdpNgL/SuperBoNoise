var fade = 0
var pillar = false
var s = (20 << 0)
var inw = false
var inPause = false
with (obj_pause)
{
    if (state == (0 << 0))
        inPause = true
}
with (obj_player1)
{
    s = state
    inw = place_meeting(x, y, obj_water)
    if (state == (48 << 0) || event_isplaying(global.treasuresnd))
        fade = 1
}
if (!instance_exists(obj_beatbox))
    fmod_global_setParameter("beatboxfade", 0, false)
with (obj_hungrypillar)
{
    if bbox_in_camera(view_camera[0], 0)
    {
        pillar = true
        fmod_event_setPause(other.pillarMusic, false)
        if (!event_isplaying(other.pillarMusic))
            fmod_event_play(other.pillarMusic)
    }
}
var oilfade = false
with (obj_player1)
    oilfade = state == (276 << 0)
if ((!inPause) && (!oilfade))
{
    if (!instance_exists(obj_luigicall))
        fmod_global_setParameter("musicMute", fade, false)
    fmod_global_setParameter("pillarfade", pillar, false)
}
if global.panic
{
    if (!panicStart)
    {
        panicStart = true
        fmod_event_play(escapeMusic)
        fmod_event_setPause(escapeMusic, false)
        fmod_event_setParameter(escapeMusic, "state", 0, 1)
        fmod_event_setParameter(escapeMusic, "state2", 0, 1)
        fmod_event_stop(pillarMusic, true)
        if (music != noone)
        {
            fmod_event_stop(music.music_inst, true)
            fmod_event_stop(music.secret_inst, true)
        }
    }
    else if event_isplaying(escapeMusic)
    {
        var timeinsecs = floor(global.fill / 60)
        fmod_event_setParameter(escapeMusic, "state2", max(floor(timeinsecs / 60), 0) <= 0, 1)
        fmod_event_setParameter(escapeMusic, "state", global.lap, 1)
    }
}
else
{
    panicStart = false
    fmod_event_stop(escapeMusic, true)
}
if (music != noone && (!inPause))
{
    if variable_struct_exists(music, "music_name")
    {
        if (music.music_name == "event:/music/water")
        {
            var s2 = 0
            var fisharr = [(270 << 0), (271 << 0), (272 << 0), (273 << 0)]
            if array_contains(fisharr, s)
                s2 = 1
            if (room == water_fish)
                s2 = 2
            if (s != (86 << 0) && s != (63 << 0) && s != (210 << 0) && s != (20 << 0))
                fmod_event_setParameter(music.music_inst, "state2", s2, true)
        }
    }
}
