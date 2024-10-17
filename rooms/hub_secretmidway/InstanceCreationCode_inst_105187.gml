visible = false
flags.do_once_per_save = true
condition = function() //anon@62@gml_RoomCC_hub_secretmidway_2_Create
{
    return (place_meeting(x, y, obj_player1) && input_check("up"));
}

output = function() //anon@154@gml_RoomCC_hub_secretmidway_2_Create
{
    mail_trigger((22 << 0))
}

