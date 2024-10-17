with (other)
{
    if (state == (44 << 0) || state == (82 << 0))
    {
        state = (33 << 0)
        movespeed = hsp
        sprite_index = spr_rideweenie
        xscale = other.image_xscale
        jumpstop = 1
        if (vsp < 0)
            vsp = 0
        instance_destroy(other)
    }
}
