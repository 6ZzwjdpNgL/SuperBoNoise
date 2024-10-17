with (other)
{
    if (state != (188 << 0))
    {
        if (state == (55 << 0) || state == (34 << 0) || state == (96 << 0) || state == (186 << 0) || state == (80 << 0) || state == (7 << 0) || state == (23 << 0) || state == (40 << 0) || state == (67 << 0) || state == (123 << 0) || state == (106 << 0))
        {
            other.sprite_index = spr_null
            other.image_index = 0
            if (xscale != other.image_xscale)
                xscale = other.image_xscale
        }
    }
}
