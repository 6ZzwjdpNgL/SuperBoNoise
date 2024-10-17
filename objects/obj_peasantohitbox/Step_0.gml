if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
if (ID.state != (130 << 0))
{
    ID.hitboxcreate = 0
    instance_destroy()
}
x = ID.x + ID.image_xscale * 12
y = ID.y
image_xscale = ID.image_xscale
