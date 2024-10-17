with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == (2 << 0) || state == (60 << 0) || state == (106 << 0) || state == (123 << 0) || state == (105 << 0) || state == (59 << 0) || state == (94 << 0) || state == (62 << 0)) && state != (109 << 0) && state != (107 << 0) && state != (110 << 0) && state != (113 << 0))
    {
        mach2 = 0
        state = (95 << 0)
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
