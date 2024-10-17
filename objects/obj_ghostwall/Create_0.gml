canCollide = function(argument0) //anon@13@gml_Object_obj_ghostwall_Create_0
{
    if (argument0 == undefined)
        argument0 = obj_player
    switch argument0
    {
        case obj_player:
        case obj_player1:
        case obj_player2:
            var _state = ((argument0.state == (86 << 0) || argument0.state == (63 << 0)) ? argument0.tauntstoredstate : argument0.state)
            return _state != (18 << 0);
        default:
            return true;
    }

}

with (instance_create(x, y, obj_ghosttransparency))
{
    mask_index = other.sprite_index
    sprite_index = other.sprite_index
    image_xscale = other.image_xscale
}
away = 0
