function scr_collide_destructibles() //scr_collide_destructibles
{
    with (obj_player1)
    {
        if ((state == (94 << 0) && sprite_index == spr_null) || state == (58 << 0) || state == (167 << 0) || state == (33 << 0) || state == (189 << 0) || state == (271 << 0) || state == (200 << 0) || (state == (60 << 0) && pogochargeactive == 1))
        {
            var arr = [[xscale, 0], [(hsp + xscale), 0], [0, (vsp + 1)], [0, (vsp - 1)], [0, 1], [0, -1]]
            for (var i = 0; i < array_length(arr); i++)
            {
                var b = arr[i]
                scr_destroy_destructibles(b[0], b[1])
            }
        }
        if (state == (7 << 0))
        {
            with (instance_place((x + xscale), y, obj_rollblock))
                instance_destroy()
        }
        if (state == (195 << 0) && place_meeting((x + hsp), y, obj_gustavodestroyable))
        {
            with (instance_place((x + hsp), y, obj_gustavodestroyable))
            {
                gamepad_vibrate_constant(0.8, 0.5)
                instance_destroy()
            }
        }
        if (state == (213 << 0) || state == (36 << 0) || ratmount_movespeed == 12 || state == (104 << 0) || state == (67 << 0) || state == (106 << 0) || state == (82 << 0) || state == (261 << 0) || state == (203 << 0) || state == (82 << 0) || state == (44 << 0) || state == (195 << 0) || state == (45 << 0) || state == (23 << 0) || state == (55 << 0) || state == (186 << 0) || state == (72 << 0) || state == (126 << 0) || state == (96 << 0) || state == (22 << 0) || sprite_index == spr_barrelroll || state == (43 << 0) || state == (123 << 0) || state == (49 << 0) || state == (67 << 0) || state == (40 << 0) || state == (50 << 0) || state == (7 << 0) || state == (21 << 0) || state == (155 << 0))
        {
            if place_meeting((x + hsp), y, obj_destructibles)
            {
                with (instance_place((x + hsp), y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5)
                    instance_destroy()
                }
                if (state == (106 << 0))
                    machpunchAnim = 0
            }
        }
        if (state == (109 << 0) && thrown == true)
        {
            if place_meeting((x - hsp), y, obj_destructibles)
            {
                with (instance_place((x - hsp), y, obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5)
                    instance_destroy()
                }
            }
        }
        if ((state == (49 << 0) || state == (256 << 0) || state == (12 << 0) || state == (167 << 0) || state == (78 << 0) || state == (21 << 0) || (state == (56 << 0) && bombup_dir == 1)) && vsp > 0)
        {
            if place_meeting(x, (y + 1), obj_destructibles)
            {
                with (instance_place(x, (y + 1), obj_destructibles))
                {
                    gamepad_vibrate_constant(0.8, 0.5)
                    instance_destroy()
                }
                if (state == (12 << 0) || state == (256 << 0))
                {
                    with (instance_place(x, (y + 1), obj_tntblock))
                    {
                        gamepad_vibrate_constant(0.8, 0.5)
                        instance_destroy()
                    }
                    if (vsp > -11)
                        vsp = -11
                    jumpstop = 0
                }
            }
        }
        var num = instance_place_list(x, (y + 1), obj_destructibleplatform, global.instancelist, 0)
        for (var k = 0; k < num; k++)
        {
            with (ds_list_find_value(global.instancelist, k))
            {
                falling = 1
                if (falling == 1)
                    image_speed = 0.35
            }
        }
        ds_list_clear(global.instancelist)
        if (vsp <= 0.5 && (state == (94 << 0) || state == (194 << 0) || state == (123 << 0) || state == (106 << 0) || state == (267 << 0) || state == (60 << 0) || (state == (56 << 0) && bombup_dir == -1) || state == (82 << 0) || state == (39 << 0) || state == (11 << 0) || state == (99 << 0) || state == (24 << 0) || state == (123 << 0) || (state == (82 << 0) && (sprite_index == spr_player_breakdanceuppercut || sprite_index == spr_player_breakdanceuppercutend))))
        {
            var vy = -1
            if place_meeting(x, (y + vy), obj_destructibles)
            {
                with (instance_place(x, (y + vy), obj_destructibles))
                {
                    gamepad_vibrate_constant(1, 0.5)
                    instance_destroy()
                    with (other)
                    {
                        if (state != (99 << 0) && state != (82 << 0) && state != (39 << 0))
                            vsp = 0
                        if (state == (99 << 0))
                            vsp = -11
                    }
                }
            }
        }
        if (vsp >= 0 && (state == (110 << 0) || state == (78 << 0) || state == (113 << 0) || state == (199 << 0) || (state == (200 << 0) && vsp >= 0) || (state == (167 << 0) && vsp >= 10)))
        {
            scr_destroy_destructibles(0, (vsp + 2))
            scr_destroy_destructibles(0, vsp)
            scr_destroy_destructibles(0, 2)
            scr_destroy_destructibles(0, 1)
        }
        if (state == (110 << 0) || state == (78 << 0) || state == (113 << 0) || state == (167 << 0))
        {
            if (freefallsmash >= 10 || state == (167 << 0))
            {
                scr_destroy_destructibles(0, (vsp + 2), obj_metalblock)
                scr_destroy_destructibles(0, vsp, obj_metalblock)
                scr_destroy_destructibles(0, 2, obj_metalblock)
                scr_destroy_destructibles(0, 1, obj_metalblock)
            }
        }
    }
}

