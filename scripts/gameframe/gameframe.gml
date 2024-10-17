global.mq_game_frame_button = [undefined, undefined, undefined, undefined, 0, 0, 0, undefined, undefined, undefined, 0, undefined, 0, undefined, undefined, undefined];
global.mq_gameframe_delayed_item = [undefined, undefined, 0, undefined, undefined, undefined, undefined];
global.gameframe_std_haxe_type_markerValue = [];
(function()
{
    global.mt_game_frame_button = new gameframe_std_haxe_class(7, "game_frame_button");
    global.mt_gameframe_delayed_item = new gameframe_std_haxe_class(8, "gameframe_delayed_item");
    global.mt_gameframe_std_haxe_class = new gameframe_std_haxe_class(-1, "gameframe_std_haxe_class");
})();

function gameframe_log(argument0)
{
    var _s, __g, _arg;
    
    if (!global.gameframe_debug)
        exit;
    
    _s = "[Gameframe]";
    __g = 0;
    
    while (__g < argument_count)
    {
        _arg = argument[__g];
        __g++;
        _s += (" " + gameframe_std_Std_stringify(_arg));
    }
    
    show_debug_message(_s);
}

function gameframe_update()
{
    var _mx, _my, _gw, _gh, __borderWidth, __titleHeight, __buttons_x, __flags, __titleHit, __hitSomething, _resizePadding, __cursor, __now;
    
    if (!global.gameframe_is_ready)
        exit;
    
    global.gameframe_effective_scale = display_get_dpi_x() / 96 / global.gameframe_dpi_scale;
    global.gameframe_mouse_over_frame = false;
    gameframe_delayed_update();
    gameframe_cover_ensure();
    
    if (window_get_fullscreen() || global.gameframe_isFullscreen_hx)
    {
        gameframe_tools_keyctl_reset();
        exit;
    }
    
    gameframe_tools_keyctl_update();
    
    if (!global.gameframe_isMaximized_hx && global.gameframe_has_native_extension && global.gameframe_delayed_frame_index > 3 && !gameframe_get_shadow())
        gameframe_set_shadow(true);
    
    _mx = window_mouse_get_x() | 0;
    _my = window_mouse_get_y() | 0;
    _gw = window_get_width();
    _gh = window_get_height();
    __borderWidth = global.gameframe_isMaximized_hx ? 0 : global.gameframe_border_width;
    __titleHeight = gameframe_caption_get_height();
    __buttons_x = gameframe_button_get_combined_offset(_gw);
    __flags = 0;
    __titleHit = false;
    __hitSomething = true;
    _resizePadding = global.gameframe_resize_padding;
    
    if (!point_in_rectangle(_mx, _my, __buttons_x, __borderWidth, _gw - __borderWidth - (global.gameframe_isMaximized_hx ? 0 : _resizePadding), __borderWidth + __titleHeight))
    {
        if (!global.gameframe_isMaximized_hx && global.gameframe_can_resize && !point_in_rectangle(_mx, _my, _resizePadding, _resizePadding, _gw - _resizePadding, _gh - _resizePadding))
        {
            if (_mx < _resizePadding)
                __flags |= 1;
            
            if (_my < _resizePadding)
                __flags |= 2;
            
            if (_mx >= (_gw - _resizePadding))
                __flags |= 4;
            
            if (_my >= (_gh - _resizePadding))
                __flags |= 8;
        }
        else if (point_in_rectangle(_mx, _my, 0, 0, _gw, __titleHeight))
        {
            __titleHit = true;
        }
        else
        {
            __hitSomething = false;
        }
    }
    
    global.gameframe_mouse_over_frame = __hitSomething;
    
    if (global.gameframe_drag_flags == 0)
    {
        __cursor = global.gameframe_default_cursor;
        
        if (global.gameframe_can_input && global.gameframe_can_resize)
        {
            switch (__flags)
            {
                case 1:
                case 4:
                    __cursor = -9;
                    break;
                
                case 2:
                case 8:
                    __cursor = -7;
                    break;
                
                case 3:
                case 12:
                    __cursor = -8;
                    break;
                
                case 6:
                case 9:
                    __cursor = -6;
                    break;
            }
        }
        
        gameframe_set_window_cursor(__cursor);
    }
    
    gameframe_button_update(__buttons_x, __borderWidth, __titleHeight, _mx, _my);
    
    if (global.gameframe_can_input && mouse_check_button_pressed(1))
    {
        if (__titleHit)
        {
            __now = current_time;
            
            if (__now < (global.gameframe_last_title_click_at + global.gameframe_double_click_time))
            {
                if (global.gameframe_isMaximized_hx)
                    gameframe_restore();
                else
                    gameframe_maximize();
            }
            else
            {
                global.gameframe_last_title_click_at = __now;
                
                if (global.gameframe_isMaximized_hx)
                    gameframe_drag_start(32);
                else
                    gameframe_drag_start(16);
            }
        }
        else if (__flags != 0 && global.gameframe_can_resize)
        {
            gameframe_drag_start(__flags);
        }
    }
    
    if (global.gameframe_can_input)
    {
        if (mouse_check_button_released(1))
            gameframe_drag_stop();
        else
            gameframe_drag_update();
    }
    else if (global.gameframe_drag_flags != 0)
    {
        gameframe_drag_stop();
    }
}

function gameframe_init()
{
    global.gameframe_is_ready = true;
    global.gameframe_has_native_extension = gameframe_check_native_extension();
    global.gameframe_double_click_time = global.gameframe_has_native_extension ? gml_Script_gameframe_get_double_click_time() : 500;
    gml_Script_gameframe_init_native();
    gameframe_tools_rect_get_window_rect(global.gameframe_restoreRect_hx);
    gameframe_button_add_defaults();
    gameframe_set_shadow(true);
}

