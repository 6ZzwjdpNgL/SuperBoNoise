if (room == rm_blank)
    return;
if (state == (136 << 0) && grounded && vsp > 0 && obj_player1.state == (113 << 0))
    scr_pizzaball_go_to_thrown(0, -10)
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
        scr_pizzaball_hit()
        break
    case (150 << 0):
        scr_pizzaball_golf()
        break
    case (158 << 0):
        scr_pizzaball_thrown()
        break
    case (140 << 0):
        scr_pizzaball_go_to_thrown(0, (vsp * 0.5))
        break
    case (131 << 0):
        scr_pizzagoblin_throw()
        break
    case (6 << 0):
        scr_pizzaball_grabbed()
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

if ((state == (136 << 0) || state == (128 << 0)) && sit)
{
    hsp = 0
    sprite_index = spr_pizzaball_idle1
}
if (state != (136 << 0))
    sit = 0
if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (158 << 0) && (!instance_exists(pointerID)))
{
    pointerID = instance_create(x, y, obj_objecticontracker)
    pointerID.sprite_index = spr_icon_pizzaball
    pointerID.objectID = id
}
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
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
if (state == (158 << 0))
{
    with (instance_place((x + xscale), y, obj_destructibles))
        instance_destroy()
    with (instance_place((x + hsp + xscale), y, obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y + vsp + 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y + vsp - 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y + 1), obj_destructibles))
        instance_destroy()
    with (instance_place(x, (y - 1), obj_destructibles))
        instance_destroy()
}
