with (other)
{
    if (state != (188 << 0) && state != (148 << 0))
    {
        var changecoord = 1
        if place_meeting(x, y, obj_superspring)
            changecoord = 0
        if changecoord
            y = other.y - 14
        vsp = 0
        create_particle(x, y, (5 << 0), 0)
        if (boxxed == 0 && isgustavo == 0)
        {
            if (character == "P")
            {
                if (sprite_index != spr_dashpadmach)
                {
                    sprite_index = spr_dashpadmach
                    image_index = 0
                    event_play_oneshot("event:/SFX/misc/dashpad", x, y)
                }
            }
            else if (character == "N")
            {
                if (sprite_index != spr_crazyrun)
                {
                    sprite_index = spr_crazyrun
                    image_index = 0
                }
            }
            machhitAnim = 0
            state = (123 << 0)
            xscale = sign(other.image_xscale)
            if (movespeed < 14)
            {
                movespeed = 14
                hsp = xscale * movespeed
            }
            else
            {
                movespeed += 0.5
                hsp = xscale * movespeed
            }
        }
        else
        {
            xscale = sign(other.image_xscale)
            if boxxed
            {
                boxxeddash = 1
                if (abs(movespeed) < 14)
                    movespeed = xscale * 14
                else
                    movespeed += (xscale * 0.5)
                sprite_index = spr_boxxedpepwalk
                state = (35 << 0)
            }
            if isgustavo
            {
                ratmount_movespeed = 12
                gustavodash = 51
                state = (193 << 0)
                if (abs(movespeed) < 12)
                    movespeed = other.image_xscale * 12
            }
        }
    }
}
