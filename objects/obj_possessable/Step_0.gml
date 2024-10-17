if (state == (19 << 0))
{
    with (playerid)
    {
        sprite_index = spr_ghostidle
        x = other.x
        y = other.y
        if (input_check_pressed("up") && other.object_index != obj_randomobject)
        {
            state = (18 << 0)
            vsp = -10
            create_particle(x, y, (9 << 0), 0)
            visible = true
            other.state = (2 << 0)
        }
    }
}
