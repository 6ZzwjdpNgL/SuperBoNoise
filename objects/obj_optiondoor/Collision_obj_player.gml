var _actor = 0
with (obj_player1)
{
    if (state == (148 << 0))
        _actor = 1
}
if _actor
    return;
with (other)
{
    if (input_check("up") && grounded && (!instance_exists(obj_option)) && (state == (2 << 0) || state == (105 << 0) || state == (106 << 0) || state == (60 << 0) || state == (123 << 0) || state == (101 << 0)))
    {
        instance_create(x, y, obj_option)
        state = (148 << 0)
    }
}
