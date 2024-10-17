with (other)
{
    if (state != (186 << 0) && state != (148 << 0) && state != (187 << 0) && state != (188 << 0))
    {
        xscale = other.image_xscale
        state = (186 << 0)
        tv_push_prompt_once(tv_create_prompt("This is the rocket transformation text", (2 << 0), spr_null, 3), "rocket")
        sprite_index = spr_rocketstart
        image_index = 0
        if (movespeed < 8)
            movespeed = 8
        x = other.x
        y = other.y + 4
    }
}
