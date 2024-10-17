mask_index = spr_player_mask
if (obj_player1.state == (86 << 0) && state != (86 << 0))
{
    storedstate = state
    storedsprite = sprite_index
    state = (86 << 0)
    instance_create(x, y, obj_tinytaunt)
    sprite_index = tauntspr
    image_index = irandom(sprite_get_number(tauntspr) - 1)
}
switch state
{
    case (136 << 0):
        sprite_index = movespr
        var _bbox_side = (image_xscale >= 1 ? bbox_right : bbox_left)
        if (place_meeting_collision((x + image_xscale), y, (1 << 0)) || place_meeting((x + image_xscale), y, obj_hallway) || (!(place_meeting_collision((_bbox_side + image_xscale), (y + 31)))))
            image_xscale *= -1
        hsp = image_xscale * 2
        break
    case (128 << 0):
        sprite_index = idlespr
        hsp = 0
        break
    case (86 << 0):
        hsp = 0
        vsp = 0
        if (obj_player1.state != (86 << 0))
        {
            state = storedstate
            sprite_index = storedsprite
        }
        break
}

vsp = 0
scr_collision()
