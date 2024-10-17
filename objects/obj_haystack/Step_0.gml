mask_index = spr_grannygrape
if (sprite_index != spr_grannygrapeburning && sprite_index != spr_grannygrapeburningup)
{
    with (obj_peasanto)
    {
        if (state == (130 << 0) && place_meeting((x + hsp), y, other))
            other.sprite_index = spr_grannygrapeburningup
    }
    with (obj_player1)
    {
        if ((state == (12 << 0) && (place_meeting((x + hsp), y, other) || place_meeting(x, (y + 1), other))) || (state == (11 << 0) && place_meeting(x, (y + 1), other)))
            other.sprite_index = spr_grannygrapeburningup
    }
}
else if (sprite_index == spr_grannygrapeburningup)
{
    if (floor(image_index) == (image_number - 1))
        sprite_index = spr_grannygrapeburning
}
else if (sprite_index == spr_grannygrapeburning)
{
    with (instance_place((x + 1), y, obj_haystack))
    {
        if (sprite_index != spr_grannygrapeburningup && sprite_index != spr_grannygrapeburning)
            sprite_index = spr_grannygrapeburningup
    }
    with (instance_place((x - 1), y, obj_haystack))
    {
        if (sprite_index != spr_grannygrapeburningup && sprite_index != spr_grannygrapeburning)
            sprite_index = spr_grannygrapeburningup
    }
    with (instance_place(x, (y + 1), obj_haystack))
    {
        if (sprite_index != spr_grannygrapeburningup && sprite_index != spr_grannygrapeburning)
            sprite_index = spr_grannygrapeburningup
    }
    with (instance_place(x, (y - 1), obj_haystack))
    {
        if (sprite_index != spr_grannygrapeburningup && sprite_index != spr_grannygrapeburning)
            sprite_index = spr_grannygrapeburningup
    }
    with (instance_place(x, (y - 1), obj_baddie))
    {
        if (state != (6 << 0))
            instance_destroy()
    }
    if (ds_list_find_index(global.saveroom, id) == -1)
        ds_list_add(global.saveroom, id)
    if (firetimer > 0 && sprite_index == spr_grannygrapeburning && firetimeinf == 0)
        firetimer--
    if (firetimer <= 0 && sprite_index == spr_grannygrapeburning && firetimeinf == 0)
    {
        sprite_index = spr_grannygrape
        firetimer = 200
    }
    playerid = instance_place(x, (y - 1), obj_player1)
    with (playerid)
    {
        if (state != (11 << 0) && state != (49 << 0))
        {
            if (character == "V")
                scr_hurtplayer(id)
            else if scr_transformationcheck()
            {
                scr_losepoints()
                if (state != (11 << 0))
                    tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", (2 << 0), spr_null, 3), "fireass")
                state = (11 << 0)
                image_index = 0
                vsp = -5
                sprite_index = spr_fireass
            }
        }
    }
}
if (state == (10 << 0))
{
    hsp = movespeed * dir
    if (place_meeting((x + sign(hsp)), y, obj_solid) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
        x_to = x
    if ((dir > 0 && x >= x_to) || (dir < 0 && x <= x_to))
    {
        x = x_to
        hsp = 0
        state = (2 << 0)
    }
}
