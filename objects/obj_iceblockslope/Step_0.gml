if place_meeting(x, (y - 1), obj_player1)
{
    var _dir = sign(image_xscale)
    with (obj_player1)
    {
        if (state != (39 << 0) && (icemovespeed < 2 || place_meeting(x, (y + 1), obj_iceblock)) && place_meeting(x, (y + 1), other) && scr_slope())
        {
            icemovespeed = 2
            icedir = (-_dir)
        }
        if (state == (39 << 0))
            icemovespeed = 0
    }
}
