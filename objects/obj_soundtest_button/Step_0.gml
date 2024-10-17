if (!instance_exists(obj_soundtest))
    return;
if (pressBuffer > 0)
{
    image_index = 1
    pressBuffer--
}
else
    image_index = 0
if (type == (1 << 0))
    image_index = obj_soundtest.active
