mask_index = spr_player_mask
switch state
{
    case (2 << 0):
        if grounded
            hsp = 0
        substate = (2 << 0)
        break
    case (19 << 0):
        move = input_check("right") - input_check("left")
        playerid.x = x
        playerid.y = y
        playerid.xscale = xscale
        switch substate
        {
            case (2 << 0):
                hsp = 0
                if input_check_pressed("jump")
                    playerid.input_buffer_jump = 0
                if (playerid.input_buffer_jump < 8)
                {
                    playerid.input_buffer_jump = 8
                    vsp = -14
                    if (move != 0)
                        xscale = sign(move)
                    hsp = xscale * 6
                    substate = (94 << 0)
                }
                break
            case (94 << 0):
                if input_check_pressed("jump")
                    playerid.input_buffer_jump = 0
                if grounded
                    substate = (2 << 0)
                if playerid.input_check_pressed("down")
                {
                    substate = (110 << 0)
                    vsp = 20
                    hsp = 0
                }
                break
            case (110 << 0):
                instance_destroy(instance_place(x, (y + vsp), obj_metalblock))
                with (obj_destructibles)
                {
                    if place_meeting(x, (y - other.vsp), other)
                        instance_destroy()
                }
                if grounded
                {
                    substate = (2 << 0)
                    with (obj_camera)
                    {
                        shake_mag = 3
                        shake_mag_acc = 3 / room_speed
                    }
                }
                break
        }

        break
}

scr_collide()
event_inherited()
