if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
    if (object_index == obj_coolpineapple || object_index == obj_ghostknight || object_index == obj_tack || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
    {
        if (state != (136 << 0) && state != (127 << 0))
        {
            hitboxcreate = 0
            instance_destroy(other)
        }
    }
    switch object_index
    {
        case obj_pepperman:
            other.x = x + image_xscale * 8
            if (state != (155 << 0))
                instance_destroy(other)
            break
        case obj_badrat:
            other.x = x + image_xscale * 16
            if (state != (82 << 0))
                instance_destroy(other)
            break
        case obj_farmerbaddie:
        case obj_farmerbaddie2:
        case obj_farmerbaddie3:
            other.x = x + image_xscale * 16
            if (state != (82 << 0))
                instance_destroy(other)
            break
        case obj_peppinoclone:
            other.x = x - image_xscale * 10
            if (state != (82 << 0))
                instance_destroy(other)
            break
        case obj_motodude:
            other.x = x + image_xscale * 32
            break
        case obj_robot:
            if (state != (106 << 0) && state != (25 << 0) && state != (93 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            else if (state == (25 << 0))
                other.x = x + image_xscale * 32
            else if (state == (106 << 0) || state == (93 << 0))
                other.x = x + image_xscale * 20
            break
        case obj_soldier:
            other.x = x + image_xscale * 24
            if (state != (127 << 0))
                instance_destroy(other)
            break
        case obj_indiancheese:
            if (state != (136 << 0) && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case obj_thug_red:
        case obj_thug_blue:
        case obj_thug_green:
            if (state != (82 << 0))
            {
                instance_destroy(other)
                punchinst = -4
            }
            break
        case obj_weeniesquire:
            if (state != (82 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case obj_minijohn:
            if (state != (127 << 0) && state != (82 << 0))
                instance_destroy(other)
            break
        case obj_ninja:
            if (state != (130 << 0) && state != (82 << 0))
                instance_destroy(other)
            if (state == (82 << 0))
            {
                if (image_index > 14)
                    instance_destroy(other)
                other.x = x + image_xscale * 24
            }
            break
        case obj_boulder:
            if (!hitwall)
                instance_destroy(other)
            break
        case obj_snickexe:
            if (obj_player1.instakillmove || obj_player1.state == (44 << 0))
            {
                instance_destroy(other)
                hitboxcreate = 0
            }
            break
        case obj_pickle:
            if (state != (131 << 0))
                instance_destroy(other)
            break
        case obj_peasanto:
        case obj_fencer:
        case obj_snowman:
        case obj_clamchor:
        case obj_boneFish:
            if (state != (130 << 0) && state != (127 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case obj_twoliterdog:
            if (state != (143 << 0) || sprite_index != spr_twoliter_fall)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
    }

}
