with (other)
{
    if (state != (192 << 0) && vsp > 0 && (!(place_meeting(x, yprevious, other))))
    {
        if (state == (13 << 0) || state == (14 << 0) || state == (15 << 0))
            has_mort = 1
        else
            has_mort = 0
    }
}
