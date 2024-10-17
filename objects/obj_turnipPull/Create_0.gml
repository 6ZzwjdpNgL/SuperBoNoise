// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
content = [obj_collect]
onPick = function() //anon@35@gml_Object_obj_turnipPull_Create_0
{
    with (instance_create(x, y, obj_objspawner))
    {
        content_arr = other.content
        func = function() //anon@137@anon@35_gml_Object_obj_turnipPull_Create_0
        {
            x = obj_player1.x
            y = obj_player1.y
        }

    }
}

