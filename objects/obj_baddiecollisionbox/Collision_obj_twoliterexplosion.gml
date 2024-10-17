if (instance_exists(baddieID) && baddieID.invtime == 0 && baddieID.rattime <= 0 && baddieID.state != (6 << 0) && baddieID.state != (139 << 0) && (!baddieID.invincible) && baddieID.instantkillable)
{
    instance_destroy(baddieID)
    instance_destroy()
}
