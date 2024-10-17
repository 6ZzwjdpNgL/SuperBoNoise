with (obj_player1)
{
    if (grounded && state != (10 << 0))
    {
        global.timeractive = 0
        global.panic = false
        global.panicbg = 0
        image_speed = 0.35
        x = other.x + 30
        xscale = -1
        state = (10 << 0)
        image_index = 0
        costumercutscenetimer = 70
        sprite_index = spr_player_knock
        movespeed = 0
        hsp = 0
    }
}
