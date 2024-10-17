with (other)
{
    if (state != (213 << 0) && state != (212 << 0) && state != (23 << 0))
    {
        sprite_index = spr_slipbanan1
        other.drop = 1
        vsp = -11
        movespeed += 2
        if (movespeed > 14)
            movespeed = 14
        hsp = movespeed * xscale
        image_index = 0
        state = (167 << 0)
    }
    instance_destroy(other)
}
