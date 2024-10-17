event_inherited()
with (other)
{
    if (state == (63 << 0) || state == (148 << 0) || state == (210 << 0))
        return;
    hsp_carry += lengthdir_x(other.currentMovespeed, other.image_angle)
    vsp_carry += lengthdir_y(other.currentMovespeed, other.image_angle)
}
