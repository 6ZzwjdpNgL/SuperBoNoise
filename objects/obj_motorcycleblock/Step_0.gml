with (obj_player1)
{
    if (state == (34 << 0) && place_meeting((x + hsp), y, other))
    {
        other.destroy = 1
        instance_destroy(other)
    }
}
