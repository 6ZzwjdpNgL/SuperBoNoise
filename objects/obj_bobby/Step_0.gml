if (room == rm_blank)
    return;
switch state
{
    case (128 << 0):
    case (140 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_charge()
        break
    case (132 << 0):
        scr_enemy_turn()
        break
    case (136 << 0):
        scr_enemy_walk()
        break
    case (138 << 0):
        scr_enemy_land()
        break
    case (139 << 0):
        scr_enemy_hit()
        break
    case (131 << 0):
        scr_pizzagoblin_throw()
        break
    case (6 << 0):
        scr_enemy_grabbed()
        break
    case (156 << 0):
        scr_enemy_pummel()
        break
    case (157 << 0):
        scr_enemy_staggered()
        break
    case (127 << 0):
        scr_enemy_rage()
        break
    case (19 << 0):
        scr_enemy_ghostpossess()
        break
    case (86 << 0):
        scr_enemy_taunt()
        break
}

if (state == (136 << 0))
{
    image_speed = 0.2
    if (!(place_meeting_collision((x + 2 * hsp), (y + 8), (8 << 0))))
    {
        var _noSolid = true
        var _collist = ds_list_create()
        instance_place_list((x + 2 * hsp), (y + 8), obj_platform, _collist, false)
        for (var i = 0; i < ds_list_size(_collist); i++)
        {
            var _col = ds_list_find_value(_collist, i)
            if (_col.object_index != obj_water && _col.object_index != obj_waterTop && _col.object_index != obj_waterCurrent)
                _noSolid = false
        }
        if _noSolid
        {
            idlebuffer = irandom_range(200, 600)
            sprite_index = idlespr
            image_xscale *= -1
            image_index = 0
            state = (128 << 0)
            event_play_oneshot("event:/SFX/voice/baby", x, y)
        }
    }
    if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1))
        create_particle((x - 2 * hsp), (y + 43), (1 << 0), 0)
    if (idlebuffer > 0)
        idlebuffer--
    else if (!(place_meeting(x, (y + 1), obj_slope)))
    {
        idlebuffer = irandom_range(200, 600)
        sprite_index = idlespr
        image_index = 0
        state = (128 << 0)
        event_play_oneshot("event:/SFX/voice/baby", x, y)
    }
}
with (obj_player1)
{
    var baddie = other.id
    if (state == (86 << 0) && baddie.state != (86 << 0))
    {
        event_play_oneshot("event:/SFX/voice/baby", baddie.x, baddie.y)
        baddie.storedstate = baddie.state
        baddie.storedspr = baddie.sprite_index
        baddie.state = (86 << 0)
        baddie.taunttimer = taunttimer
        with (instance_create(baddie.x, baddie.y, obj_baddietaunteffect))
            baddieID = baddie
    }
}
