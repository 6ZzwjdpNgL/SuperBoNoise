function __background_set_internal(argument0, argument1, argument2, argument3) //__background_set_internal
{
    if (argument3[0] == -1)
        return -1;
    var __backid = argument3[0]
    var __layerid = argument3[1]
    var __isfore = argument3[2]
    if (argument0 == (1 << 0))
    {
        if (round(argument2) != round(__isfore))
        {
            var __visible = layer_get_visible(__layerid)
            var __index = layer_background_get_sprite(__backid)
            var __htiled = layer_background_get_htiled(__backid)
            var __vtiled = layer_background_get_vtiled(__backid)
            var __stretch = layer_background_get_stretch(__backid)
            var __blend = layer_background_get_blend(__backid)
            var __alpha = layer_background_get_alpha(__backid)
            var __xscale = layer_background_get_xscale(__backid)
            var __yscale = layer_background_get_yscale(__backid)
            var __x = layer_get_x(__layerid)
            var __y = layer_get_y(__layerid)
            var __hspeed = layer_get_hspeed(__layerid)
            var __vspeed = layer_get_vspeed(__layerid)
            __background_set_element(argument1, __visible, argument2, __index, __x, __y, __htiled, __vtiled, __xscale, __yscale, __stretch, __hspeed, __vspeed, __blend, __alpha)
        }
    }
    else
    {
        switch argument0
        {
            case (0 << 0):
                layer_set_visible(__layerid, argument2)
                layer_background_visible(__backid, argument2)
                break
            case (2 << 0):
                layer_background_change(__backid, argument2)
                if sprite_exists(argument2)
                {
                    layer_background_blend(__backid, c_white)
                    layer_background_alpha(__backid, 1)
                }
                break
            case (3 << 0):
                layer_x(__layerid, argument2)
                break
            case (4 << 0):
                layer_y(__layerid, argument2)
                break
            case (7 << 0):
                layer_background_htiled(__backid, argument2)
                break
            case (8 << 0):
                layer_background_vtiled(__backid, argument2)
                break
            case (9 << 0):
                layer_background_xscale(__backid, argument2)
                break
            case (10 << 0):
                layer_background_yscale(__backid, argument2)
                break
            case (11 << 0):
                layer_hspeed(__layerid, argument2)
                break
            case (12 << 0):
                layer_vspeed(__layerid, argument2)
                break
            case (13 << 0):
                layer_background_blend(__backid, argument2)
                break
            case (14 << 0):
                layer_background_alpha(__backid, argument2)
                break
            default:
                break
        }

    }
    return -1;
}

