function scr_playersounds() //scr_playersounds
{
    with (obj_player1)
    {
        var s = (state == (63 << 0) ? tauntstoredstate : state)
        var _state = s
        if (s == (106 << 0) || s == (123 << 0) || s == (39 << 0))
        {
            if (!event_isplaying(machsnd))
                fmod_event_play(machsnd)
            var m = 0
            if (s == (106 << 0) && sprite_index == spr_mach1 && grounded)
                m = 1
            else if ((s == (106 << 0) && sprite_index == spr_mach) || state == (39 << 0))
                m = 2
            else if (s == (123 << 0) && sprite_index != spr_crazyrun)
                m = 3
            else if (s == (123 << 0) && sprite_index == spr_crazyrun)
                m = 4
            event_quick3D(machsnd)
            fmod_event_setParameter(machsnd, "state", m, true)
            fmod_event_setParameter(machsnd, "ground", grounded, true)
        }
        else
            fmod_event_stop(machsnd, true)
        if place_meeting(x, y, obj_waterCurrent)
        {
            if (!event_isplaying(currentsnd))
                fmod_event_play(currentsnd)
            event_quick3D(currentsnd)
        }
        else
            fmod_event_stop(currentsnd, false)
        if (sprite_index == spr_machroll || sprite_index == spr_backslide || sprite_index == spr_backslideland)
        {
            if (!event_isplaying(machroll_snd))
                fmod_event_play(machroll_snd)
            event_quick3D(machroll_snd)
        }
        else
            fmod_event_stop(machroll_snd, true)
        if (event_isplaying(suplexdashsnd) && state != (44 << 0))
            fmod_event_stop(suplexdashsnd, true)
        if (event_isplaying(fishDashsnd) && state != (271 << 0))
            fmod_event_stop(fishDashsnd, true)
        if (event_isplaying(global.OilMusic) && room != water_1)
            fmod_event_stop(global.OilMusic, true)
        if (event_isplaying(snd_oilup) && s != (276 << 0))
            fmod_event_stop(snd_oilup, true)
        event_quick3D(snd_oilup)
        event_quick3D(superjumpsnd)
        event_quick3D(voice_collect)
        event_quick3D(crouchslide_snd)
        event_quick3D(dive_snd)
        event_quick3D(suplexdashsnd)
        event_quick3D(fishDashsnd)
        event_quick3D(uppercutsnd)
        event_quick3D(voice_hurt)
        event_quick3D(voice_uppercut)
        event_quick3D(voice_kungfu)
        event_quick3D(rollgetup_snd)
        if (state == (101 << 0))
        {
            if (!event_isplaying(superjumpsnd))
            {
                fmod_event_setParameter(superjumpsnd, "state", 0, true)
                fmod_event_play(superjumpsnd)
            }
        }
        else if (state == (99 << 0))
            fmod_event_setParameter(superjumpsnd, "state", 1, true)
        else if (state != (99 << 0))
        {
            if (event_isplaying(superjumpsnd) && fmod_event_getParameter(superjumpsnd, "state") < 1)
                fmod_event_stop(superjumpsnd, 1)
            if (!event_isplaying(superjumpsnd))
                fmod_event_setParameter(superjumpsnd, "state", 0, true)
        }
        if ((state == (40 << 0) && grounded && vsp > 0) || state == (80 << 0))
        {
            event_quick3D(grindsnd)
            if (!event_isplaying(grindsnd))
                fmod_event_play(grindsnd)
        }
        else
            fmod_event_stop(grindsnd, true)
        if (s == (110 << 0) || s == (124 << 0) || s == (78 << 0))
        {
            event_quick3D(freefallsnd)
            if (!event_isplaying(freefallsnd))
                fmod_event_play(freefallsnd)
        }
        else
            fmod_event_stop(freefallsnd, true)
        if (global.redcoin > 0)
        {
            if (!event_isplaying(global.RedCoinMusic))
                fmod_event_play(global.RedCoinMusic)
        }
        else if event_isplaying(global.RedCoinMusic)
        {
            trace("Stopping redcoin music")
            fmod_event_stop(global.RedCoinMusic, false)
        }
    }
    return;
}

function scr_playersound_init() //scr_playersound_init
{
    machsnd = fmod_createEventInstance("event:/SFX/bo/mach")
    currentsnd = fmod_createEventInstance("event:/SFX/misc/watercurrent")
    superjumpsnd = fmod_createEventInstance("event:/SFX/bo/superjump")
    grindsnd = fmod_createEventInstance("event:/SFX/bo/grinding")
    freefallsnd = fmod_createEventInstance("event:/SFX/bo/freefall")
    voice_hurt = fmod_createEventInstance("event:/SFX/voice/hurt")
    voice_collect = fmod_createEventInstance("event:/SFX/voice/collect")
    voice_uppercut = fmod_createEventInstance("event:/SFX/voice/uppercutVoice")
    voice_kungfu = fmod_createEventInstance("event:/SFX/voice/kungfuVoice")
    suplexdashsnd = fmod_createEventInstance("event:/SFX/bo/suplexdash")
    fishDashsnd = fmod_createEventInstance("event:/SFX/bo/fishdash")
    uppercutsnd = fmod_createEventInstance("event:/SFX/bo/uppercut")
    crouchslide_snd = fmod_createEventInstance("event:/SFX/bo/crouchslide")
    dive_snd = fmod_createEventInstance("event:/SFX/bo/dive")
    machroll_snd = fmod_createEventInstance("event:/SFX/bo/machroll")
    rollgetup_snd = fmod_createEventInstance("event:/SFX/bo/rollgetup")
    snd_oilup = fmod_createEventInstance("event:/SFX/bo/oilup")
    if (object_index == obj_player1)
    {
        global.OilMusic = fmod_createEventInstance("event:/music/oil")
        global.RedCoinMusic = fmod_createEventInstance("event:/music/redCoinTime")
        global.comboendsnd = fmod_createEventInstance("event:/SFX/comboend")
        global.snd_rank = fmod_createEventInstance("event:/music/rank")
        global.snd_rankup = fmod_createEventInstance("event:/SFX/ui/rankup")
        global.snd_rankdown = fmod_createEventInstance("event:/SFX/ui/rankdown")
    }
}

