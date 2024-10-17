if (room == rm_blank)
    return;
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
switch state
{
    case (128 << 0):
        scr_enemy_idle()
        break
    case (132 << 0):
        scr_enemy_turn()
        break
    case (136 << 0):
        movespeed = 3
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
    case (143 << 0):
        if (sprite_index == spr_twoliter_tipover && animation_end(undefined, 6))
        {
            image_index = image_number - 1
            if grounded
            {
                vsp = -8
                image_index = 0
                sprite_index = spr_twoliter_fall
                if ((-(sign(x - targetplayer.x))) != 0)
                    image_xscale = (-(sign(x - targetplayer.x)))
                var _dist = point_distance(x, 0, targetplayer.x, 0)
                hsp = image_xscale * (clamp((_dist / 32), 3, 10))
                event_play_oneshot("event:/SFX/enemies/charge", x, y)
                bombreset = 100
            }
        }
        if (sprite_index == spr_twoliter_fall)
        {
            if (_afterimage > 0)
                _afterimage--
            else
            {
                _afterimage = 8
                create_red_afterimage(x, y, sprite_index, (image_index - 1), xscale)
            }
        }
        if (grounded && vsp >= 0 && sprite_index == spr_twoliter_fall)
        {
            state = (140 << 0)
            stunned = 10
        }
        movespeed = 0
        image_speed = 0.35
        break
}

if (state != (143 << 0))
    scr_scareenemy()
if (thrown == true)
{
    if (hitvsp == 0)
    {
        explodeInstant = false
        instance_destroy()
    }
    else
        explodeInstant = true
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
if (bombreset > 0)
    bombreset--
if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 150) && y >= (targetplayer.y - 60))
{
    if (bombreset <= 0)
    {
        if (state == (136 << 0))
        {
            hsp = 0
            vsp = -2
            image_index = 0
            sprite_index = spr_twoliter_tipover
            state = (143 << 0)
            if ((-(sign(x - targetplayer.x))) != 0)
                image_xscale = (-(sign(x - targetplayer.x)))
        }
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
if (state == (143 << 0) && sprite_index == spr_twoliter_fall)
{
    if (hitboxcreate == 0)
    {
        hitboxcreate = 1
        with (instance_create(x, y, obj_tackhitbox))
            ID = other.id
    }
}
