with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        if (state != (2 << 0) && state != (102 << 0) && state != (73 << 0) && state != (113 << 0) && state != (94 << 0) && state != (44 << 0))
            other.visible = true
        else
            other.visible = false
    }
    other.x = x - 20 * xscale
    other.y = y
    other.image_xscale = (-xscale)
}
if (room == rank_room)
    visible = false
