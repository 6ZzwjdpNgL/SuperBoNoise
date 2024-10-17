switch state
{
    case (148 << 0):
        x = camera_get_view_x(view_camera[0]) - 100
        y = camera_get_view_y(view_camera[0]) - 100
        var dx = 350
        var dy = 400
        var px = x
        var py = y
        with (obj_player1)
        {
            px = x
            py = y
        }
        if (global.panic && distance_to_pos(xstart, ystart, px, py, dx, dy))
        {
            state = (90 << 0)
            x = xstart
            y = ystart
            image_index = 0
            visible = true
            event_play_oneshot("event:/SFX/misc/evilteleport", x, y)
        }
        break
    case (90 << 0):
        with (instance_place(x, y, obj_baddiecollisionbox))
        {
            instance_destroy(baddieID)
            instance_destroy()
        }
        state = (2 << 0)
        break
    case (2 << 0):
        break
}

