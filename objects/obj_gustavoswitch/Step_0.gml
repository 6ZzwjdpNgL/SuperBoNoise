if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
{
    with (obj_player1)
    {
        visible = true
        create_particle(x, y, (9 << 0))
        ratmount_movespeed = 8
        gustavodash = 0
        isgustavo = 1
        state = (193 << 0)
        brick = 1
        x = obj_gustavoswitch.x
        y = obj_gustavoswitch.y
        global.switchbuffer = 100
    }
    sprite_index = spr_null
}
