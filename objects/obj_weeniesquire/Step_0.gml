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
    case (82 << 0):
        hsp = image_xscale * chargespeed
        if (chargespeed < 24)
            chargespeed += 0.3
        with (obj_destructibles)
        {
            if place_meeting((x - other.hsp), y, other)
                instance_destroy()
        }
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_slope))))
        {
            state = (140 << 0)
            stunned = 80
            hsp = -8 * image_xscale
            vsp = -5
        }
        break
}

if (state == (136 << 0) && grounded && vsp > 0)
    hsp = 0
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
var player = instance_nearest(x, y, obj_player1)
var check = (player.x > (x - 300) && player.x < (x + 300))
if (state == (136 << 0) && check && y <= (player.y + 60) && y >= (player.y - 60) && state != (82 << 0) && chargebuffer <= 0)
{
    state = (82 << 0)
    flash = 1
    sprite_index = spr_weeniesquire_charge
    chargebuffer = 80
    chargespeed = 6
    hitboxcreate = 1
    with (instance_create(x, y, obj_tackhitbox))
    {
        ID = other.id
        sprite_index = spr_weeniesquire_hitbox
    }
    if (x != player.x)
        image_xscale = sign(player.x - x)
}
if (state != (82 << 0) && chargebuffer > 0)
    chargebuffer--
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
