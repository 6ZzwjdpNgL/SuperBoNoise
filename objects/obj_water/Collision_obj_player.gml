with (other)
{
    if (state == (63 << 0) || state == (148 << 0) || state == (210 << 0))
        return;
    if (state != (271 << 0) && state != (110 << 0) && state != (113 << 0) && state != (273 << 0) && state != (272 << 0) && state != (78 << 0) && state != (270 << 0) && sprite_index != spr_dive)
    {
        if (vsp > -8)
            vsp = approach(vsp, -8, 5)
        switch state
        {
            case (99 << 0):
            case (101 << 0):
                state = (94 << 0)
                break
            case (107 << 0):
                if (sprite_index == spr_machslideboost)
                    state = (106 << 0)
                break
        }

        state = (274 << 0)
        jumpstop = true
    }
}
