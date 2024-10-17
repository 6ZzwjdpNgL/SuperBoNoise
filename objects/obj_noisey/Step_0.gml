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

walkspr = (phase == 0 ? spr_noisey_walk : spr_noisey_bouncefall)
if (state == (136 << 0))
{
    if (object_index == obj_noisey && phase == 1)
    {
        if (grounded && sprite_index != spr_noisey_bounceland && vsp > 0)
        {
            image_index = 0
            sprite_index = spr_noisey_bounceland
        }
        if (sprite_index == spr_noisey_bounceland)
        {
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_noisey_bouncefall
            if (floor(image_index) == 4)
                vsp = -6
        }
    }
}
if (lasthp != hp && phase == 0 && state == (140 << 0) && grounded)
{
    lasthp = hp
    phase = 1
    stunned = 5
    killprotection = 0
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
if (hitboxcreate == 0 && state == (136 << 0))
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
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
