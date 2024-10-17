visible = false
flags.do_once_per_save = true
condition = function() //anon@62@gml_RoomCC_water_1_18_Create
{
    var p = instance_place(x, y, obj_player1)
    var ret = false
    with (p)
    {
        ret = state != (97 << 0)
        with (obj_music)
        {
            if (music != noone)
                fmod_event_stop(music.music_inst, true)
        }
    }
    return ret;
}

output = function() //anon@329@gml_RoomCC_water_1_18_Create
{
    with (obj_player1)
    {
        state = (276 << 0)
        sprite_index = spr_player_oilintro1
    }
    global.oiled = true
}