function game_frame_button_create(argument0, argument1, argument2, argument3)
{
    var _this;
    
    _this = [global.mt_game_frame_button];
    array_copy(_this, 1, global.mq_game_frame_button, 1, 15);
    _this[15] = game_frame_button_draw_icon_default;
    _this[14] = game_frame_button_draw_underlay_default;
    _this[13] = game_frame_button_update_default;
    _this[12] = game_frame_button_get_width_default;
    _this[10] = 0;
    _this[9] = true;
    _this[8] = false;
    _this[7] = false;
    _this[6] = 0;
    _this[5] = 0;
    _this[1] = argument0;
    _this[3] = argument1;
    _this[4] = argument2;
    _this[11] = argument3;
    return _this;
}

function game_frame_button_get_width_default(argument0)
{
    return sprite_get_width(argument0[3]);
}

function game_frame_button_update_default(argument0)
{
}

function game_frame_button_draw_underlay_default(argument0, argument1, argument2, argument3, argument4)
{
    var _alpha1, _dt;
    
    if (argument0[9])
    {
        if (argument0[8])
        {
            _alpha1 = 0.7;
            argument0[10] = 1;
        }
        else
        {
            _dt = delta_time / 1000000;
            
            if (argument0[7])
            {
                if (argument0[10] < 1)
                    argument0[10] = min(argument0[10] + (_dt / global.gameframe_button_fade_time), 1);
            }
            else if (argument0[10] > 0)
            {
                argument0[10] = max(argument0[10] - (_dt / global.gameframe_button_fade_time), 0);
            }
            
            _alpha1 = argument0[10] * 0.3;
        }
    }
    else
    {
        _alpha1 = 0;
    }
    
    draw_sprite_stretched_ext(global.gameframe_spr_pixel, 0, argument1, argument2, argument3, argument4, global.gameframe_blend, global.gameframe_alpha * _alpha1);
}

function game_frame_button_draw_icon_default(argument0, argument1, argument2, argument3, argument4)
{
    var _icon, _scale;
    
    _icon = argument0[3];
    _scale = global.gameframe_effective_scale;
    draw_sprite_ext(_icon, argument0[4], argument1 + ((argument3 - (sprite_get_width(_icon) * _scale)) div 2) + ((sprite_get_xoffset(_icon) * _scale) | 0), argument2 + ((argument4 - (sprite_get_height(_icon) * _scale)) div 2) + ((sprite_get_yoffset(_icon) * _scale) | 0), _scale, _scale, 0, global.gameframe_blend, global.gameframe_alpha * (argument0[9] ? 1 : 0.3));
}

function game_frame_button_set_name(argument0, argument1)
{
    argument0[1] = argument1;
}

function game_frame_button_get_name(argument0)
{
    return argument0[1];
}

function game_frame_button_set_custom(argument0, argument1)
{
    argument0[2] = argument1;
}

function game_frame_button_get_custom(argument0)
{
    return argument0[2];
}

function game_frame_button_set_icon(argument0, argument1)
{
    argument0[3] = argument1;
}

function game_frame_button_get_icon(argument0)
{
    return argument0[3];
}

function game_frame_button_set_subimg(argument0, argument1)
{
    argument0[4] = argument1;
}

function game_frame_button_get_subimg(argument0)
{
    return argument0[4];
}

function game_frame_button_set_margin_left(argument0, argument1)
{
    argument0[5] = argument1;
}

function game_frame_button_get_margin_left(argument0)
{
    return argument0[5];
}

function game_frame_button_set_margin_right(argument0, argument1)
{
    argument0[6] = argument1;
}

function game_frame_button_get_margin_right(argument0)
{
    return argument0[6];
}

function game_frame_button_set_hover(argument0, argument1)
{
    argument0[7] = argument1;
}

function game_frame_button_get_hover(argument0)
{
    return argument0[7];
}

function game_frame_button_set_pressed(argument0, argument1)
{
    argument0[8] = argument1;
}

function game_frame_button_get_pressed(argument0)
{
    return argument0[8];
}

function game_frame_button_set_enabled(argument0, argument1)
{
    argument0[9] = argument1;
}

function game_frame_button_get_enabled(argument0)
{
    return argument0[9];
}

function game_frame_button_set_fade(argument0, argument1)
{
    argument0[10] = argument1;
}

function game_frame_button_get_fade(argument0)
{
    return argument0[10];
}

function game_frame_button_set_click(argument0, argument1)
{
    argument0[11] = argument1;
}

function game_frame_button_get_click(argument0)
{
    return argument0[11];
}

function game_frame_button_set_get_width(argument0, argument1)
{
    argument0[12] = argument1;
}

function game_frame_button_get_get_width(argument0)
{
    return argument0[12];
}

function game_frame_button_set_update(argument0, argument1)
{
    argument0[13] = argument1;
}

function game_frame_button_get_update(argument0)
{
    return argument0[13];
}

function game_frame_button_set_draw_underlay(argument0, argument1)
{
    argument0[14] = argument1;
}

function game_frame_button_get_draw_underlay(argument0)
{
    return argument0[14];
}

function game_frame_button_set_draw_icon(argument0, argument1)
{
    argument0[15] = argument1;
}

function game_frame_button_get_draw_icon(argument0)
{
    return argument0[15];
}

function gameframe_button_get_combined_width()
{
    var _w, __g, __g1, _b;
    
    _w = 0;
    __g = 0;
    __g1 = global.gameframe_button_array;
    
    while (__g < array_length(__g1))
    {
        _b = __g1[__g];
        __g++;
        _w += (_b[5] + _b[12](_b) + _b[6]);
    }
    
    return ceil(_w * global.gameframe_effective_scale);
}

