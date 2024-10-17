function state_player_morthook() //state_player_morthook
{
    jumpstop = 1
    doublejump = 0
    hsp = 0
    vsp = 0
    if (!instance_exists(morthookID))
    {
        state = (14 << 0)
        sprite_index = spr_fall
        return;
    }
    image_speed = 0.35
    x = approach(x, morthookID.x, movespeed)
    y = approach(y, morthookID.y, movespeed)
    if (floor(x) == morthookID.x && floor(y) == morthookID.y)
    {
        if (sprite_index != spr_player_morthook)
        {
            sprite_index = spr_player_morthook
            image_index = 0
        }
        else if (floor(image_index) == (image_number - 1))
        {
            state = (14 << 0)
            sprite_index = spr_mortdoublejumpstart
            image_index = 0
            vsp = -14
            movespeed = xscale * 12
        }
    }
    return;
}

