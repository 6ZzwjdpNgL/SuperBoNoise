with (other)
{
    if (((!instakillmove) || state == (106 << 0)) && state != (108 << 0) && other.state == (136 << 0) && state != (63 << 0))
    {
        vsp = -4
        hsp = -3 * xscale
        state = (108 << 0)
        sprite_index = spr_bump
        image_index = 0
        other.state = (108 << 0)
        other.sprite_index = spr_clownmato_bounce
        other.image_index = 0
    }
}
