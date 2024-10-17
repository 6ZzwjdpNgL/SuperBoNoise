if (room == rm_blank)
    return;
if (obj_player1.state != (109 << 0) && global.secretfollow == 0)
{
    global.heattime = 60
    global.style += 10
    ds_list_add(global.saveroom, id)
    global.secretfollow = 1
    panic = 0
}
