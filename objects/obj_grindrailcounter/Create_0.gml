event_inherited()
visible = false
flags.do_once_per_save = true
condition = function() //anon@82@gml_Object_obj_grindrailcounter_Create_0
{
    var p = instance_place(x, y, obj_player1)
    if (p != noone)
        return p.state == (80 << 0);
    return false;
}

output = function() //anon@227@gml_Object_obj_grindrailcounter_Create_0
{
    global.grinds++
    trace("Grindcount: ", global.grinds)
    if (global.grinds >= 36)
        mail_trigger((6 << 0))
}

