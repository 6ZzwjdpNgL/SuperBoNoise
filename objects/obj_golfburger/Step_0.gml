if (room == rm_blank)
    return;
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
if (state == (76 << 0))
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = (136 << 0)
        sprite_index = walkspr
    }
    if (!shot)
    {
        with (golfid)
        {
            hsp = 0
            vsp = 0
            sprite_index = stunfallspr
            image_xscale = other.image_xscale
            x = other.x + other.image_xscale * 24
            y = other.y + 23
        }
    }
    if (floor(image_index) >= 6 && (!shot))
    {
        shot = 1
        with (golfid)
        {
            x = other.x
            y = other.y
            scr_pizzaball_go_to_thrown((14 * other.image_xscale), -7, 0)
        }
    }
}
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
