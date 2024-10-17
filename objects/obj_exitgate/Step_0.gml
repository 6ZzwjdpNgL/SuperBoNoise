if (global.panic == true)
    image_index = 1
if (drop && global.panic)
{
    switch dropstate
    {
        case (2 << 0):
            if (distance_to_object(obj_player1) < 300)
            {
                dropstate = (17 << 0)
                handsprite = spr_grabbiehand_fall
                hand_y = camera_get_view_y(view_camera[0]) - 100
            }
            break
        case (17 << 0):
            if (hand_y < (y - 128))
                hand_y += 6
            else
            {
                handsprite = spr_grabbiehand_catch
                handindex = 0
                dropstate = (6 << 0)
            }
            break
        case (6 << 0):
            depth = 80
            var _ty = drop_y - 100
            y = approach(y, _ty, 3)
            hand_y = y - 128
            if (y == _ty && distance_to_object(obj_player1) < 200)
            {
                dropstate = (137 << 0)
                handindex = 0
                handsprite = spr_grabbiehand_release
                vsp = 0
            }
            break
        case (137 << 0):
            if (vsp < 20)
                vsp += grav
            y += vsp
            if (y >= drop_y)
            {
                depth = 50
                y = drop_y
                dropstate = (128 << 0)
                handsprite = spr_grabbiehand_idle
                with (obj_camera)
                {
                    shake_mag = 0
                    shake_mag_acc = 0 / room_speed
                }
            }
            break
        case (128 << 0):
            hand_y -= 6
            break
    }

    if (handsprite == spr_grabbiehand_release && floor(handindex) == (sprite_get_number(handsprite) - 1))
        handindex = sprite_get_number(handsprite) - 1
    handindex += 0.35
}
