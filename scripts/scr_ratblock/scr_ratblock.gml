function scr_ratblock_destroy() //scr_ratblock_destroy
{
    with (obj_player1)
    {
        if ((other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big) && sprite_index == spr_tumble && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other)))
            instance_destroy(other)
        if (state != (13 << 0) && state != (54 << 0) && ((!scr_transformationcheck()) || state == (115 << 0)) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other) || place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other)))
        {
            switch state
            {
                case (115 << 0):
                    if (!(place_meeting(x, (y - 12), other)))
                        instance_destroy(other)
                    break
                case (53 << 0):
                    if (sprite_index != spr_bombpepend && sprite_index != spr_bombpepintro)
                    {
                        instance_create(x, y, obj_bombexplosion)
                        instance_destroy(other)
                        gamepad_vibrate_constant(1, 0.9)
                        hurted = 1
                        vsp = -4
                        image_index = 0
                        sprite_index = spr_bombpepend
                        state = (53 << 0)
                        bombpeptimer = 0
                    }
                    break
                case (188 << 0):
                case (152 << 0):
                case (148 << 0):
                case (35 << 0):
                case (36 << 0):
                case (37 << 0):
                case (49 << 0):
                case (51 << 0):
                    break
                case (7 << 0):
                    if (other.sprite_index == spr_rattumbleblock || other.sprite_index == spr_rattumbleblock_big)
                        instance_destroy(other)
                    break
                default:
                    if (other.sprite_index != spr_rattumbleblock && other.sprite_index != spr_rattumbleblock_big)
                        instance_destroy(other)
            }

        }
    }
}

