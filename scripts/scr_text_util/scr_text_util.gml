function create_transformation_tip(argument0, argument1) //create_transformation_tip
{
    if (argument1 == undefined)
        argument1 = -4
    ini_open_from_string(obj_savesystem.ini_str)
    if (argument1 != -4 && ini_read_real("Tip", argument1, false))
    {
        ini_close()
        return;
    }
    instance_destroy(obj_transfotip)
    var b = -4
    with (instance_create(0, 0, obj_transfotip))
    {
        text = argument0
        b = id
    }
    if (argument1 != -4)
        ini_write_real("Tip", argument1, true)
    obj_savesystem.ini_str = ini_close()
    return b;
}

function scr_compile_icon_text(argument0, argument1, argument2) //scr_compile_icon_text
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument2 == undefined)
        argument2 = false
    var arr = []
    var len = string_length(argument0)
    var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var char_x = 0
    var char_y = 0
    var saved_pos = 1
    while (argument1 <= len)
    {
        var start = argument1
        var char = string_ord_at(argument0, argument1)
        switch char
        {
            case 10:
                char_y += newline
                char_x = 0
                break
            case 123:
                var effect = string_copy(argument0, argument1, 3)
                var te = (1 << 0)
                argument1 += 3
                var n = scr_compile_icon_text(argument0, argument1, true)
                switch effect
                {
                    case "{s}":
                        te = (1 << 0)
                        break
                    case "{u}":
                        te = (2 << 0)
                        break
                }

                array_push(arr, [char_x, char_y, (2 << 0), te, n[0]])
                argument1 = n[1]
                char_x = n[2]
                char_y = n[3]
                break
            case 91:
                var button = string_copy(argument0, argument1, 3)
                var t = (1 << 0)
                var b = (0 << 0)
                switch button
                {
                    case "[D]":
                        b = (3 << 0)
                        break
                    case "[U]":
                        b = (0 << 0)
                        break
                    case "[M]":
                        b = (7 << 0)
                        break
                    case "[J]":
                        b = (8 << 0)
                        break
                    case "[G]":
                        b = (6 << 0)
                        break
                    case "[F]":
                        b = (4 << 0)
                        break
                    case "[B]":
                        b = (5 << 0)
                        break
                    case "[L]":
                        b = (1 << 0)
                        break
                    case "[R]":
                        b = (2 << 0)
                        break
                    case "[S]":
                        b = (9 << 0)
                        break
                    case "[T]":
                        b = (10 << 0)
                        break
                    case "[g]":
                        b = (11 << 0)
                        break
                    case "[s]":
                        b = (12 << 0)
                        break
                    case "[u]":
                        b = (13 << 0)
                        break
                    case "[d]":
                        b = (16 << 0)
                        break
                    case "[l]":
                        b = (14 << 0)
                        break
                    case "[r]":
                        b = (15 << 0)
                        break
                    case "[c]":
                        b = (17 << 0)
                        break
                    case "[b]":
                        b = (18 << 0)
                        break
                    case "[q]":
                        b = (20 << 0)
                        break
                    case "[x]":
                        b = (19 << 0)
                        break
                    case "[p]":
                        b = (21 << 0)
                        break
                    case "[y]":
                        b = (22 << 0)
                        break
                }

                array_push(arr, [char_x, char_y, t, b])
                char_x += 32
                argument1 += 2
                break
            case 47:
                if argument2
                {
                    saved_pos = argument1
                    argument1 = len + 1
                }
                break
            default:
                while ((argument1 + 1) <= len)
                {
                    char = string_ord_at(argument0, (argument1 + 1))
                    if (char != 91 && char != 10 && char != 123 && char != 47)
                        argument1 += 1
                    else
                        break
                }
                n = string_copy(argument0, start, (argument1 - start + 1))
                array_push(arr, [char_x, char_y, (0 << 0), n])
                char_x += string_width(n)
                break
        }

        argument1 += 1
    }
    if argument2
        return [arr, saved_pos, char_x, char_y];
    return arr;
}

function scr_text_arr_size(argument0) //scr_text_arr_size
{
    var w = 0
    var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var h = newline
    for (var i = 0; i < array_length(argument0); i++)
    {
        var b = argument0[i]
        var cx = b[0]
        var cy = b[1]
        var t = b[2]
        var val = b[3]
        switch t
        {
            case (1 << 0):
                if ((cx + 32) > w)
                    w += 32
                break
            case (2 << 0):
                var val2 = b[4]
                var q = scr_text_arr_size(val2)
                if ((cy + q[1]) > h)
                    h += (q[1] - newline)
                else if ((cx + q[0]) > w)
                    w += q[0]
                break
            case (0 << 0):
                if (cy > h)
                    h += newline
                else
                {
                    var sw = string_width(val)
                    if ((cx + sw) > w)
                        w += string_width(val)
                }
                break
        }

    }
    return [w, h];
}

function scr_draw_granny_texture(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) //scr_draw_granny_texture
{
    if (argument6 == undefined)
        argument6 = smb2secret_bg
    if (argument7 == undefined)
        argument7 = smb2secret_bg
    if (argument8 == undefined)
        argument8 = spr_grannybubble
    var w = sprite_get_width(argument8) * argument2
    var h = sprite_get_height(argument8) * argument3
    if (!surface_exists(surfclip))
        surfclip = surface_create(w, h)
    if (!surface_exists(surffinal))
        surffinal = surface_create(w, h)
    surface_set_target(surfclip)
    draw_clear_alpha(c_black, 0)
    draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, false)
    gpu_set_blendmode(bm_subtract)
    draw_sprite_ext(argument8, 0, 0, 0, argument2, argument3, 0, c_white, 1)
    reset_blendmode()
    surface_reset_target()
    surface_set_target(surffinal)
    draw_sprite_tiled(argument6, 0, argument4, argument5)
    draw_sprite_tiled(argument7, 0, (-argument4), ((-argument5) / 2))
    gpu_set_blendmode(bm_subtract)
    draw_surface(surfclip, 0, 0)
    reset_blendmode()
    surface_reset_target()
    draw_surface(surffinal, argument0, argument1)
}

