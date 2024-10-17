var mh_id = other.id
with (playerid)
{
    if (state != (16 << 0))
    {
        state = (16 << 0)
        morthookID = mh_id
        tauntstoredmovespeed = movespeed
        movespeed = 12
        jumpstop = 0
        instance_destroy(other)
    }
}
