instance_destroy()
with (playerid)
{
    if (!isgustavo)
        state = (2 << 0)
    else
        state = (193 << 0)
    visible = true
}
with (obj_ghostfollow)
{
    x = xstart
    y = ystart
}
