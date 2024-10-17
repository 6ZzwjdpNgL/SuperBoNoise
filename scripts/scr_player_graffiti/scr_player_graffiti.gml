function state_player_graffiti() //state_player_graffiti
{
    hsp = 0
    vsp = (-grav)
    image_speed = 0.5
    if (floor(image_index) == (image_number - 1))
    {
        state = (2 << 0)
        if tauntstoredisgustavo
            state = (193 << 0)
        if (global.graffiticount >= global.graffitimax)
            instance_create(x, y, obj_key)
    }
    return;
}

