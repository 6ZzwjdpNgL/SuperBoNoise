var _used = 0
with (obj_trapghost)
{
    if (state == (143 << 0) && trapid == other.id)
        _used = 1
}
if _used
{
    var _obj = id
    with (other)
    {
        if (scr_transformationcheck() || state == (7 << 0))
        {
            if ((state != (108 << 0) || sprite_index != spr_player_catched) && (state != (7 << 0) || xscale != _obj.image_xscale) && state != (49 << 0) && state != (40 << 0) && state != (86 << 0) && state != (188 << 0))
            {
                state = (7 << 0)
                xscale = sign(other.image_xscale)
                mask_index = spr_crouchmask
                movespeed = 14
                vsp = 0
                sprite_index = spr_tumble
                other.image_index = 0
                other.sprite_index = spr_kingghost_pinball3
                var _max = 45
                y = other.y - _max
                if place_meeting(x, y, obj_platform)
                    y--
                if scr_solid(x, y)
                {
                    var i = 0
                    while (i <= _max)
                    {
                        if scr_solid(x, y)
                        {
                            x += xscale
                            i++
                        }
                        else
                            break
                    }
                }
                if scr_solid(x, y)
                {
                    i = 0
                    while (i <= _max)
                    {
                        if scr_solid(x, y)
                        {
                            y--
                            i++
                        }
                        else
                            break
                    }
                }
            }
        }
    }
}
