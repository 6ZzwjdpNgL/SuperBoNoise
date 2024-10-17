with (other)
{
    if (state != (267 << 0))
    {
        state = (267 << 0)
        vsp = 0
        with (obj_antigravbubble)
        {
            if (playerid == other.id)
                instance_destroy()
        }
        with (instance_create(x, y, obj_antigravbubble))
            playerid = other.id
        other.image_index = 0
        other.sprite_index = spr_antigrav_activate
    }
}
