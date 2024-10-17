if (visible == true && obj_player1.state != (9 << 0))
{
    if place_meeting(x, (y - 1), obj_player1)
    {
        with (obj_player1)
        {
            if (state == (49 << 0))
                state = (40 << 0)
            else if (state != (40 << 0))
            {
                state = (96 << 0)
                sprite_index = spr_slipnslide
            }
            if (movespeed < 12)
                movespeed = 12
        }
    }
    if place_meeting(x, (y - 1), obj_player2)
    {
        with (obj_player2)
        {
            if (state == (49 << 0))
                state = (40 << 0)
            else if (state != (40 << 0))
            {
                state = (96 << 0)
                sprite_index = spr_slipnslide
            }
            if (movespeed < 12)
                movespeed = 12
        }
    }
}
if (visible == false && global.boxhp <= 5)
{
    x = xstart
    y = ystart
    visible = true
    repeat (4)
        instance_create(x, y, obj_debris)
    mask_index = sprite_index
}
