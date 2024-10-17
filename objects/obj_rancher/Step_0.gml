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
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (sprite_index != scaredspr && x != targetplayer.x && state != (131 << 0) && bombreset <= 0 && grounded && targetplayer.state != (18 << 0) && targetplayer.state != (19 << 0))
{
    if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 100) && y >= (targetplayer.y - 100))
    {
        if ((state == (136 << 0) || state == (128 << 0)) && (!scr_solid_line(targetplayer)))
        {
            sprite_index = spr_ranch_shoot
            image_index = 0
            image_xscale = (-(sign(x - targetplayer.x)))
            state = (131 << 0)
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
