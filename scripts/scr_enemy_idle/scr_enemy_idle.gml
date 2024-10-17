function scr_enemy_idle() //scr_enemy_idle
{
    hsp = 0
    if (vsp > 1 && (grounded || (grounded && (!(place_meeting(x, y, obj_platform))))))
    {
        create_particle(x, y, (12 << 0), 0)
        image_index = 0
    }
    if ((vsp >= 0 || object_index == obj_miniufo || object_index == obj_kentukybomber) && sprite_index == scaredspr && scaredbuffer <= 0)
    {
        state = (136 << 0)
        sprite_index = walkspr
        if (object_index == obj_treasureguy)
            state = (143 << 0)
        if (object_index == obj_pickle && attacking)
        {
            attacking = 0
            bombreset = 0
        }
    }
    if (scaredbuffer > 0)
        scaredbuffer--
    if (sprite_index == spr_tack_turn && floor(image_index) == (image_number - 1))
    {
        sprite_index = walkspr
        state = (136 << 0)
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
    if (object_index == obj_bobby)
    {
        image_speed = 0.3
        if chance(5)
        {
            sprite_index = walkspr
            image_index = 0
            state = (136 << 0)
        }
    }
    else
        image_speed = 0.35
    return;
}

