if (room == rm_blank)
    return;
if (obj_player1.state != (109 << 0) && global.sausagefollow == 0)
{
    global.heattime = 60
    global.style += 10
    ds_list_add(global.saveroom, id)
    if (global.toppintotal < 5)
        obj_tv.message = "YOU NEED " + (string(5 - global.toppintotal)) + " MORE TOPPINS!"
    if (global.toppintotal == 5)
        obj_tv.message = "YOU HAVE ALL TOPPINS!"
    obj_tv.showtext = 1
    obj_tv.alarm[0] = 150
    global.toppintotal += 1
    global.sausagefollow = 1
    panic = 0
}
