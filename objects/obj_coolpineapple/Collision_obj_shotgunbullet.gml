if (state != (149 << 0) && state != (86 << 0))
    return;
with (other)
{
    var _maxhsp = abs(spd)
    var _dir = sign(spd)
    if (x != other.x)
        _dir = sign(x - other.x)
    spd = _maxhsp * _dir
}
if (state != (149 << 0))
{
    sprite_index = parryspr
    movespeed = 8
    state = (149 << 0)
    image_index = 0
}
