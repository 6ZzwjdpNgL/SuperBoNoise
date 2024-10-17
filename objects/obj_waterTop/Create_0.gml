event_inherited()
canCollide = function(argument0) //anon@33@gml_Object_obj_waterTop_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            with (argument0)
            {
                var _state = ((state == (86 << 0) || state == (63 << 0)) ? tauntstoredstate : state)
                return (_state == (188 << 0) || _state == (212 << 0) || _state == (211 << 0) || _state == (123 << 0) || _state == (149 << 0) || sprite_index == spr_mach3boost);
            }
            break
        default:
            return false;
    }

    return false;
}