function gameframe_button_get_combined_offset(argument0)
{
    return argument0 - (global.gameframe_isMaximized_hx ? 0 : global.gameframe_border_width) - gameframe_button_get_combined_width();
}

function gameframe_button_reset()
{
    var __g, __g1, _b;
    
    __g = 0;
    __g1 = global.gameframe_button_array;
    
    while (__g < array_length(__g1))
    {
        _b = __g1[__g];
        __g++;
        _b[7] = false;
        _b[10] = 0;
        _b[8] = false;
    }
}

function gameframe_button_update(argument0, argument1, argument2, argument3, argument4)
{
    var _over_row, _wx, _wy, _dmx, _dmy, _dpiScale, _pressed, _released, _disable, _i, __g1, _button, _width;
    
    _over_row = argument3 >= argument1 && argument4 < (argument1 + argument2);
    
    if (_over_row)
    {
        if (global.gameframe_has_native_extension)
        {
            _over_row = gml_Script_gameframe_mouse_in_window();
        }
        else
        {
            _wx = window_get_x();
            _wy = window_get_y();
            _dmx = display_mouse_get_x();
            _dmy = display_mouse_get_y();
            _over_row = _dmx >= _wx && _dmy >= _wy && _dmx < (_wx + window_get_width()) && _dmy < (_wy + window_get_height());
        }
    }
    
    if (global.gameframe_button_wait_for_movement)
    {
        if (argument3 != global.gameframe_button_wait_for_movement_x || argument4 != global.gameframe_button_wait_for_movement_y)
            global.gameframe_button_wait_for_movement = false;
        else
            _over_row = false;
    }
    
    _dpiScale = global.gameframe_effective_scale;
    _pressed = mouse_check_button_pressed(1);
    _released = mouse_check_button_released(1);
    _disable = global.gameframe_drag_flags != 0 || !global.gameframe_can_input;
    _i = 0;
    __g1 = array_length(global.gameframe_button_array);
    
    while (_i < __g1)
    {
        _button = global.gameframe_button_array[_i];
        _button[13](_button);
        argument0 += (_button[5] * _dpiScale);
        _width = _button[12](_button) * _dpiScale;
        
        if (_disable || !_button[9])
        {
            _button[7] = false;
            _button[8] = false;
        }
        else if (_over_row && argument3 >= argument0 && argument3 < (argument0 + _width))
        {
            _button[7] = true;
            
            if (_pressed)
                _button[8] = true;
        }
        else
        {
            _button[7] = false;
        }
        
        if (_released && _button[8] && _button[7])
        {
            _button[8] = false;
            _button[11](_button);
        }
        
        argument0 += (_width + (_button[6] * _dpiScale));
        _i++;
    }
}

function gameframe_button_draw(argument0, argument1, argument2)
{
    var _dpiScale, _i, __g1, _button, _width;
    
    _dpiScale = global.gameframe_effective_scale;
    _i = 0;
    __g1 = array_length(global.gameframe_button_array);
    
    while (_i < __g1)
    {
        _button = global.gameframe_button_array[_i];
        argument0 += (_button[5] * _dpiScale);
        _width = _button[12](_button) * _dpiScale;
        _button[14](_button, argument0, argument1, _width, argument2);
        _button[15](_button, argument0, argument1, _width, argument2);
        argument0 += (_width + (_button[6] * _dpiScale));
        _i++;
    }
}

function gameframe_button_add_defaults()
{
    var _minimize, _maxrest, _close;
    
    global.gameframe_button_array = [];
    _minimize = game_frame_button_create("minimize", global.gameframe_spr_buttons, 0, function(argument0)
    {
        gameframe_minimize();
    });
    
    if (!global.gameframe_has_native_extension)
        _minimize[9] = false;
    
    array_push(global.gameframe_button_array, _minimize);
    _maxrest = game_frame_button_create("maxrest", global.gameframe_spr_buttons, 1, function(argument0)
    {
        if (global.gameframe_isMaximized_hx)
            gameframe_restore();
        else
            gameframe_maximize();
        
        gameframe_button_reset();
    });
    
    _maxrest[13] = function(argument0)
    {
        argument0[4] = global.gameframe_isMaximized_hx ? 2 : 1;
        argument0[9] = global.gameframe_can_resize;
    };
    
    array_push(global.gameframe_button_array, _maxrest);
    _close = game_frame_button_create("close", global.gameframe_spr_buttons, 3, function(argument0)
    {
        game_end();
    });
    
    _close[14] = function(argument0, argument1, argument2, argument3, argument4)
    {
        var __alpha, _dt;
        
        __alpha = 0;
        
        if (argument0[8])
        {
            __alpha = 0.7;
            argument0[10] = 1;
        }
        else
        {
            _dt = delta_time / 1000000;
            
            if (argument0[7])
            {
                if (argument0[10] < 1)
                {
                    argument0[10] = max(argument0[10], 0.5);
                    argument0[10] = min(argument0[10] + (_dt / global.gameframe_button_fade_time), 1);
                }
            }
            else if (argument0[10] > 0)
            {
                argument0[10] = max(argument0[10] - (_dt / global.gameframe_button_fade_time), 0);
            }
            
            __alpha = global.gameframe_alpha * argument0[10];
        }
        
        draw_sprite_stretched_ext(global.gameframe_spr_pixel, 0, argument1, argument2, argument3, argument4, 2298344, __alpha);
    };
    
    array_push(global.gameframe_button_array, _close);
}

function gameframe_tools_rect__new(argument0 = 0, argument1 = 0, argument2 = 0, argument3 = 0)
{
    return [argument0, argument1, argument2, argument3];
}

