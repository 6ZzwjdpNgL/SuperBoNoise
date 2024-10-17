if ((!instance_exists(baddieID)) || (!baddieID.thrown) || baddieID.state != (140 << 0))
{
    instance_destroy()
    return;
}
x = baddieID.x
y = baddieID.y
image_xscale = (-baddieID.image_xscale)
