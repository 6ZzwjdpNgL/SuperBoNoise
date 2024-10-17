var _found = 0
with (obj_player1)
{
    if (state == (13 << 0) || state == (14 << 0) || state == (15 << 0) || state == (16 << 0))
        _found = 1
}
if _found
    image_alpha = 1
else
    image_alpha = 0.5
