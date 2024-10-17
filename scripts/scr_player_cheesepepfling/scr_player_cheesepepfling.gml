function state_player_cheesepepfling() //state_player_cheesepepfling
{
    hsp = 0
    sprite_index = spr_cheesepepintro
    if (fling < 30)
        fling += 0.2
    if (!input_check("attack"))
    {
        if (fling > 0.5)
        {
            movespeed = fling
            hsp = movespeed * xscale
            vsp = -6
            state = (30 << 0)
            sprite_index = spr_cheesepepjumpstart
            image_index = 0
        }
        else
        {
            state = (26 << 0)
            sprite_index = spr_cheesepepintro
            image_index = 0
        }
    }
    return;
}

