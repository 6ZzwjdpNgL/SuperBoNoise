if (other.id != baddieID && other.state != (7 << 0) && other.state != (140 << 0))
{
    with (other)
    {
        stunstate = 1
        stuntimer = stunmax
        stunned = 0
        state = (7 << 0)
        vsp = -6
        stunstate = 1
    }
}
