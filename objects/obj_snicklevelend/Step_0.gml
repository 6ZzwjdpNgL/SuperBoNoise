if (floor(image_index) == (image_number - 1) && obj_player1.state != (114 << 0))
{
    with (obj_player1)
    {
        state = (114 << 0)
        image_index = 0
    }
    alarm[0] = 200
}
if (floor(image_index) == (image_number - 1))
    image_speed = 0
