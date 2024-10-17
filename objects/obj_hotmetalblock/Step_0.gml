with (obj_player1)
{
    if (character != "V")
    {
        if ((state == (40 << 0) || state == (186 << 0)) && (place_meeting((x + hsp), y, other) || place_meeting((x + xscale), y, other)))
            instance_destroy(other)
        with (other)
        {
            if (place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other) || place_meeting((x - 1), y, other) || place_meeting((x + 1), y, other))
            {
                if (place_meeting(x, (y - 1), other) && (other.state == (49 << 0) || other.state == (21 << 0)))
                {
                    instance_destroy()
                    tile_layer_delete_at(1, x, y)
                }
            }
        }
    }
}
