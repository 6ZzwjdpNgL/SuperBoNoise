var _secret_layer_setup = function(argument0, argument1) //anon@26@gml_Object_obj_secrettile_Create_0
{
    layer_set_visible(layer_get_id(argument0), false)
}

tiles = ["Tiles_Secret1", "Tiles_Secret2", "Tiles_Secret3"]
secretFunction = function() //anon@237@gml_Object_obj_secrettile_Create_0
{
    return place_meeting(x, y, obj_player1);
}

