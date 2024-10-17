if (room == rm_blank)
    return;
if (bombreset > 0)
    bombreset--
switch state
{
    case (136 << 0):
        if (substate_buffer > 0)
            substate_buffer--
        else
        {
            substate_buffer = substate_max
            var old_substate = substate
            while (substate == old_substate)
                substate = choose((136 << 0), (128 << 0), (132 << 0))
            if (substate == (136 << 0))
                image_xscale = choose(-1, 1)
            else if (substate == (132 << 0))
            {
                sprite_index = spr_pizzaslug_turn
                image_index = 0
                hsp = 0
            }
        }
        switch substate
        {
            case (136 << 0):
                image_speed = 0.35
                if (sprite_index != spr_pizzaslug_walk)
                {
                    image_index = 0
                    sprite_index = spr_pizzaslug_walk
                }
                scr_enemy_walk()
                break
            case (128 << 0):
                image_speed = 0.35
                hsp = 0
                sprite_index = spr_pizzaslug_idle
                break
            case (132 << 0):
                image_speed = 0.35
                substate_buffer = 5
                if (sprite_index == spr_pizzaslug_turn && floor(image_index) == (image_number - 1))
                {
                    image_xscale *= -1
                    substate_buffer = substate_max
                    substate = (128 << 0)
                    sprite_index = spr_pizzaslug_idle
                }
                break
            case (131 << 0):
                state = (131 << 0)
                substate_buffer = 0
                image_index = 0
                sprite_index = spr_pizzaslug_cough
                break
        }

        break
    case (128 << 0):
        scr_enemy_idle()
        break
    case (132 << 0):
        scr_enemy_turn()
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
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
var player = instance_nearest(x, y, obj_player1)
if (state == (136 << 0))
{
    if (player.x > (x - 400) && player.x < (x + 400) && y <= (player.y + 60) && y >= (player.y - 60) && ragecooldown == 0)
    {
        if elite
        {
            if (x != player.x)
                image_xscale = (-(sign(x - player.x)))
            image_speed = 0.6
            hsp = 0
            shot = 0
            sprite_index = spr_pizzaslug_rage
            image_index = 0
            state = (127 << 0)
            flash = 1
            alarm[4] = 5
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
        }
        else
        {
            if (x != player.x)
                image_xscale = (-(sign(x - player.x)))
            ragecooldown = 160
            state = (131 << 0)
            substate_buffer = 0
            image_index = 0
            sprite_index = spr_pizzaslug_cough
        }
    }
}
if (ragecooldown > 0)
    ragecooldown--
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
