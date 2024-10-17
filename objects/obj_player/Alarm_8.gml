if (state == (109 << 0))
{
    state = (2 << 0)
    movespeed = 0
    if scr_solid(x, y)
    {
        var ty = try_solid(0, 1, 312, 32)
        if (ty != -1)
            y += ty
    }
}
else if (state == (198 << 0))
{
    state = (193 << 0)
    movespeed = 0
}
