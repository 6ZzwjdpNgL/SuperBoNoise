function state_player_tubeenter() //state_player_tubeenter
{
    visible = false
    with (tube_id)
    {
        var _offset_x = 32 * image_xscale
        var _offset_y = 14 * image_yscale
        other.x = approach(other.x, (x + _offset_x), other.stored_hsp)
        other.y = approach(other.y, (y + _offset_y), other.stored_vsp)
        if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
        {
            switch object_index
            {
                case obj_tubeenter:
                    if (state != (2 << 0))
                    {
                        if (floor(image_index) == (image_number - 1))
                        {
                            other.state = (152 << 0)
                            other.hsp = hsp * other.stored_hsp
                            other.vsp = vsp * other.stored_vsp
                            other.tube_vsp = vsp * other.stored_vsp
                            state = (2 << 0)
                        }
                    }
                    else
                    {
                        state = (152 << 0)
                        image_index = 0
                    }
                    break
                default:
                    other.state = (152 << 0)
                    other.hsp = hsp * other.stored_hsp
                    other.vsp = vsp * other.stored_vsp
                    other.tube_vsp = vsp * other.stored_vsp
            }

        }
    }
}

