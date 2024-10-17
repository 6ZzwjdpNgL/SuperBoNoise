with (other)
{
    if (character == "V")
        scr_hurtplayer(object_index)
    else if scr_transformationcheck()
    {
        if (instance_exists(other.baddieID) && sprite_index != spr_tumbleend && state != (7 << 0) && state != (49 << 0) && state != (40 << 0) && state != (149 << 0))
        {
            scr_losepoints()
            state = (7 << 0)
            xscale = other.baddieID.image_xscale
            movespeed = 10
            vsp = 0
            sprite_index = spr_tumble
            if (other.baddieID.object_index == obj_pepbat)
                other.baddieID.hit = 1
        }
    }
}
