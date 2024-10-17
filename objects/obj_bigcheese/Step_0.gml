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
}

if (state == (136 << 0))
    hsp = 0
else if (state == (76 << 0))
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = (136 << 0)
        sprite_index = spr_bigcheese_idle
    }
    if (!shot)
    {
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale
                hsp = 0
                vsp = 0
                state = (7 << 0)
                jumpstop = 1
                x = other.x
                y = other.y
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale
                x = other.x
                y = other.y
                hsp = 0
                vsp = 0
                hsp_carry = 0
                vsp_carry = 0
            }
        }
    }
    if (floor(image_index) > 2 && (!shot))
    {
        shot = 1
        if (!pizzaball)
        {
            with (playerid)
            {
                xscale = other.image_xscale
                movespeed = 12
                state = (7 << 0)
                vsp = -14
                jumpstop = 1
            }
        }
        else
        {
            with (golfid)
            {
                image_xscale = other.image_xscale
                scr_pizzaball_go_to_thrown((12 * image_xscale), -14, 0)
            }
        }
    }
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
