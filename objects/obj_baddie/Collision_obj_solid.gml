if place_meeting_collision(x, y)
    return;
if (state != (6 << 0) && state != (156 << 0) && state != (139 << 0) && state != (268 << 0) && ((!(place_meeting(x, y, obj_destructibles))) || place_meeting(x, y, obj_onewaybigblock)))
    instance_destroy()
