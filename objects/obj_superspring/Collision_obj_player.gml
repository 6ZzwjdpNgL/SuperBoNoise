with (other)
{
    if (state != (99 << 0) && state != (188 << 0) && state != (148 << 0))
    {
        if (state == (49 << 0) || state == (50 << 0) || state == (40 << 0))
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        if (state == (53 << 0))
            instance_create(x, y, obj_bombexplosion)
        x = other.x
        instance_create(x, (y - 20), obj_bangeffect)
        if (other.image_yscale == 1)
        {
            sprite_index = spr_superspringplayer
            state = (99 << 0)
            vsp = -10
        }
        else
        {
            state = (110 << 0)
            vsp = 10
            sprite_index = spr_player_rockethitwall
        }
        other.image_index = 0
        other.sprite_index = spr_null
    }
}
