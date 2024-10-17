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
if (state == (136 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (136 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (140 << 0))
    grav = 0.5
else
    grav = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state != (130 << 0))
    scr_scareenemy()
if (sprite_index == spr_null && floor(image_index) == (image_number - 1))
{
    if (hitboxcreate == 0 && state == (130 << 0))
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_tackhitbox))
            ID = other.id
    }
    sprite_index = spr_null
    movespeed = 10
}
var player = instance_nearest(x, y, obj_player1)
if (ragebuffer > 0)
    ragebuffer--
if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && important == 0)
{
    if (state != (127 << 0) && ragebuffer == 0 && elite && (state == (136 << 0) || state == (130 << 0)))
    {
        state = (127 << 0)
        sprite_index = spr_null
        if (x != player.x)
            image_xscale = (-(sign(x - player.x)))
        ragebuffer = 100
        image_index = 0
        image_speed = 0.5
        flash = 1
        alarm[4] = 5
        with (instance_create(x, y, obj_tackhitbox))
        {
            sprite_index = spr_bighitbox
            mask_index = spr_bighitbox
            ID = other.id
        }
        create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    }
    else if (x != player.x && state != (130 << 0) && y == ystart && important == 0)
    {
        if (state == (136 << 0))
        {
            image_index = 0
            image_xscale = (-(sign(x - obj_player1.x)))
            state = (130 << 0)
            sprite_index = spr_null
        }
    }
}
if (state == (140 << 0) || state == (136 << 0))
    movespeed = 0
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
