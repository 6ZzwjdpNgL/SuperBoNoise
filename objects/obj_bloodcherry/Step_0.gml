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
        movespeed = 0
        if (!grounded)
        {
            sprite_index = spr_cherry_fall
            if (!animation_end())
                image_speed = 0.35
            else
                image_index = image_number - 1
        }
        else
        {
            image_speed = 0.35
            if (sprite_index == spr_cherry_fall)
            {
                sprite_index = spr_cherry_land
                image_index = 0
            }
            if (sprite_index != spr_cherry_land || animation_end())
                sprite_index = spr_cherry_idle
        }
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
    case (94 << 0):
        hsp = 0
        if animation_end()
        {
            sprite_index = spr_cherry_spitstart
            throw_spr = spr_cherry_spitstart
            throw_frame = 1
            image_index = 0
            state = (131 << 0)
        }
        break
}

if (state != (94 << 0))
    scr_scareenemy()
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
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
if (bombreset > 0)
    bombreset--
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (bombreset <= 0 && (!(scr_solid_line_ext(x, targetplayer.y, targetplayer.x, targetplayer.y))) && grounded && x != targetplayer.x && state == (136 << 0) && sprite_index == walkspr && bbox_in_camera(view_camera[0]))
{
    if ((y - 30) < targetplayer.y)
    {
        sprite_index = spr_cherry_spitgrounded
        throw_spr = spr_cherry_spitgrounded
        throw_frame = 9
        image_index = 0
        image_xscale = (-(sign(x - targetplayer.x)))
        state = (131 << 0)
    }
    else
    {
        sprite_index = spr_cherry_jump
        image_index = 0
        image_xscale = (-(sign(x - targetplayer.x)))
        state = (94 << 0)
        vsp = -10
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
