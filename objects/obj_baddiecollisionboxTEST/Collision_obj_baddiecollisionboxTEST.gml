if (object_index != obj_pizzaball)
{
    with (other)
    {
        if (instance_exists(baddieID) && instance_exists(other.baddieID) && baddieID != other.id && other.baddieID.killbyenemy)
        {
            if (baddieID.state == (140 << 0) && baddieID.thrown == true)
            {
                instance_destroy(other.baddieID)
                if (baddieID.pepperman_grab == 1)
                    instance_destroy(baddieID)
            }
        }
    }
}
