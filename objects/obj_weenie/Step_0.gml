if (room == rm_blank)
    return;
if (state != (140 << 0) && state != (7 << 0))
    stunstate = 0
else if (state == (140 << 0))
{
    if (stunstate == 0 && stunned > 50 && grounded)
    {
        stunstate = 1
        stunned = 0
        state = (7 << 0)
        stuntimer = stunmax
    }
}
invincible = state == (7 << 0)
switch state
{
    case (128 << 0):
        scr_enemy_idle()
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
    case (156 << 0):
        scr_enemy_pummel()
        break
    case (157 << 0):
        scr_enemy_staggered()
        break
    case (127 << 0):
        scr_enemy_rage()
        break
    case (19 << 0):
        scr_enemy_ghostpossess()
        break
    case (7 << 0):
        grav = 0.5
        sprite_index = spr_sausagemannocigar_rolling
        hsp = image_xscale * 7
        angle = 0
        if (scr_solid((x + sign(hsp)), y) && ((!(place_meeting(x, (y + 1), obj_slope))) || place_meeting((x + sign(hsp)), (y - 5), obj_solid)))
            image_xscale *= -1
        if (stuntimer > 0)
            stuntimer--
        else
            state = (140 << 0)
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_weeniehitbox)
            hitboxID.baddieID = id
        }
        break
}

if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
scr_scareenemy()
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
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
