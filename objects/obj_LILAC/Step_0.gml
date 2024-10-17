var _temp_local_var_1;
if (distance_to_object(obj_player1) <= 350)
{
    var _temp_local_var_1 = -9
    global.speakerbox[(global.leveltosave == "midway" ? 0 : 1)] = true
    mail_trigger((14 << 0))
    instance_destroy()
}
else if (global.level_minutes > timer)
    instance_destroy()