function gameframe_tools_rect_get_window_rect(argument0)
{
    argument0[0] = window_get_x();
    argument0[1] = window_get_y();
    argument0[2] = window_get_width();
    argument0[3] = window_get_height();
}

function gameframe_tools_rect_set_window_rect(argument0)
{
    window_set_rectangle(argument0[0], argument0[1], argument0[2], argument0[3]);
}

function gameframe_tools_rect_equals(argument0, argument1)
{
    return argument0[0] == argument1[0] && argument0[1] == argument1[1] && argument0[2] == argument1[2] && argument0[3] == argument1[3];
}

function gameframe_tools_rect_set_to(argument0, argument1)
{
    argument0[0] = argument1[0];
    argument0[1] = argument1[1];
    argument0[2] = argument1[2];
    argument0[3] = argument1[3];
}

function gameframe_minimize()
{
    if (gml_Script_gameframe_is_natively_minimized())
        exit;
    
    gameframe_button_reset();
    gameframe_delayed_call_impl(function()
    {
        global.gameframe_button_wait_for_movement = true;
        global.gameframe_button_wait_for_movement_x = window_mouse_get_x();
        global.gameframe_button_wait_for_movement_y = window_mouse_get_y();
        gml_Script_gameframe_syscommand(61472);
    }, 1, undefined, undefined, undefined, undefined);
}

function gameframe_minimise()
{
    if (!gml_Script_gameframe_is_natively_minimized())
    {
        gameframe_button_reset();
        gameframe_delayed_call_impl(function()
        {
            global.gameframe_button_wait_for_movement = true;
            global.gameframe_button_wait_for_movement_x = window_mouse_get_x();
            global.gameframe_button_wait_for_movement_y = window_mouse_get_y();
            gml_Script_gameframe_syscommand(61472);
        }, 1, undefined, undefined, undefined, undefined);
    }
}

function gameframe_is_minimized()
{
    return gml_Script_gameframe_is_natively_minimized();
}

function gameframe_is_minimised()
{
    return gml_Script_gameframe_is_natively_minimized();
}

function gameframe_maximize()
{
    if (global.gameframe_isMaximized_hx || global.gameframe_isFullscreen_hx || window_get_fullscreen())
        exit;
    
    global.gameframe_isMaximized_hx = true;
    gameframe_store_rect();
    gameframe_maximize_1();
}

function gameframe_maximise()
{
    if (!(global.gameframe_isMaximized_hx || global.gameframe_isFullscreen_hx || window_get_fullscreen()))
    {
        global.gameframe_isMaximized_hx = true;
        gameframe_store_rect();
        gameframe_maximize_1();
    }
}

function gameframe_is_maximized()
{
    return global.gameframe_isMaximized_hx;
}

function gameframe_is_maximised()
{
    return global.gameframe_isMaximized_hx;
}

function gameframe_maximize_1()
{
    var __work;
    
    __work = array_get(gameframe_tools_mon_get_active(), 1);
    
    if (global.gameframe_debug)
        gameframe_log("maximize: ", __work);
    
    gameframe_tools_rect_set_window_rect(__work);
    gameframe_set_shadow(false);
}

function gameframe_store_rect()
{
    gameframe_tools_rect_get_window_rect(global.gameframe_restoreRect_hx);
    
    if (global.gameframe_debug)
        gameframe_log("storeRect: ", global.gameframe_restoreRect_hx);
}

function gameframe_restore(argument0 = false)
{
    var __rect;
    
    if (window_get_fullscreen())
    {
        window_set_fullscreen(false);
        gameframe_delayed_call_impl(function()
        {
            gameframe_restore();
        }, 1, undefined, undefined, undefined, undefined);
        exit;
    }
    
    if (!argument0 && !global.gameframe_isMaximized_hx && !global.gameframe_isFullscreen_hx)
        exit;
    
    global.gameframe_isMaximized_hx = false;
    global.gameframe_isFullscreen_hx = false;
    __rect = global.gameframe_restoreRect_hx;
    
    if (global.gameframe_debug)
        gameframe_log("restore: ", __rect);
    
    gameframe_tools_rect_set_window_rect(__rect);
    gameframe_set_shadow(true);
}

function gameframe_set_fullscreen(argument0)
{
    gameframe_set_fullscreen_1(argument0);
}

function gameframe_get_fullscreen()
{
    if (window_get_fullscreen())
        return 1;
    
    if (global.gameframe_isFullscreen_hx)
        return 2;
    else
        return 0;
}

function gameframe_is_fullscreen_window()
{
    return !window_get_fullscreen() && global.gameframe_isFullscreen_hx;
}

