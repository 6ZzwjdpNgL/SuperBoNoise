if (other.state == (188 << 0))
    return;
if (sprite_index == spr_boxcrusher_fall)
{
    other.image_index = 0
    other.state = (108 << 0)
    other.x = x
    other.y = y
}
else if (sprite_index == spr_boxcrusher_land)
{
    if (other.state != (35 << 0))
        tv_push_prompt_once(tv_create_prompt("This is the boxxed transformation text", (2 << 0), spr_null, 3), "boxxedpep")
    other.boxxed = 1
    other.movespeed = 0
    other.state = (35 << 0)
    if (other.sprite_index != other.spr_boxxedpepintro)
        other.sprite_index = other.spr_boxxedpepintro
    other.image_index = 0
    other.hsp = 0
    other.vsp = 0
    other.x = x
    other.y = y - 20
}
