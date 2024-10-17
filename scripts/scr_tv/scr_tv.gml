function tv_set_idle() //tv_set_idle
{
    with (obj_tv)
    {
        state = (2 << 0)
        sprite_index = spr_tv_idle
    }
}

function tv_reset() //tv_reset
{
    with (obj_tv)
    {
        state = (2 << 0)
        sprite_index = spr_tv_idle
        ds_list_clear(tvprompts_list)
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = false
        switch argument1
        {
            case (0 << 0):
                play = true
                ds_list_insert(tvprompts_list, 0, b)
                break
            case (1 << 0):
                var placed = false
                var i = 0
                while (i < ds_list_size(tvprompts_list))
                {
                    var b2 = ds_list_find_value(tvprompts_list, i)
                    if (b2[1] == (2 << 0))
                    {
                        if (i == 0)
                            play = true
                        ds_list_insert(tvprompts_list, i, b)
                        placed = true
                        break
                    }
                    else
                        i++
                }
                if (!placed)
                    ds_list_add(tvprompts_list, b)
                break
            case (2 << 0):
                ds_list_add(tvprompts_list, b)
                break
        }

        if play
            state = (2 << 0)
    }
}

function tv_push_prompt_array(argument0) //tv_push_prompt_array
{
    for (var i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            var b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
}

function tv_push_prompt_once(argument0, argument1) //tv_push_prompt_once
{
    with (obj_tv)
    {
        if (special_prompts == -4)
            return false;
        var b = ds_map_find_value(special_prompts, argument1)
        if is_undefined(b)
            return false;
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3])
            ds_map_set(special_prompts, argument1, 1)
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Prompts", argument1, 1)
            obj_savesystem.ini_str = ini_close()
            return true;
        }
        return false;
    }
}

function tv_default_condition() //tv_default_condition
{
    return place_meeting(x, y, obj_player1);
}

function tv_do_expression(argument0) //tv_do_expression
{
    with (obj_tv)
    {
        if (expressionsprite != argument0 && bubblespr == -4)
        {
            state = (252 << 0)
            expressionsprite = argument0
            switch expressionsprite
            {
                case spr_tv_exprhurt:
                    expressionbuffer = 60
                    break
                case spr_tv_exprcollect:
                    expressionbuffer = 150
                    if chance(50)
                        fmod_event_play(obj_player1.voice_collect)
                    if obj_player1.isgustavo
                        expressionsprite = spr_null
                    break
                case spr_tv_exprsecret:
                    expressionbuffer = 150
                    break
                case spr_tv_exprheatcomboend:
                    expressionbuffer = 90
                    break
            }

        }
    }
}

function scr_tv_get_transfo_sprite() //scr_tv_get_transfo_sprite
{
    var _state = (2 << 0)
    var _tauntstate = (2 << 0)
    var _sp = spr_null
    var _player = noone
    with (obj_player1)
    {
        _state = state
        _tauntstate = tauntstoredstate
        _sp = sprite_index
        _player = id
    }
    if (_state == (86 << 0) || _state == (63 << 0))
        _state = _tauntstate
    var _spr = spr_null
    switch _state
    {
        case (7 << 0):
            if (_sp == _player.spr_tumble || _sp == _player.spr_tumblestart || _sp == _player.spr_tumbleend)
                _spr = spr_null
            break
        case (270 << 0):
        case (271 << 0):
        case (272 << 0):
            _spr = spr_tv_fish
            break
        case (61 << 0):
            if (_sp == _player.spr_squished)
                _spr = spr_null
            break
        case (2 << 0):
        case (94 << 0):
        case (44 << 0):
        case (102 << 0):
        case (95 << 0):
            with (_player)
            {
                if (sprite_index == spr_breakdancesuper || sprite_index == spr_playerN_breakdance || sprite_index == spr_player_breakdance)
                    _spr = spr_tv_exprbreakdance
            }
            break
        case (124 << 0):
        case (110 << 0):
        case (113 << 0):
            if _player.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (68 << 0):
        case (73 << 0):
        case (59 << 0):
        case (72 << 0):
        case (69 << 0):
        case (70 << 0):
            _spr = spr_tv_shotgun
            break
        case (35 << 0):
        case (37 << 0):
        case (36 << 0):
        case (106 << 0):
        case (39 << 0):
        case (67 << 0):
        case (23 << 0):
        case (26 << 0):
        case (27 << 0):
        case (31 << 0):
        case (32 << 0):
        case (186 << 0):
        case (150 << 0):
        case (115 << 0):
        case (18 << 0):
        case (19 << 0):
        case (49 << 0):
        case (50 << 0):
        case (40 << 0):
        case (53 << 0):
        case (12 << 0):
            _spr = spr_null
            break
        case (74 << 0):
            if global.mort
                _spr = spr_null
            break
        case (80 << 0):
            if _player.skateboarding
                _spr = spr_null
            break
    }

    return _spr;
}

function scr_tv_get_bg() //scr_tv_get_bg
{
    var tvbg = spr_tv_bg
    var layarr = layer_get_all()
    var bgsprites = []
    for (var i = 0; i < array_length(layarr); i++)
    {
        var n = layer_get_name(layarr[i])
        if (string_lower(string_copy(n, 1, 4)) == "back")
            array_push(bgsprites, layer_background_get_sprite(layer_background_get_id_fixed(layarr[i])))
    }
    switch global.leveltosave
    {
        case "midway":
            tvbg = spr_tv_bg_midway1
            if array_contains_any(bgsprites, [bg_midwayunderground, bg_midwayundergroundPANIC, bg_midwayundergroundwall])
                tvbg = spr_tv_bg_midway2
            if array_contains_any(bgsprites, [bg_midwaysky1, bg_midwaysky1PANIC, bg_midwaysky2, bg_midwaysky2PANIC, bg_midwaysky3, bg_midwaysky3PANIC])
                tvbg = spr_tv_bg_midway3
            break
        case "fish":
            tvbg = spr_tv_bg_water1
            if array_contains_any(bgsprites, [bg_caveback, bg_cavebackPANIC, bg_cavemiddle, bg_cavemiddlePANIC, bg_cavesky, bg_cavesky_PANIC, bg_cavewater, bg_cavewaterPANIC])
                tvbg = spr_tv_bg_water2
            if array_contains_any(bgsprites, [bg_water_BG3BACK, bg_water_BG3BACKESCAPE, bg_water_BG3FRONT, bg_water_BG3FRONTESCAPE, bg_water_BG3MID, bg_water_BG3MidESCAPE])
                tvbg = spr_tv_bg_water3
            break
        case "wahoo":
            tvbg = spr_tv_bg_mario2
            break
    }

    if global.inSecret
        tvbg = spr_tv_bg_secret
    return tvbg;
}

