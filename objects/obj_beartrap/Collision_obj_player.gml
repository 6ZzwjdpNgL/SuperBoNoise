if (obj_player1.state != (90 << 0))
{
    with (instance_create(x, (y - 75), obj_press))
        ID = other.id
}
with (obj_player1)
{
    hsp = 0
    if (other.drop == 0)
    {
        if (state != (90 << 0))
        {
            sprite_index = spr_null
            instance_create(x, y, obj_spikehurteffect)
        }
        if (input_check_pressed("jump") || input_check_pressed("attack") || input_check_pressed("slap"))
        {
            if grounded
            {
                vsp = -4
                other.press += 2
            }
        }
        state = (90 << 0)
    }
}
if (floor(image_index) == 0)
    image_speed = 0.35
if (floor(image_index) == (image_number - 1))
    image_speed = 0
if (press < 8)
    closed = 1
