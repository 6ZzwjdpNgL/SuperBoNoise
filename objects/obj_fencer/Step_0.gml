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

if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
scr_scareenemy()
var player = instance_nearest(x, y, obj_player1)
if (ragebuffer > 0)
    ragebuffer--
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60))
{
    if (state != (127 << 0) && ragebuffer == 0 && elite && (state == (136 << 0) || state == (130 << 0)))
    {
        event_play_oneshot("event:/SFX/enemies/charge", x, y)
        state = (127 << 0)
        sprite_index = spr_fencer_rage
        if (x != player.x)
            image_xscale = (-(sign(x - player.x)))
        ragebuffer = 100
        image_index = 0
        image_speed = 0.5
        flash = 1
        alarm[4] = 5
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    }
    else if (x != player.x && grounded)
    {
        if (state == (136 << 0) && charging == 0)
        {
            with (instance_create(x, y, obj_tackhitbox))
                ID = other.id
            charging = 1
            state = (130 << 0)
            movespeed = 5
            vsp = -7
            event_play_oneshot("event:/SFX/enemies/charge", x, y)
            sprite_index = spr_fencer_chargestart
        }
    }
}
if (state == (140 << 0) || state == (136 << 0))
{
    charging = 0
    movespeed = 0
}
if (sprite_index == spr_fencer_chargestart && floor(image_index) == (image_number - 1))
    sprite_index = spr_fencer_charge
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (hitboxcreate == 0 && (state == (136 << 0) || state == (127 << 0) || state == (130 << 0)))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_tackhitbox))
        ID = other.id
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
        baddieID = other.id
        other.boundbox = 1
    }
}
