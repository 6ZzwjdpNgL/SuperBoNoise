if (sprite_index == spr_weirdfish_throw)
    return;
with (other)
{
    if (state != (210 << 0) && (!((state == (271 << 0) || state == (270 << 0) || state == (273 << 0) || state == (272 << 0)))))
    {
        other.playerID = id
        other.sprite_index = spr_weirdfish_throw
        other.image_index = 0
        x = other.x
        y = other.y
        fishthrown = true
        event_play_oneshot("event:/SFX/misc/transfo", x, y)
        fmod_event_play(voice_hurt)
        xscale = (-other.image_xscale)
        hsp = 0
        vsp = 0
        movespeed = 0
        state = (273 << 0)
    }
}
