if (state != (154 << 0))
    return;
if (!instance_exists(obj_fadeout))
{
    with (instance_create(x, y, obj_fadeout))
        roomreset = 1
}
