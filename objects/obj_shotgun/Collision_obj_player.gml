with (other)
{
    if (state == (44 << 0) || state == (45 << 0) || state == (82 << 0))
    {
        image_index = 0
        sprite_index = spr_shotgunpullout
        instance_destroy(other)
        shotgunAnim = 1
        state = (68 << 0)
        tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", (2 << 0), spr_tv_shotgun, 3), "shotgun")
        global.heattime = 60
    }
}
