with (other)
{
    if (other.hurtplayer == 0)
    {
        if input_check_pressed("jump")
        {
            vsp = -20
            if (state == (2 << 0) || state == (94 << 0) || hsp == 0)
            {
                sprite_index = spr_null
                state = (94 << 0)
            }
            image_index = 0
            jumpAnim = 1
            jumpstop = 1
            other.hurtplayer = 1
        }
    }
}
