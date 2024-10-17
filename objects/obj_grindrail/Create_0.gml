canCollide = function(argument0) //anon@13@gml_Object_obj_grindrail_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = ((argument0.state == (86 << 0) || argument0.state == (63 << 0)) ? argument0.tauntstoredstate : argument0.state)
            return (_state != (95 << 0) && _state != (86 << 0) && _state != (108 << 0));
        default:
            return false;
    }

}

