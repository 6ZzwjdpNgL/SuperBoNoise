with (other)
{
    vsp = approach(vsp, -5, 5)
    jumpstop = 1
    if (state == (107 << 0))
    {
        state = (94 << 0)
        if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
            xscale *= -1
        sprite_index = spr_machfreefall
    }
}
