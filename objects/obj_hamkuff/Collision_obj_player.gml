if (state != (140 << 0))
{
    if (!other.isgustavo)
    {
        if (other.state != (123 << 0) || (!other.launched))
        {
            if (state != (208 << 0))
            {
                sprite_index = spr_hamkuff_chain1
                state = (208 << 0)
                playerid = other.id
            }
        }
        else
            instance_destroy()
    }
    else if (other.brick && state != (208 << 0))
    {
        other.brick = 0
        state = (208 << 0)
        sprite_index = spr_hamkuff_chain1
        state = (208 << 0)
        with (other)
        {
            state = (198 << 0)
            xscale = (-other.image_xscale)
            vsp = -10
        }
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = 1
            baddieID = other.id
            other.playerid = id
        }
    }
    else if (other.state == (261 << 0))
        instance_destroy()
    else
    {
        with (other)
        {
            state = (198 << 0)
            xscale = other.image_xscale
            vsp = -10
        }
    }
}
