if (state != (6 << 0))
{
    with (obj_player1)
    {
        if (y < other.y && attacking == 0 && state == (94 << 0) && vsp > 0)
        {
            if (vsp > 0)
            {
                other.stunned = 200
                if (x != other.x)
                    other.image_xscale = (-(sign(other.x - x)))
                image_index = 0
                if input_check_pressed("jump")
                {
                    other.vsp = -5
                    other.hsp = (-other.image_xscale) * 3
                    instance_create(x, (y + 50), obj_stompeffect)
                    other.state = (140 << 0)
                    stompAnim = 1
                    other.image_index = 0
                    vsp = -14
                    sprite_index = spr_null
                }
                else
                {
                    other.vsp = -5
                    other.hsp = (-other.image_xscale) * 3
                    instance_create(x, (y + 50), obj_stompeffect)
                    other.state = (140 << 0)
                    stompAnim = 1
                    other.image_index = 0
                    vsp = -9
                    sprite_index = spr_null
                }
            }
        }
        if (state == (105 << 0))
        {
            instance_create(x, y, obj_bumpeffect)
            other.stunned = 40
            if (x != other.x)
                other.image_xscale = (-(sign(other.x - x)))
            other.vsp = -5
            other.hsp = (-other.image_xscale) * 3
            hsp = (-xscale) * 4
            vsp = -4
            machpunchAnim = 1
            if (x != other.x)
                other.image_xscale = (-(sign(other.x - x)))
            other.state = (140 << 0)
            image_index = 0
            state = (93 << 0)
        }
        if ((state == (106 << 0) || state == (81 << 0)) && other.grounded == true)
        {
            instance_create(x, y, obj_bumpeffect)
            other.vsp = -10
            other.hsp = xscale
            other.image_index = 0
            other.stunned = 200
            other.state = (140 << 0)
            machpunchAnim = 1
            if ((!grounded) && state != (110 << 0))
            {
                sprite_index = spr_player_mach2jump
                vsp = -10
            }
        }
        if (attacking == 1 && state != (106 << 0))
        {
            if (state == (123 << 0))
                other.shot = 1
            image_index = 0
            instance_destroy(other)
            machpunchAnim = 1
            if ((!grounded) && state != (110 << 0))
                vsp = -10
        }
        if (attacking == 0 && state != (93 << 0) && state != (109 << 0) && (!(y < other.y)) && grabbing == 0 && other.state != (140 << 0))
        {
            if (x != other.x)
            {
                other.image_xscale = (-(sign(other.x - x)))
                xscale = (-(sign(x - other.x)))
            }
            hsp = (-xscale) * 4
            vsp = -4
            other.image_xscale = (-xscale)
            other.hsp = (-other.image_xscale) * 4
            other.vsp = -4
            if (other.state == (136 << 0) || other.state == (132 << 0))
                other.state = (128 << 0)
            image_index = 0
            state = (108 << 0)
            if (other.state == (138 << 0))
                other.state = (128 << 0)
        }
    }
}
