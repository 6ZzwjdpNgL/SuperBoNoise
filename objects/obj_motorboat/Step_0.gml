switch state
{
    case (2 << 0):
        with (obj_player1)
        {
            if (other.state != (136 << 0) && state == (2 << 0) && vsp > 0 && input_check("up") && place_meeting(x, (y + 1), other))
            {
                state = (148 << 0)
                hsp = 0
                vsp = 0
                sprite_index = spr_idle
                with (other)
                {
                    playerid = other.id
                    playerxoffset = other.x - x
                    state = (136 << 0)
                    if place_meeting((x + dir * 32), y, obj_solid)
                        dir *= -1
                }
            }
        }
        break
    case (136 << 0):
        x += (dir * 5)
        playerid.x = x + playerxoffset
        playerid.hsp = 0
        playerid.vsp = 0
        if place_meeting((x + dir), y, obj_solid)
        {
            with (playerid)
                state = (2 << 0)
            state = (2 << 0)
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = 5 / room_speed
            }
            dir *= -1
        }
        break
}

