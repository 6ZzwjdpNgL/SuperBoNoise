targetplayer = instance_nearest(x, y, obj_player1)
image_speed = 0.35
switch state
{
    case (2 << 0):
        hand_xscale = (drawhandx < x ? 1 : -1)
        idlebuffer = 0
        spr_hand = spr_mrpinch_hand1
        sprite_index = spr_mrpinch_face1
        var _dir = point_direction(x, y, targetplayer.x, targetplayer.y)
        var spd = (shootbuffer > 0 ? 3 : 10)
        var tx = targetplayer.x
        var ty = targetplayer.y
        if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
        {
            tx = x + (lengthdir_x(maxhandlen, _dir))
            ty = y + (lengthdir_y(maxhandlen, _dir))
            _dir = point_direction(x, y, tx, ty)
        }
        handx = approach(handx, tx, spd)
        handy = approach(handy, ty, spd)
        if (handy < y)
            handy = y
        drawhandx = lerp(drawhandx, handx, 0.2)
        drawhandy = lerp(drawhandy, handy, 0.2)
        if (shootbuffer > 0)
            shootbuffer--
        if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player1))
        {
            playerid = instance_place(handx, handy, obj_player1)
            launch_hsp = sign(playerid.hsp) * 3
            launch_vsp = -20
            hsp = playerid.hsp
            vsp = 10
            with (playerid)
            {
                tauntstoredstate = state
                tauntstoredsprite = sprite_index
                state = (216 << 0)
                stringid = other.id
                movespeed = hsp
            }
            state = (17 << 0)
        }
        break
    case (17 << 0):
        sprite_index = spr_mrpinch_face2
        spr_hand = spr_mrpinch_hand2
        handx = playerid.x
        handy = playerid.y
        drawhandx = handx
        drawhandy = handy
        if (handy < (y - 200) || playerid.state == (152 << 0))
        {
            state = (2 << 0)
            with (playerid)
            {
                if (state == (216 << 0))
                {
                    if (tauntstoredstate == (28 << 0))
                        state = (28 << 0)
                    else
                        state = (94 << 0)
                }
            }
            break
        }
        else
        {
            drawhandx = handx
            drawhandy = handy
            hand_xscale = playerid.xscale
            if (playerid.state != (152 << 0))
            {
                with (playerid)
                {
                    sprite_index = spr_player_mrpinch
                    stringid = other.id
                    state = (216 << 0)
                    if (y > other.y)
                    {
                        if (y > (other.y + other.maxhandlen / 2) && vsp > 0 && y > other.y)
                        {
                            other.state = (21 << 0)
                            other.shootbuffer = 60
                            other.launch_dir = point_direction(0, 0, other.launch_hsp, other.launch_vsp)
                            stringid = other.id
                        }
                    }
                    if (vsp > 0 && y < other.y)
                        other.idlebuffer++
                    else
                        other.idlebuffer = 0
                    if (other.idlebuffer > 60)
                    {
                        other.state = (2 << 0)
                        other.shootbuffer = 20
                        other.idlebuffer = 0
                        state = (2 << 0)
                    }
                }
            }
            else
                state = (2 << 0)
            break
        }
    case (21 << 0):
        sprite_index = spr_mrpinch_face2
        hand_index = spr_mrpinch_hand2
        hand_xscale = playerid.xscale
        handy = playerid.y
        handx = playerid.x
        drawhandx = handx
        drawhandy = handy
        var s1 = 0.9
        hsp += lengthdir_x(s1, launch_dir)
        vsp += lengthdir_y(s1, launch_dir)
        with (playerid)
        {
            sprite_index = spr_player_mrpinch
            other.shootbuffer = 10
            hsp = other.hsp
            vsp = other.vsp
            if (y <= other.y)
            {
                other.shootbuffer = 0
                movespeed = abs(movespeed)
                if (movespeed != 0)
                    xscale = sign(movespeed)
                vsp = other.launch_vsp
                dir = xscale
                jumpAnim = 1
                momemtum = 1
                jumpstop = 1
                sprite_index = spr_machfreefall
                state = (94 << 0)
                with (other)
                {
                    state = (10 << 0)
                    shootbuffer = 80
                }
            }
        }
        break
    case (10 << 0):
        hand_xscale = 1
        spr_hand = spr_mrpinch_hand3
        sprite_index = spr_mrpinch_face3
        handx = approach(handx, (x - 40), 4)
        handy = approach(handy, (y + 5), 4)
        drawhandx = handx
        drawhandy = handy
        if (shootbuffer > 0)
            shootbuffer--
        else
        {
            state = (2 << 0)
            shootbuffer = 30
        }
        break
}

hand_index += 0.35
if (hand_index > (sprite_get_number(hand_index) - 1))
    hand_index = frac(hand_index)
