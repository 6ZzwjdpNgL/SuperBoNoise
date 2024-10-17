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
        hsp = 0
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
    case (143 << 0):
        scr_enemy_chase()
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
}

if ((state == (136 << 0) || state == (128 << 0)) && sprite_index != spr_golfdemon_idle2)
    sprite_index = spr_golfdemon_idle
if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (ragecooldown > 0)
    ragecooldown--
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (143 << 0))
    momentum = 0
if (state == (136 << 0) || state == (128 << 0))
{
    var targetplayer = instance_nearest(x, y, obj_player1)
    if (sprite_index != spr_golfdemon_idle2 && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
    {
        sprite_index = spr_golfdemon_idle2
        image_index = 0
    }
    if (sprite_index == spr_golfdemon_idle2 && floor(image_index) == (image_number - 1))
    {
        movespeed = 6
        if (targetplayer.x != x)
            image_xscale = (-(sign(x - targetplayer.x)))
        state = (143 << 0)
        sprite_index = spr_golfdemon_walk
    }
}
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