function gameframe_set_fullscreen_1(argument0, argument1 = false)
{
    if (global.gameframe_debug)
        gameframe_log("setFullscreen(mode:", argument0, ", wasfs:", argument1, ")");
    
    if (argument0 == 1 || argument0 == 2)
    {
        gameframe_button_reset();
        gameframe_drag_stop();
    }
    
    switch (argument0)
    {
        case 1:
            if (window_get_fullscreen())
                exit;
            
            if (global.gameframe_isFullscreen_hx)
            {
                gameframe_restore();
                gameframe_delayed_call_impl(function()
                {
                    gameframe_set_fullscreen_1(1);
                }, 1, undefined, undefined, undefined, undefined);
                exit;
            }
            else
            {
                gameframe_store_rect();
            }
            
            window_set_fullscreen(true);
            break;
        
        case 2:
            if (window_get_fullscreen())
            {
                window_set_fullscreen(false);
                gameframe_delayed_call_impl(function()
                {
                    gameframe_set_fullscreen_1(2, true);
                }, 10, undefined, undefined, undefined, undefined);
                exit;
            }
            
            if (global.gameframe_isFullscreen_hx)
                exit;
            
            global.gameframe_isFullscreen_hx = true;
            
            if (!global.gameframe_isMaximized_hx && !argument1)
                gameframe_store_rect();
            
            gameframe_tools_rect_set_window_rect(array_get(gameframe_tools_mon_get_active(), 0));
            gameframe_set_shadow(false);
            break;
        
        default:
            if (window_get_fullscreen() && global.gameframe_isFullscreen_hx)
            {
                window_set_fullscreen(false);
                gameframe_delayed_call_impl(function()
                {
                    gameframe_set_fullscreen_1(0);
                }, 1, undefined, undefined, undefined, undefined);
                exit;
            }
            
            if (window_get_fullscreen())
            {
                gameframe_restore();
                break;
            }
            
            if (global.gameframe_isMaximized_hx)
            {
                global.gameframe_isFullscreen_hx = false;
                gameframe_maximize_1();
                break;
            }
            
            gameframe_restore();
    }
}

function gameframe_set_window_cursor(argument0)
{
    global.gameframe_current_cursor = argument0;
    
    if (global.gameframe_set_cursor)
    {
        if (window_get_cursor() != argument0)
            window_set_cursor(argument0);
    }
}

function gameframe_get_border_width()
{
    if (global.gameframe_isMaximized_hx)
        return 0;
    else
        return global.gameframe_border_width;
}

function gameframe_get_drag_flags()
{
    return global.gameframe_drag_flags;
}

function gameframe_caption_get_height()
{
    var _h;
    
    _h = global.gameframe_isMaximized_hx ? global.gameframe_caption_height_maximized : global.gameframe_caption_height_normal;
    
    if (_h > 0)
        return _h | 0;
    
    return round(-_h * sprite_get_height(global.gameframe_spr_caption) * global.gameframe_effective_scale);
}

function gameframe_caption_get_overlap()
{
    var _h, _rect;
    
    if (window_get_fullscreen() || global.gameframe_isFullscreen_hx)
        return 0;
    
    _h = gameframe_caption_get_height();
    _rect = application_get_position();
    return max(0, _h - _rect[1]) / ((_rect[2] - _rect[0]) / surface_get_width(application_surface));
}

function gameframe_caption_draw_border_default(argument0, argument1, argument2, argument3)
{
    draw_sprite_stretched_ext(global.gameframe_spr_border, window_has_focus() ? 1 : 0, argument0, argument1, argument2, argument3, global.gameframe_blend, global.gameframe_alpha);
}

function gameframe_caption_draw_caption_rect_default(argument0, argument1, argument2, argument3, argument4)
{
    draw_sprite_stretched_ext(global.gameframe_spr_caption, window_has_focus() ? 1 : 0, argument0, argument1, argument2, argument3, global.gameframe_blend, global.gameframe_alpha * global.gameframe_caption_alpha);
}

function gameframe_caption_draw_caption_text_default(argument0, argument1, argument2, argument3)
{
    var _dpiScale, __right, _icon, _text, __newFont, __h, __v, __oldFont, __alpha, __textWidth;
    
    _dpiScale = global.gameframe_effective_scale;
    __right = argument0 + argument2;
    argument0 += (global.gameframe_caption_margin * _dpiScale);
    _icon = global.gameframe_caption_icon;
    
    if (_icon != -1)
    {
        draw_sprite_ext(_icon, -1, (argument0 + (sprite_get_xoffset(_icon) * _dpiScale)) | 0, argument1 + ((argument3 - (sprite_get_height(_icon) * _dpiScale)) div 2) + (sprite_get_yoffset(_icon) * _dpiScale), _dpiScale, _dpiScale, 0, 16777215, global.gameframe_caption_alpha * global.gameframe_alpha);
        argument0 += ((sprite_get_width(_icon) + global.gameframe_caption_icon_margin) * _dpiScale);
    }
    
    _text = global.gameframe_caption_text;
    
    if (_text == "")
        exit;
    
    __newFont = global.gameframe_caption_font;
    __h = draw_get_halign();
    __v = draw_get_valign();
    
    if (__newFont != -1)
    {
        __oldFont = draw_get_font();
        draw_set_font(__newFont);
    }
    else
    {
        __oldFont = -1;
    }
    
    draw_set_halign(global.gameframe_caption_text_align);
    draw_set_valign(0);
    __alpha = draw_get_alpha();
    __textWidth = __right - argument0;
    draw_set_alpha(global.gameframe_alpha * global.gameframe_caption_alpha);
    draw_text_ext_transformed(argument0 + ((global.gameframe_caption_text_align * __textWidth) div 2), argument1 + ((argument3 - (string_height_ext(_text, -1, __textWidth) * _dpiScale)) div 2), _text, -1, __textWidth, _dpiScale, _dpiScale, 0);
    draw_set_alpha(__alpha);
    
    if (__newFont != -1)
        draw_set_font(__oldFont);
    
    draw_set_halign(__h);
    draw_set_valign(__v);
}

