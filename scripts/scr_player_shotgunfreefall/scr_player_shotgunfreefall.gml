function state_player_shotgunfreefall() //state_player_shotgunfreefall
{
    image_speed = 0.35
    move = input_check("right") - input_check("left")
    hsp = move * movespeed
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (move != 0)
    {
        if (movespeed < 8)
            movespeed += 0.5
    }
    else
        movespeed = 0
    if (sprite_index == spr_shotgunjump1)
    {
        if (floor(image_index) == (image_number - 1))
        {
            sprite_index = spr_shotgunjump3
            image_index = 0
        }
    }
    if (sprite_index == spr_shotgunjump3)
    {
        if grounded
        {
            sprite_index = spr_shotgunjump2
            image_index = 0
            event_play_oneshot("event:/SFX/bo/groundpound", x, y)
            create_particle(x, y, (12 << 0), 0)
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 15 / room_speed
            }
        }
    }
    if (sprite_index == spr_shotgunjump2)
    {
        hsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            state = (68 << 0)
            sprite_index = spr_shotgunland
            image_index = 0
            landAnim = 1
        }
    }
    return;
}

