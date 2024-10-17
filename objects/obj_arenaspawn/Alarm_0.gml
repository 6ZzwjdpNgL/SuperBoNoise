if (state != (147 << 0))
{
    wave_seconds--
    if (wave_seconds < 0)
    {
        if (wave_minutes > 0)
        {
            wave_seconds = 59
            wave_minutes--
        }
        else
        {
            wave_seconds = 0
            with (obj_player1)
            {
                if (state != (9 << 0))
                {
                    vsp = -11
                    state = (9 << 0)
                    targetRoom = lastroom
                }
            }
        }
    }
}
if (state == (145 << 0) || state == (144 << 0))
    alarm[0] = 60
