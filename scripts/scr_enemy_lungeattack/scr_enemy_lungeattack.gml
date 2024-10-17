function scr_enemy_lungeattack() //scr_enemy_lungeattack
{
    hsp = (-image_xscale) * 4
    vsp = 0
    var _l = 0
    with (obj_player1)
    {
        if (state == (45 << 0) && image_index <= 4)
            _l = 1
    }
    if (!_l)
        hitLag = 0
    if (hitLag > 0)
        hitLag--
    else
    {
        state = (140 << 0)
        hsp = hithsp
        vsp = hitvsp
        stunned = 200
    }
}

