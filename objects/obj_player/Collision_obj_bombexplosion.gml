if (scr_transformationcheck() && state != (55 << 0) && state != (56 << 0) && state != (99 << 0) && state != (101 << 0))
{
    var dir = point_direction(other.x, other.y, x, y)
    trace(dir)
    if ((!grounded) && dir >= 45 && dir < 135)
    {
        state = (56 << 0)
        bombup_dir = -1
        sprite_index = spr_superspringplayer
        image_index = 0
    }
    if (grounded && x > (other.x - 8) && x < (other.x + 8))
    {
        state = (55 << 0)
        xscale = -1
        movespeed = 14
        sprite_index = spr_hurt
    }
    if (state != (55 << 0) && state != (56 << 0))
    {
        if (dir >= 135 && dir < 270)
        {
            state = (55 << 0)
            xscale = -1
            movespeed = 14
            sprite_index = spr_hurt
        }
        else if (dir >= 270 || dir < 45)
        {
            state = (55 << 0)
            sprite_index = spr_hurt
            movespeed = 14
            xscale = 1
        }
    }
}
