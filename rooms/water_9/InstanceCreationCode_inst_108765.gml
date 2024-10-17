flags.do_once = false
roseWater = false
condition = function() //anon@82@gml_RoomCC_water_9_10_Create
{
    return ((!instance_exists(obj_hungrypillar)) && (!roseWater));
}

output = function() //anon@171@gml_RoomCC_water_9_10_Create
{
    with (obj_waterTop)
    {
        if (id != 108756)
            instance_destroy()
        else if (event_type == 7 && event_number == 4)
        {
            x = -64
            y = -288
            image_xscale = 138
            image_yscale = 84
            roseWater = true
        }
        else
        {
            var rising_speed = 4
            x = -64
            image_xscale = 138
            if (y > -288)
            {
                y = approach(y, -288, rising_speed)
                image_yscale += rising_speed
            }
            else
            {
                y = -288
                image_yscale = 84
                roseWater = true
            }
        }
    }
}

