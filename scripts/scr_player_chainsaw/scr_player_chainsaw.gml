function state_player_chainsaw() //state_player_chainsaw
{
    hsp = 0
    vsp = 0
    x = hitX + (random_range(-4, 4))
    y = hitY + (random_range(-4, 4))
    hitLag--
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if input_check_pressed("slap")
        input_buffer_slap = 0
    image_speed = 0
    if input_check_pressed("slap")
        input_attack_buffer = 8
    if (hitLag <= 0)
    {
        x = hitX
        y = hitY
        movespeed = tauntstoredmovespeed
        sprite_index = tauntstoredsprite
        state = tauntstoredstate
        vsp = tauntstoredvsp
        if (global.attackstyle == 0)
        {
            if ((tauntstoredstate == (44 << 0) && (tauntstoredsprite == spr_null || tauntstoredsprite == spr_null || tauntstoredsprite == spr_null || tauntstoredsprite == spr_null)) || sprite_index == spr_piledriverland)
            {
                jumpAnim = 1
                state = (94 << 0)
                sprite_index = spr_suplexland
                vsp = -11
                jumpstop = 0
                image_index = 0
            }
            else if (tauntstoredstate == (44 << 0) || tauntstoredstate == (8 << 0))
                state = (2 << 0)
        }
        if (global.attackstyle == 1)
        {
            if ((tauntstoredstate == (44 << 0) && (tauntstoredsprite == spr_null || tauntstoredsprite == spr_null || tauntstoredsprite == spr_null || tauntstoredsprite == spr_null)) || sprite_index == spr_piledriverland)
            {
                movespeed = 4
                state = (93 << 0)
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                image_index = 0
                vsp = -5
            }
            else if (tauntstoredstate == (44 << 0) || tauntstoredstate == (8 << 0))
            {
                movespeed = 4
                state = (93 << 0)
                sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch)
                image_index = 0
            }
        }
        if (global.attackstyle == 2)
        {
            if (tauntstoredstate == (45 << 0))
                state = (45 << 0)
        }
    }
    return;
}

