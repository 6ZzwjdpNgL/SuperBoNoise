with (other)
{
    if (input_check("up") && ladderbuffer == 0 && (state == (2 << 0) || state == (60 << 0) || state == (106 << 0) || state == (123 << 0) || state == (105 << 0) || state == (59 << 0) || state == (94 << 0) || state == (62 << 0)) && state != (109 << 0) && state != (107 << 0) && state != (110 << 0) && state != (113 << 0))
    {
        state = (95 << 0)
        x = other.x + 16
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
    if (input_check("up") && ladderbuffer == 0 && (state == (194 << 0) || state == (193 << 0)))
    {
        state = (263 << 0)
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
            {
                wait = 1
                instance_create(x, y, obj_genericpoofeffect)
            }
        }
        brick = 0
        x = other.x + 16
        y = floor(y)
        if ((y % 2) == 1)
            y -= 1
    }
}
