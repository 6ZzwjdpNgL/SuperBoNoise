switch state
{
    case (128 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_charge()
        break
    case (132 << 0):
        scr_enemy_turn()
        break
    case (136 << 0):
        scr_enemy_walk()
        break
    case (138 << 0):
        scr_enemy_land()
        break
    case (139 << 0):
        scr_enemy_hit()
        break
    case (140 << 0):
        scr_enemy_stun()
        break
    case (131 << 0):
        scr_pizzagoblin_throw()
        break
    case (6 << 0):
        scr_enemy_grabbed()
        break
    case (105 << 0):
        if (image_index > (image_number - 1))
        {
            hsp = image_xscale * startmachspeed
            if place_meeting(x, (y + 1), obj_railparent)
            {
                var _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp += (_railinst.movespeed * _railinst.dir)
            }
            sprite_index = spr_robot_mach
            image_index = 0
            state = (106 << 0)
        }
        break
    case (106 << 0):
        hsp = (approach(hsp, (image_xscale * machspeed), 0.5)) + railmovespeed
        if place_meeting(x, (y + 1), obj_railparent)
        {
            _railinst = instance_place(x, (y + 1), obj_railparent)
            railmovespeed = _railinst.movespeed * _railinst.dir
        }
        else
            railmovespeed = 0
        with (instance_place((x + hsp), y, obj_destructibles))
            instance_destroy()
        if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
        {
            state = (140 << 0)
            stunned = 100
            vsp = -4
            hsp = (-image_xscale) * 2
        }
        break
    case (93 << 0):
        if (image_index > 8)
        {
            hsp = image_xscale * tacklespeed
            if place_meeting(x, (y + 1), obj_railparent)
            {
                _railinst = instance_place(x, (y + 1), obj_railparent)
                hsp += (_railinst.movespeed * _railinst.dir)
            }
            with (instance_place((x + hsp), y, obj_destructibles))
                instance_destroy()
        }
        if (image_index > (image_number - 1))
        {
            state = (136 << 0)
            hsp = 0
            railspeed = 0
            sprite_index = walkspr
        }
        if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting(x, y, obj_destructibles))))
        {
            state = (140 << 0)
            stunned = 100
            vsp = -8
            hsp = (-image_xscale) * 5
        }
        break
    case (25 << 0):
        hsp = 0
        if (image_index > (image_number - 1))
        {
            state = (136 << 0)
            sprite_index = walkspr
        }
        break
}

if (state == (140 << 0) && stunned > 40 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
if (bombreset > 0)
    bombreset--
invincible = state == (106 << 0)
targetplayer = instance_nearest(x, y, obj_player1)
if (x != targetplayer.x && state != (131 << 0) && bombreset == 0)
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 20) && y >= (targetplayer.y - 20))
    {
        if (state == (136 << 0) || state == (128 << 0))
        {
            image_index = 0
            image_xscale = (-(sign(x - targetplayer.x)))
            state = chosenstate
            bombreset = 100
            switch state
            {
                case (105 << 0):
                    sprite_index = spr_robot_machstart
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (131 << 0):
                    bombreset = 0
                    sprite_index = spr_robot_attack
                    image_index = 0
                    image_speed = 0.35
                    hsp = 0
                    break
                case (93 << 0):
                    sprite_index = spr_robot_tackle
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
                case (25 << 0):
                    sprite_index = spr_robot_slap
                    image_index = 0
                    image_speed = 0.6
                    hsp = 0
                    break
            }

        }
    }
}
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
if (state == (106 << 0) || (state == (25 << 0) && image_index > 11) || (state == (93 << 0) && image_index > 8))
{
    if (!hitboxcreate)
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_tackhitbox))
        {
            if (other.state == (25 << 0))
                sprite_index = spr_swordhitbox
            else if (other.state == (106 << 0) || other.state == (93 << 0))
                sprite_index = spr_bighitbox
            ID = other.id
        }
    }
}
else
    hitboxcreate = 0
