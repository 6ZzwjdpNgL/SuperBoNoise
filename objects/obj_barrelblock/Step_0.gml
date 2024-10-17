with (obj_player1)
{
    if (state == (115 << 0) && (place_meeting((x + 1), y, other) || place_meeting((x - 1), y, other)))
        instance_destroy(other)
}
