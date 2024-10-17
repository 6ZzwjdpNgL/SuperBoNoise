with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if ((!isgustavo) && state != (18 << 0) && state != (19 << 0) && state != (148 << 0) && state != (149 << 0) && state != (188 << 0))
    {
        scr_losepoints()
        tv_push_prompt_once(tv_create_prompt("This is the ghost transformation text", (2 << 0), spr_null, 3), "ghost")
        grav /= 2
        state = (18 << 0)
        sprite_index = spr_ghostidle
        with (instance_create(x, y, obj_baddieDead))
        {
            hsp = other.image_xscale * 3
            image_xscale = (-other.image_xscale)
            sprite_index = other.spr_dead
        }
        other.debris = 0
    }
}
