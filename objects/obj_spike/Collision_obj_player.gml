if (other.state != (115 << 0))
{
    scr_hurtplayer(other)
    if fake
        instance_destroy()
}
else
{
    with (other)
    {
        state = (108 << 0)
        sprite_index = spr_bump
        image_index = 0
        hsp = -6 * xscale
        vsp = -4
        repeat (3)
            create_debris(x, y, spr_null)
    }
}
