mask_index = spr_player_mask
switch state
{
    case (2 << 0):
        launch_buffer = 120
        break
    case (19 << 0):
        switch substate
        {
            case (2 << 0):
                var moveH = playerid.input_check("left") + playerid.input_check("right")
                var moveV = playerid.input_check("down") - playerid.input_check("up")
                if (moveH != 0 || moveV != 0)
                {
                    moveX = moveH
                    moveY = moveV
                }
                hsp = 0
                vsp = 0
                angle += 32
                if (launch_buffer > 0)
                    launch_buffer--
                else
                    substate = (94 << 0)
                break
            case (94 << 0):
                var spd = 24
                hsp = moveX * spd
                vsp = moveY * spd
                angle += 64
                with (obj_destructibles)
                {
                    if place_meeting((x - other.hsp), (y - other.vsp), other)
                        instance_destroy()
                }
                with (obj_metalblock)
                {
                    if place_meeting((x - other.hsp), (y - other.vsp), other)
                        instance_destroy()
                }
                if place_meeting((x + hsp), (y + vsp), obj_solid)
                {
                    instance_destroy()
                    with (playerid)
                    {
                        state = (18 << 0)
                        visible = true
                    }
                    state = (2 << 0)
                }
                break
        }

        break
}

scr_collide()
event_inherited()