function gameframe_cover_ensure()
{
    var __just_changed, __target_rect;
    
    __just_changed = global.gameframe_cover_check_for_success;
    
    if (__just_changed)
        global.gameframe_cover_check_for_success = false;
    
    if (window_get_fullscreen())
    {
        global.gameframe_cover_can_ignore = false;
        exit;
    }
    else if (global.gameframe_isFullscreen_hx)
    {
        __target_rect = array_get(gameframe_tools_mon_get_active(), 0);
    }
    else if (global.gameframe_isMaximized_hx)
    {
        __target_rect = array_get(gameframe_tools_mon_get_active(), 1);
    }
    else
    {
        global.gameframe_cover_can_ignore = false;
        exit;
    }
    
    gameframe_tools_rect_get_window_rect(global.gameframe_cover_curr_rect);
    
    if (!gameframe_tools_rect_equals(global.gameframe_cover_curr_rect, __target_rect))
    {
        if (__just_changed)
        {
            global.gameframe_cover_can_ignore = true;
            gameframe_tools_rect_set_to(global.gameframe_cover_ignore_rect, __target_rect);
            
            if (global.gameframe_debug)
                gameframe_log("[cover] Resize failed - ignoring");
            
            exit;
        }
        
        if (global.gameframe_cover_can_ignore && gameframe_tools_rect_equals(__target_rect, global.gameframe_cover_ignore_rect))
            exit;
        
        if (global.gameframe_debug)
            gameframe_log("[cover] Adjusting window rectangle to", __target_rect);
        
        gameframe_tools_rect_set_window_rect(__target_rect);
        global.gameframe_cover_check_for_success = true;
    }
}

function gameframe_delayed_call_impl(argument0, argument1, argument2, argument3, argument4, argument5)
{
    var _item;
    
    if (ds_stack_empty(global.gameframe_delayed_pool))
        _item = gameframe_delayed_item_create();
    else
        _item = ds_stack_pop(global.gameframe_delayed_pool);
    
    _item[1] = argument0;
    _item[2] = global.gameframe_delayed_frame_index + argument1;
    _item[3] = argument2;
    _item[4] = argument3;
    _item[5] = argument4;
    _item[6] = argument5;
    ds_queue_enqueue(global.gameframe_delayed_queue, _item);
}

function gameframe_delayed_update()
{
    var _head, _f;
    
    global.gameframe_delayed_frame_index += 1;
    
    while (!ds_queue_empty(global.gameframe_delayed_queue))
    {
        _head = ds_queue_head(global.gameframe_delayed_queue);
        
        if (_head[2] > global.gameframe_delayed_frame_index)
            break;
        
        ds_queue_dequeue(global.gameframe_delayed_queue);
        _f = _head[1];
        _f(_head[3], _head[4], _head[5], _head[6]);
        _head[1] = undefined;
        _head[3] = undefined;
        _head[4] = undefined;
        _head[5] = undefined;
        _head[6] = undefined;
        ds_stack_push(global.gameframe_delayed_pool, _head);
    }
}

function gameframe_delayed_item_create()
{
    var _this;
    
    _this = [global.mt_gameframe_delayed_item];
    array_copy(_this, 1, global.mq_gameframe_delayed_item, 1, 6);
    return _this;
}

function gameframe_drag_start(argument0)
{
    global.gameframe_drag_flags = argument0;
    global.gameframe_drag_mx = display_mouse_get_x() | 0;
    global.gameframe_drag_my = display_mouse_get_y() | 0;
    global.gameframe_drag_left = window_get_x();
    global.gameframe_drag_top = window_get_y();
    global.gameframe_drag_right = global.gameframe_drag_left + window_get_width();
    global.gameframe_drag_bottom = global.gameframe_drag_top + window_get_height();
}

function gameframe_drag_stop()
{
    global.gameframe_drag_flags = 0;
}

function gameframe_drag_set_rect(argument0, argument1, argument2, argument3)
{
    window_set_rectangle(argument0, argument1, argument2, argument3);
}

function gameframe_drag_update()
{
    var __mx, __my, __y, __x;
    
    if (global.gameframe_drag_flags == 0)
        exit;
    
    __mx = display_mouse_get_x() | 0;
    __my = display_mouse_get_y() | 0;
    
    switch (global.gameframe_drag_flags)
    {
        case 16:
            window_set_position(__mx - (global.gameframe_drag_mx - global.gameframe_drag_left), __my - (global.gameframe_drag_my - global.gameframe_drag_top));
            break;
        
        case 32:
            if (point_distance(__mx, __my, global.gameframe_drag_mx, global.gameframe_drag_my) > 5)
            {
                __y = global.gameframe_drag_my - global.gameframe_drag_top;
                
                if ((global.gameframe_drag_mx - global.gameframe_drag_left) < ((global.gameframe_drag_right - global.gameframe_drag_left) / 2))
                    __x = min(global.gameframe_drag_mx - global.gameframe_drag_left, global.gameframe_restoreRect_hx[2] >> 1);
                else
                    __x = max((global.gameframe_restoreRect_hx[2] + global.gameframe_drag_mx) - global.gameframe_drag_right, global.gameframe_restoreRect_hx[2] >> 1);
                
                global.gameframe_isMaximized_hx = false;
                window_set_rectangle(__mx - __x, __my - __y, global.gameframe_restoreRect_hx[2], global.gameframe_restoreRect_hx[3]);
                gameframe_drag_start(16);
            }
            
            break;
        
        case 1:
            __x = __mx - (global.gameframe_drag_mx - global.gameframe_drag_left);
            window_set_rectangle(__x, global.gameframe_drag_top, global.gameframe_drag_right - __x, global.gameframe_drag_bottom - global.gameframe_drag_top);
            break;
        
        case 2:
            __y = __my - (global.gameframe_drag_my - global.gameframe_drag_top);
            window_set_rectangle(global.gameframe_drag_left, __y, global.gameframe_drag_right - global.gameframe_drag_left, global.gameframe_drag_bottom - __y);
            break;
        
        case 4:
            window_set_rectangle(global.gameframe_drag_left, global.gameframe_drag_top, (global.gameframe_drag_right - global.gameframe_drag_left - global.gameframe_drag_mx) + __mx, global.gameframe_drag_bottom - global.gameframe_drag_top);
            break;
        
        case 8:
            window_set_rectangle(global.gameframe_drag_left, global.gameframe_drag_top, global.gameframe_drag_right - global.gameframe_drag_left, (global.gameframe_drag_bottom - global.gameframe_drag_top - global.gameframe_drag_my) + __my);
            break;
        
        case 3:
            __x = __mx - (global.gameframe_drag_mx - global.gameframe_drag_left);
            __y = __my - (global.gameframe_drag_my - global.gameframe_drag_top);
            window_set_rectangle(__x, __y, global.gameframe_drag_right - __x, global.gameframe_drag_bottom - __y);
            break;
        
        case 9:
            __x = __mx - (global.gameframe_drag_mx - global.gameframe_drag_left);
            window_set_rectangle(__x, global.gameframe_drag_top, global.gameframe_drag_right - __x, (global.gameframe_drag_bottom - global.gameframe_drag_top - global.gameframe_drag_my) + __my);
            break;
        
        case 6:
            __y = __my - (global.gameframe_drag_my - global.gameframe_drag_top);
            window_set_rectangle(global.gameframe_drag_left, __y, (global.gameframe_drag_right - global.gameframe_drag_left - global.gameframe_drag_mx) + __mx, global.gameframe_drag_bottom - __y);
            break;
        
        case 12:
            window_set_rectangle(global.gameframe_drag_left, global.gameframe_drag_top, (global.gameframe_drag_right - global.gameframe_drag_left - global.gameframe_drag_mx) + __mx, (global.gameframe_drag_bottom - global.gameframe_drag_top - global.gameframe_drag_my) + __my);
            break;
    }
}

