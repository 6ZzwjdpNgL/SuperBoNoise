canCollide = function(argument0) //anon@13@gml_Object_obj_movingPlatform_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = ((argument0.state == (86 << 0) || argument0.state == (63 << 0)) ? argument0.tauntstoredstate : argument0.state)
            return _state != (95 << 0);
        default:
            return true;
    }

}

hsp = 0
vsp = 0
hdir = 1
vdir = -1
v_velocity = 2
h_velocity = 0
depth = 0
changing_vdir = 0
changing_hdir = 0
image_speed = 0.35
mask_index = spr_chigaco
trueX = x
trueY = y
