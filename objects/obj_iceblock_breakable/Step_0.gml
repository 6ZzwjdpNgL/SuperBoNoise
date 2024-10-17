if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (state != (188 << 0) && place_meeting(x, (y + 1), other))
        {
            if (state == (49 << 0))
                state = (40 << 0)
            else if (state != (40 << 0) && state != (101 << 0))
            {
                if (state != (107 << 0) && state != (7 << 0) && state != (44 << 0) && state != (105 << 0) && state != (106 << 0) && state != (123 << 0))
                {
                    if (icedir != (-xscale) && move != 0)
                    {
                        if (prevmovespeed != 0)
                            icemovespeed = prevmovespeed
                        else
                            icemovespeed = 8
                        icedir = (-xscale)
                        savedicedir = (-xscale)
                    }
                    if (prevmove != move && move == 0)
                    {
                        icemovespeed = (-((prevmovespeed - previcemovespeed)))
                        icedir = (-xscale)
                    }
                }
                else if (state == (107 << 0))
                {
                    if (prevstate != state)
                    {
                        icedir = xscale
                        icemovespeed = floor(abs(movespeed) * 0.5)
                    }
                }
                else if (state == (7 << 0))
                    icemovespeed = 0
            }
        }
    }
}
