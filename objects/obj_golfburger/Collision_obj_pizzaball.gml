if (state != (76 << 0) && state != (140 << 0) && state != (6 << 0))
{
    if (other.state == (136 << 0))
    {
        golfid = other.id
        shot = 0
        state = (76 << 0)
        sprite_index = spr_golfburger_golf
        image_index = 0
        if (shootdir == 0)
            image_xscale = choose(-1, 1)
        else
            image_xscale = shootdir
    }
    else if (other.state == (158 << 0))
        instance_destroy()
}
