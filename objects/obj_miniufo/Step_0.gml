if (room == rm_blank)
    return;
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

if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
if (state == (136 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (136 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (140 << 0))
    grav = 0.5
else
    grav = 0
if (bombreset > 0 && state == (136 << 0))
    bombreset--
var player = instance_nearest(x, y, obj_player1)
if (ragebuffer > 0)
    ragebuffer--
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state == (131 << 0) || state == (127 << 0))
{
    hsp = 0
    vsp = 0
}
if (state != (6 << 0))
    depth = 0
scr_scareenemy()
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
