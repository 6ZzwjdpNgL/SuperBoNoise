var p = 0
with (obj_player1)
{
    if (targetDoor == "LAP")
    {
        p = 1
        state = (148 << 0)
        x = other.x
        y = other.y
        roomstartx = x
        roomstarty = y
        visible = false
        with (obj_garpo)
        {
            x = other.x
            y = other.y
        }
    }
}
if (!p)
    instance_destroy()
else
    active = 1