function gameframe_tools_keyctl_create_key(argument0)
{
    return [argument0, false, false];
}

function gameframe_tools_keyctl_update_key(argument0)
{
    var _down0, _down1;
    
    _down0 = argument0[1];
    _down1 = keyboard_check_direct(argument0[0]) != 0;
    argument0[2] = !_down0 && _down1;
    argument0[1] = _down1;
}

function gameframe_tools_keyctl_reset()
{
    var _i, __g1;
    
    _i = 0;
    __g1 = array_length(global.gameframe_tools_keyctl_keys);
    
    while (_i < __g1)
    {
        global.gameframe_tools_keyctl_keys[_i][1] = false;
        _i++;
    }
}

function gameframe_tools_keyctl_update()
{
    var _i, __g1;
    
    if (!(window_has_focus() && (keyboard_check_direct(91) != 0 || keyboard_check_direct(92) != 0)))
    {
        gameframe_tools_keyctl_reset();
        exit;
    }
    
    _i = 0;
    __g1 = array_length(global.gameframe_tools_keyctl_keys);
    
    while (_i < __g1)
    {
        gameframe_tools_keyctl_update_key(global.gameframe_tools_keyctl_keys[_i]);
        _i++;
    }
    
    if (global.gameframe_tools_keyctl_up[2])
    {
        if (global.gameframe_can_resize)
            gameframe_maximize();
    }
    else if (global.gameframe_tools_keyctl_down[2])
    {
        if (global.gameframe_isMaximized_hx)
        {
            if (global.gameframe_can_resize)
                gameframe_restore();
        }
        else
        {
            gameframe_minimize();
        }
    }
}

function gameframe_draw()
{
    var _gw, _gh, __borderWidth, __titlebarHeight, __buttons_x;
    
    if (!global.gameframe_is_ready)
        exit;
    
    if (window_get_fullscreen() || global.gameframe_isFullscreen_hx)
        exit;
    
    _gw = window_get_width();
    _gh = window_get_height();
    display_set_gui_maximise(browser_width / _gw, browser_height / _gh, (_gw % 2) / -2, (_gh % 2) / -2);
    __borderWidth = global.gameframe_isMaximized_hx ? 0 : global.gameframe_border_width;
    __titlebarHeight = gameframe_caption_get_height();
    __buttons_x = gameframe_button_get_combined_offset(_gw);
    
    if (!global.gameframe_isMaximized_hx)
        global.gameframe_caption_draw_border(0, 0, _gw, _gh);
    
    global.gameframe_caption_draw_background(__borderWidth, __borderWidth, _gw - (__borderWidth * 2), __titlebarHeight, __buttons_x);
    global.gameframe_caption_draw_text(__borderWidth, __borderWidth, __buttons_x - __borderWidth, __titlebarHeight);
    gameframe_button_draw(__buttons_x, __borderWidth, __titlebarHeight);
    __display_gui_restore();
}

function gameframe_std_Std_stringify(argument0)
{
    var _e, _ects, _i, _s, _n, _fields;
    
    if (argument0 == undefined)
        return "null";
    
    if (is_string(argument0))
        return argument0;
    
    if (is_struct(argument0))
    {
        _e = variable_struct_get(argument0, "__enum__");
        
        if (_e == undefined)
            return string(argument0);
        
        _ects = _e.constructors;
        
        if (_ects != undefined)
        {
            _i = argument0.__enumIndex__;
            
            if (_i >= 0 && _i < array_length(_ects))
                _s = _ects[_i];
            else
                _s = "?";
        }
        else
        {
            _s = instanceof(argument0);
            
            if (string_copy(_s, 1, 3) == "mc_")
                _s = string_delete(_s, 1, 3);
            
            _n = string_length(_e.name);
            
            if (string_copy(_s, 1, _n) == _e.name)
                _s = string_delete(_s, 1, _n + 1);
        }
        
        _s += "(";
        _fields = argument0.__enumParams__;
        _n = array_length(_fields);
        _i = -1;
        
        while (++_i < _n)
        {
            if (_i > 0)
                _s += ", ";
            
            _s += gameframe_std_Std_stringify(variable_struct_get(argument0, array_get(_fields, _i)));
        }
        
        return _s + ")";
    }
    
    if (is_real(argument0))
    {
        _s = string_format(argument0, 0, 16);
        _n = string_byte_length(_s);
        _i = _n;
        
        while (_i > 0)
        {
            switch (string_byte_at(_s, _i))
            {
                case 48:
                    _i--;
                    continue;
                
                case 46:
                    _i--;
                    break;
            }
            
            break;
        }
        
        return string_copy(_s, 1, _i);
    }
    
    return string(argument0);
}

