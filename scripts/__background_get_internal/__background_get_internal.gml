function __background_get_internal(argument0, argument1, argument2) //__background_get_internal
{
    if (argument2[0] == -1 || layer_background_exists(argument2[1], argument2[0]) == false)
    {
        argument2 = __background_get_element(argument1)
        if (argument2[0] == -1)
            return -1;
    }
    var __res = -1
    var __backid = argument2[0]
    var __layerid = argument2[1]
    var __isfore = argument2[2]
    switch argument0
    {
        case (0 << 0):
            __res = layer_get_visible(__layerid)
            break
        case (1 << 0):
            __res = __isfore
            break
        case (2 << 0):
            __res = layer_background_get_sprite(__backid)
            break
        case (3 << 0):
            __res = layer_get_x(__layerid)
            break
        case (4 << 0):
            __res = layer_get_y(__layerid)
            break
        case (5 << 0):
            __res = sprite_get_width(layer_background_get_index(__backid))
            break
        case (6 << 0):
            __res = sprite_get_height(layer_background_get_index(__backid))
            break
        case (7 << 0):
            __res = layer_background_get_htiled(__backid)
            break
        case (8 << 0):
            __res = layer_background_get_vtiled(__backid)
            break
        case (9 << 0):
            __res = layer_background_get_xscale(__backid)
            break
        case (10 << 0):
            __res = layer_background_get_yscale(__backid)
            break
        case (11 << 0):
            __res = layer_get_hspeed(__layerid)
            break
        case (12 << 0):
            __res = layer_get_vspeed(__layerid)
            break
        case (13 << 0):
            __res = layer_background_get_blend(__backid)
            break
        case (14 << 0):
            __res = layer_background_get_alpha(__backid)
            break
        default:
            break
    }

    return __res;
}