function scr_draw_text_arr(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //scr_draw_text_arr
{
    if (argument3 == undefined)
        argument3 = c_white
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = (0 << 0)
    if (argument6 == undefined)
        argument6 = noone
    if (argument2 == -4)
        return;
    for (var i = 0; i < array_length(argument2); i++)
    {
        var b = argument2[i]
        var cx = argument0 + b[0]
        var cy = argument1 + b[1]
        var t = b[2]
        var val = b[3]
        switch t
        {
            case (1 << 0):
                var icon = noone
                switch val
                {
                    case (3 << 0):
                        icon = self.tdp_get_tutorial_icon("player_down")
                        break
                    case (0 << 0):
                        icon = self.tdp_get_tutorial_icon("player_up")
                        break
                    case (1 << 0):
                        icon = self.tdp_get_tutorial_icon("player_left")
                        break
                    case (2 << 0):
                        icon = self.tdp_get_tutorial_icon("player_right")
                        break
                    case (7 << 0):
                        icon = self.tdp_get_tutorial_icon("player_attack")
                        break
                    case (8 << 0):
                        icon = self.tdp_get_tutorial_icon("player_jump")
                        break
                    case (6 << 0):
                        icon = self.tdp_get_tutorial_icon("player_slap")
                        break
                    case (10 << 0):
                        icon = self.tdp_get_tutorial_icon("player_taunt")
                        break
                    case (11 << 0):
                        if ((!global.gamepad_groundpound) && obj_inputAssigner.player_input_device[0] >= 0)
                            icon = self.tdp_get_tutorial_icon("player_groundpound")
                        else
                            icon = self.tdp_get_tutorial_icon("player_down")
                        break
                    case (12 << 0):
                        if ((!global.gamepad_superjump) && obj_inputAssigner.player_input_device[0] >= 0)
                            icon = self.tdp_get_tutorial_icon("player_superjump")
                        else
                            icon = self.tdp_get_tutorial_icon("player_up")
                        break
                    case (4 << 0):
                        if (instance_exists(obj_player1) && obj_player1.xscale < 0)
                            icon = self.tdp_get_tutorial_icon("player_left")
                        else
                            icon = self.tdp_get_tutorial_icon("player_right")
                        break
                    case (5 << 0):
                        if (instance_exists(obj_player1) && obj_player1.xscale > 0)
                            icon = self.tdp_get_tutorial_icon("player_left")
                        else
                            icon = self.tdp_get_tutorial_icon("player_right")
                        break
                    case (14 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_left")
                        break
                    case (15 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_right")
                        break
                    case (13 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_up")
                        break
                    case (16 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_down")
                        break
                    case (17 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_select")
                        break
                    case (20 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_quit")
                        break
                    case (19 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_delete")
                        break
                    case (18 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_back")
                        break
                    case (21 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_start")
                        break
                    case (22 << 0):
                        icon = self.tdp_get_tutorial_icon("menu_reset_binds")
                        break
                }

                if (argument5 != (0 << 0))
                {
                    switch argument5
                    {
                        case (1 << 0):
                            cx += irandom_range(-2, 2)
                            cy += irandom_range(-2, 2)
                            break
                        case (2 << 0):
                            var o = 1
                            if (argument6 != noone)
                                o = argument6.offset
                            var d = ((i % 2) == 0 ? -1 : 1)
                            var _dir = floor(Wave(-1, 1, 0.1, 0))
                            cy += (_dir * d * o)
                            break
                    }

                }
                if (icon != noone)
                {
                    draw_sprite(icon.sprite_index, icon.image_index, cx, cy)
                    if (icon.str != "")
                    {
                        var f = draw_get_font()
                        draw_set_halign(fa_center)
                        draw_set_valign(fa_middle)
                        draw_set_font(global.grannyfont)
                        draw_text_color((cx + 16), (cy + 14), icon.str, c_black, c_black, c_black, c_black, argument4)
                        draw_set_font(f)
                        draw_set_halign(fa_left)
                        draw_set_valign(fa_top)
                    }
                }
                break
            case (2 << 0):
                var val2 = b[4]
                scr_draw_text_arr(cx, cy, val2, argument3, argument4, val)
                break
            case (0 << 0):
                if (argument5 == (0 << 0))
                    draw_text_color(cx, cy, val, argument3, argument3, argument3, argument3, argument4)
                else
                {
                    var x2 = 0
                    switch argument5
                    {
                        case (1 << 0):
                            for (var j = 1; j <= string_length(val); j++)
                            {
                                var q = string_char_at(val, j)
                                var s1 = irandom_range(-1, 1)
                                var s2 = irandom_range(-1, 1)
                                draw_text_color((cx + x2 + s1), (cy + s2), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                        case (2 << 0):
                            for (j = 1; j <= string_length(val); j++)
                            {
                                q = string_char_at(val, j)
                                var s = 0
                                o = 1
                                if (argument6 != noone)
                                    o = argument6.offset
                                d = ((j % 2) == 0 ? -1 : 1)
                                _dir = floor(Wave(-1, 1, 0.1, 0))
                                s += (_dir * d * o)
                                draw_text_color((cx + x2), (cy + s), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                    }

                }
                break
        }

    }
}

function reset_blendmode() //reset_blendmode
{
    gpu_set_blendmode(bm_normal)
}

