function state_player_current() //state_player_current
{
    if (!(place_meeting(x, y, obj_current)))
        state = (2 << 0)
    sprite_index = spr_null
    image_speed = 0.35
    return;
}

