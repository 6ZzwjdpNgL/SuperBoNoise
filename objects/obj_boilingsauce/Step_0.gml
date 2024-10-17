if (room == rm_blank)
    return;
var playerid = instance_place(x, (y - 1), obj_player1)
with (playerid)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != (5 << 0) && state != (91 << 0) && state != (33 << 0) && state != (188 << 0))
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        if (state != (11 << 0))
            tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", (2 << 0), spr_null, 3), "fireass")
        state = (11 << 0)
        vsp = -20
        sprite_index = spr_fireass
        image_index = 0
        movespeed = hsp
    }
}
