function state_player_golf() //state_player_golf
{
    landAnim = 0
    jumpAnim = 0
    image_speed = 0.35
    global.combotime = 60
    global.heattime = 60
    if (sprite_index == spr_golfidle)
    {
        move = input_check("right") - input_check("left")
        if (move != 0)
            xscale = move
        if input_check_pressed("slap")
        {
            sprite_index = spr_golfswing
            image_index = 0
        }
    }
    if (sprite_index == spr_golfswing && floor(image_index) == (image_number - 1))
        state = (2 << 0)
    if (instance_exists(golfid) && golfid.state != (150 << 0) && golfid.state != (158 << 0))
        state = (2 << 0)
    return;
}

