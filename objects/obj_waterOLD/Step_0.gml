if place_meeting(x, (y - 1), obj_player1)
{
    with (obj_player1)
    {
        if (state != (188 << 0) && state != (212 << 0) && state != (211 << 0) && state != (123 << 0) && state != (149 << 0) && sprite_index != spr_mach3boost)
        {
            if place_meeting(x, (y + 1), other)
            {
                if (state != (213 << 0))
                {
                    scr_losepoints()
                    image_index = 0
                    state = (11 << 0)
                    movespeed = hsp
                    vsp = -14
                    instance_create(x, (y + 20), obj_piranneapplewater)
                    sprite_index = spr_scaredjump1
                    with (instance_create(x, y, obj_superdashcloud))
                        sprite_index = spr_watereffect
                }
                else
                {
                    vsp = -6
                    sprite_index = spr_player_jumpdive1
                    image_index = 0
                }
            }
        }
    }
}
with (instance_place(x, (y - 1), obj_baddie))
    instance_destroy()
