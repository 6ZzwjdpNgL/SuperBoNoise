if (room == rm_blank)
    return;
var targetplayer = instance_nearest(x, y, obj_player1)
switch state
{
    case (128 << 0):
        if (sprite_index != scaredspr)
        {
            sprite_index = spr_pepbat_idle
            if (targetplayer.x > (x - 150) && targetplayer.x < (x + 150) && targetplayer.y > y && targetplayer.y < (y + 200))
            {
                state = (136 << 0)
                hit = 0
            }
        }
        else
        {
            hsp = 0
            vsp = 0
            if (scaredbuffer > 0)
                scaredbuffer--
            else
                sprite_index = spr_pepbat_idle
        }
        break
    case (130 << 0):
        scr_enemy_charge()
        break
    case (132 << 0):
        sprite_index = spr_pepbat_move
        var dir = point_direction(x, y, xstart, ystart)
        x = approach(x, xstart, abs(lengthdir_x(5, dir)))
        y = approach(y, ystart, abs(lengthdir_y(5, dir)))
        if (xstart != x)
            image_xscale = sign(xstart - x)
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            x = xstart
            y = ystart
            state = (128 << 0)
        }
        break
    case (136 << 0):
        vsp = 0
        hsp = 0
        sprite_index = spr_pepbat_move
        if (targetplayer.x != x)
            image_xscale = sign(targetplayer.x - x)
        if (!((targetplayer.x > (x - 70) && targetplayer.x < (x + 70) && y <= (targetplayer.y + 29) && y >= (targetplayer.y - 29))))
        {
            dir = point_direction(x, y, targetplayer.x, targetplayer.y)
            x += lengthdir_x(3, dir)
            y += lengthdir_y(3, dir)
        }
        if (hit || distance_to_point(xstart, ystart) > 800)
        {
            hit = 0
            state = (132 << 0)
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
        hit = 1
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
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
scr_scareenemy()
if (bombreset > 0)
    bombreset--
targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (x != targetplayer.x && state == (136 << 0) && state != (131 << 0) && obj_player1.state != (7 << 0) && bombreset <= 0 && grounded)
{
    if (targetplayer.x > (x - 80) && targetplayer.x < (x + 80) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
    {
        if (state == (136 << 0))
        {
            image_index = 0
            sprite_index = spr_pepbat_kick
            image_xscale = (-(sign(x - targetplayer.x)))
            state = (131 << 0)
        }
    }
}
if (grounded && state == (131 << 0) && floor(image_index) == 3)
    vsp = -5
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
