with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != (123 << 0) && (state != (63 << 0) || tauntstoredstate != (123 << 0)) && state != (5 << 0) && state != (91 << 0) && state != (33 << 0) && state != (188 << 0))
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = (11 << 0)
        vsp = -25
        sprite_index = spr_fireass
        image_index = 0
    }
}
