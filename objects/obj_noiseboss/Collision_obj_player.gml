if (state == (136 << 0) && (!other.brick) && other.state == (261 << 0))
{
    var s = other.state
    scr_hurtplayer(other)
    if (s != other.state)
    {
        if (state == (136 << 0))
        {
            state = (82 << 0)
            sprite_index = spr_null
            image_index = 0
        }
    }
}
