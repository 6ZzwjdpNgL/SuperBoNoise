with (obj_player1)
{
    if (state == (123 << 0) && movespeed > 16 && place_meeting((x + hsp), y, other))
        instance_destroy(other)
}
