mask_index = spr_player_mask
var _destroy = 0
switch state
{
    case (2 << 0):
        if (grounded && vsp > 0)
        {
            hsp = approach(hsp, 0, 0.5)
            if (!(place_meeting(x, y, obj_minecart_rail)))
                _destroy = 1
        }
        substate = (2 << 0)
        break
    case (19 << 0):
        move = input_check("right") - input_check("left")
        var spd = 12
        var accel = 0.1
        var deccel = 0.2
        switch substate
        {
            case (2 << 0):
                if place_meeting((x + sign(hsp)), y, obj_solid)
                    movespeed = 0
                if (move != 0)
                {
                    if (move == xscale)
                        movespeed = approach(movespeed, spd, accel)
                    else
                    {
                        movespeed = approach(movespeed, 0, accel)
                        if (movespeed <= 0)
                        {
                            xscale = move
                            movespeed = 0
                        }
                    }
                }
                else
                    movespeed = approach(movespeed, 0, deccel)
                hsp = xscale * movespeed
                if input_check_pressed("jump")
                    playerid.input_buffer_jump = 0
                if (playerid.input_buffer_jump < 8)
                {
                    playerid.input_buffer_jump = 8
                    substate = (94 << 0)
                    vsp = -11
                }
                if ((!grounded) && vsp > 0)
                    substate = (94 << 0)
                if (!(place_meeting(x, y, obj_minecart_rail)))
                    _destroy = 1
                break
            case (94 << 0):
                hsp = xscale * movespeed
                if place_meeting((x + sign(hsp)), y, obj_solid)
                    movespeed = 0
                if (grounded && vsp > 0)
                    substate = (2 << 0)
                break
        }

        break
}

with (obj_destructibles)
{
    if place_meeting((x - other.hsp), y, other)
        instance_destroy()
}
if (movespeed > 10)
    instance_destroy(instance_place((x + hsp), y, obj_metalblock))
if _destroy
{
    instance_destroy()
    instance_create(xstart, ystart, obj_minecart)
    create_particle(xstart, ystart, (9 << 0))
    create_particle(x, y, (9 << 0))
    with (playerid)
    {
        state = (18 << 0)
        visible = true
    }
}
scr_collide()
event_inherited()
