if (room == rm_blank)
{
    visible = false
    return;
}
x = -1000
y = -1000
visible = false
state = (20 << 0)
if (!global.coop)
{
    obj_player1.spotlight = 1
    x = -1000
    y = -1000
    state = (20 << 0)
    if instance_exists(obj_coopflag)
        instance_destroy(obj_coopflag)
    if instance_exists(obj_cooppointer)
        instance_destroy(obj_cooppointer)
}
else if (input_check("start") && (!fightball) && obj_player1.state != (123 << 0) && obj_player1.state != (6 << 0))
    state = (188 << 0)
if ((!visible) && state == (97 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
