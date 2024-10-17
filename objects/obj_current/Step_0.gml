if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (state != (150 << 0) && state != (93 << 0) && state != (188 << 0) && state != (212 << 0) && state != (213 << 0))
        {
            if place_meeting(x, (y + 1), other)
            {
                if (state != (115 << 0) && state != (116 << 0) && state != (118 << 0) && state != (117 << 0))
                {
                    state = (96 << 0)
                    sprite_index = spr_currentplayer
                }
                else
                    state = (118 << 0)
                xscale = sign(other.image_xscale)
                movespeed = 20
            }
        }
        else
        {
            vsp = -6
            image_index = 0
        }
    }
}
