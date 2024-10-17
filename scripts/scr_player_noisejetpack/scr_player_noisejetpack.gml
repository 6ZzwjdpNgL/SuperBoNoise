function state_player_noisejetpack() //state_player_noisejetpack
{
    hsp = xscale * movespeed
    move = input_check("right") - input_check("left")
    if (input_check_pressed("jump") && jetpackfuel > 0)
    {
        jetpackfuel--
        vsp = -6
        sprite_index = spr_null
    }
    else
        sprite_index = spr_null
    if (move != 0)
    {
        if (xscale != move)
        {
            movespeed = approach(movespeed, 0, 0.5)
            if (movespeed <= 0)
            {
                movespeed = 0
                xscale = move
            }
        }
        else if (movespeed < 8)
            movespeed = approach(movespeed, 8, 0.5)
    }
    if (place_meeting((x + sign(hsp)), y, obj_solid) || scr_solid_slope((x + sign(hsp)), y))
    {
        movespeed = 4
        xscale *= -1
    }
    if scr_checkgroundpound()
    {
        sprite_index = spr_bodyslamstart
        image_index = 0
        state = (124 << 0)
        vsp = (character == "P" ? -5 : -7)
    }
    if (grounded && vsp > 0)
    {
        state = (2 << 0)
        if (movespeed >= 12)
        {
            state = (123 << 0)
            sprite_index = spr_dashpadmach
            image_index = 0
        }
    }
}

