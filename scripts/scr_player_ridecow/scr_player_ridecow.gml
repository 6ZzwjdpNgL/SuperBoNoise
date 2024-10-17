function state_player_ridecow() //state_player_ridecow
{
    doublejump = 0
    hsp = 0
    vsp = 0
    movespeed = 0
    if (!instance_exists(cowID))
    {
        if has_mort
        {
            state = (14 << 0)
            sprite_index = spr_fall
        }
        else
        {
            state = (94 << 0)
            sprite_index = spr_fall
        }
        return;
    }
    image_speed = 0.35
    sprite_index = spr_rideweenie
    x = cowID.x
    y = cowID.y - 42
    xscale = cowID.image_xscale
    if input_check_pressed("jump")
    {
        cow_buffer = 20
        vsp = -11
        image_index = 0
        if has_mort
        {
            state = (14 << 0)
            sprite_index = spr_jump
        }
        else
        {
            state = (94 << 0)
            sprite_index = spr_jump
        }
    }
    return;
}