function gameframe_std_haxe_class(argument0, argument1) constructor
{
    static superClass = undefined;
    static marker = undefined;
    static index = undefined;
    static name = undefined;
    static __class__ = "class";
    
    superClass = undefined;
    marker = global.gameframe_std_haxe_type_markerValue;
    index = argument0;
    name = argument1;
}

function gameframe_tools_mon_get_active()
{
    var __list, __count, __cx1, __cy1, _i, __g1, __item, __mntr;
    
    __list = global.gameframe_tools_mon_get_active_list;
    
    if (__list == undefined)
    {
        __list = ds_list_create();
        global.gameframe_tools_mon_get_active_list = __list;
    }
    
    __count = gml_Script_gameframe_get_monitors(__list);
    __cx1 = window_get_x() + (window_get_width() div 2);
    __cy1 = window_get_y() + (window_get_height() div 2);
    _i = 0;
    __g1 = __count;
    
    while (_i < __g1)
    {
        __item = ds_list_find_value(__list, _i);
        __mntr = __item[0];
        
        if (__cx1 >= __mntr[0] && __cy1 >= __mntr[1] && __cx1 < (__mntr[0] + __mntr[2]) && __cy1 < (__mntr[1] + __mntr[3]))
            return __item;
        
        _i++;
    }
    
    __item = ds_list_find_value(__list, 0);
    
    if (__item == undefined)
    {
        __item = global.gameframe_tools_mon_dummy;
        
        if (__item == undefined)
        {
            __item = [gameframe_tools_rect__new(0, 0, display_get_width(), display_get_height()), gameframe_tools_rect__new(0, 0, display_get_width(), display_get_height() - 40), 0];
            global.gameframe_tools_mon_dummy = __item;
        }
        
        ds_list_set(__list, 0, __item);
    }
    
    return __item;
}

global.gameframe_is_ready = false;
global.gameframe_last_title_click_at = -5000;
global.gameframe_button_array = [];
global.gameframe_button_fade_time = 0.2;
global.gameframe_button_wait_for_movement = false;
global.gameframe_button_wait_for_movement_x = 0;
global.gameframe_button_wait_for_movement_y = 0;
global.gameframe_debug = false;
global.gameframe_blend = 16777215;
global.gameframe_alpha = 1;
global.gameframe_can_input = true;
global.gameframe_can_resize = true;
global.gameframe_resize_padding = 6;
global.gameframe_border_width = 2;
global.gameframe_spr_border = asset_get_index("spr_gameframe_border");
global.gameframe_spr_caption = asset_get_index("spr_gameframe_caption");
global.gameframe_spr_buttons = asset_get_index("spr_gameframe_buttons");
global.gameframe_spr_pixel = asset_get_index("spr_gameframe_pixel");
global.gameframe_default_cursor = -2;
global.gameframe_set_cursor = true;
global.gameframe_current_cursor = -2;
global.gameframe_dpi_scale = 1;
global.gameframe_effective_scale = 1;
global.gameframe_has_native_extension = false;
global.gameframe_mouse_over_frame = false;
global.gameframe_isMaximized_hx = false;
global.gameframe_isFullscreen_hx = false;
global.gameframe_restoreRect_hx = gameframe_tools_rect__new();
global.gameframe_caption_text = window_get_caption();
global.gameframe_caption_alpha = 1;
global.gameframe_caption_font = -1;
global.gameframe_caption_text_align = 0;
global.gameframe_caption_icon = -1;
global.gameframe_caption_margin = 6;
global.gameframe_caption_icon_margin = 4;
global.gameframe_caption_height_normal = -1;
global.gameframe_caption_height_maximized = -0.66667;
global.gameframe_caption_draw_border = gameframe_caption_draw_border_default;
global.gameframe_caption_draw_background = gameframe_caption_draw_caption_rect_default;
global.gameframe_caption_draw_text = gameframe_caption_draw_caption_text_default;
global.gameframe_cover_check_for_success = false;
global.gameframe_cover_ignore_rect = gameframe_tools_rect__new();
global.gameframe_cover_can_ignore = false;
global.gameframe_cover_curr_rect = gameframe_tools_rect__new();
global.gameframe_delayed_queue = ds_queue_create();
global.gameframe_delayed_pool = ds_stack_create();
global.gameframe_delayed_frame_index = 0;
global.gameframe_drag_flags = 0;
global.gameframe_drag_mx = 0;
global.gameframe_drag_my = 0;
global.gameframe_drag_left = 0;
global.gameframe_drag_top = 0;
global.gameframe_drag_right = 0;
global.gameframe_drag_bottom = 0;
global.gameframe_tools_keyctl_up = gameframe_tools_keyctl_create_key(38);
global.gameframe_tools_keyctl_down = gameframe_tools_keyctl_create_key(40);
global.gameframe_tools_keyctl_keys = [global.gameframe_tools_keyctl_up, global.gameframe_tools_keyctl_down];
global.gameframe_tools_mon_get_active_list = undefined;
global.gameframe_tools_mon_dummy = undefined;
