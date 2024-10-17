event_inherited()
if (state == (140 << 0))
{
    if (!(scr_solid(x, y)))
        scr_collide()
    else
    {
        x += hsp
        y += vsp
    }
}
