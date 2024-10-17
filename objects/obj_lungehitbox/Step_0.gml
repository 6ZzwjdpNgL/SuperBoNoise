if (playerid.state != (45 << 0) && playerid.state != (44 << 0))
{
    instance_destroy()
    return;
}
x = playerid.x + 24 * playerid.xscale
y = playerid.y
