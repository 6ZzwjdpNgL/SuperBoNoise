with (obj_player1)
{
    if (state != (86 << 0) && state != (108 << 0))
    {
        if (place_meeting_platform(x, (y + 1), other) && vsp >= 0)
        {
            if ((!isgustavo) && state != (80 << 0))
            {
                state = (80 << 0)
                vsp = 0
            }
            else if (isgustavo && state != (204 << 0))
            {
                if (brick == 1)
                {
                    with (instance_create(x, y, obj_brickcomeback))
                        wait = 1
                }
                brick = 0
                y = other.y
                state = (204 << 0)
            }
        }
    }
}
