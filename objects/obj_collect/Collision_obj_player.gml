if (room == rm_blank)
    return;
if (other.state != (188 << 0))
{
    event_play_oneshot("event:/SFX/misc/collect", x, y)
    if (obj_player1.character == "V")
        global.playerhealth = clamp((global.playerhealth + 1), 0, 100)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    var val = heat_calculate(10)
    if (other.object_index == obj_player1)
        global.collect += val
    else
        global.collectN += val
    create_collect(x, y, sprite_index)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    instance_destroy()
}
