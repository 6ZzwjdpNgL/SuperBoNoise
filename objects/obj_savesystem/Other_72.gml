var ident = ds_map_find_value(async_load, "id")
var status = ds_map_find_value(async_load, "status")
var error = ds_map_find_value(async_load, "error")
switch state
{
    case (1 << 0):
        if (ident == saveid)
        {
            buffer_delete(savebuff)
            trace("Save status: ", status, ", error: ", error)
            state = (0 << 0)
        }
        break
    case (2 << 0):
        if (ident == loadid)
        {
            var buffstring = buffer_read(loadbuff, buffer_string)
            ini_open_from_string(buffstring)
            ini_str = ini_close()
            buffer_delete(loadbuff)
            trace("inistr: ", ini_str)
            trace("buffstring: ", buffstring)
            state = (0 << 0)
            if (room == rm_mainmenu && obj_mainmenu.state == (3 << 0))
                event_user(0)
        }
        break
}

