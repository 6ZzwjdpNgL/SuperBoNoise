if (state == (136 << 0))
{
    hsp = 0
    state = (128 << 0)
    alarm[0] = 80 + irandom(110)
}
else if (state != (86 << 0))
{
    image_xscale *= -1
    hsp = 0
    state = (136 << 0)
    alarm[0] = 60 + irandom(130)
}
else
    alarm[0] = 1
