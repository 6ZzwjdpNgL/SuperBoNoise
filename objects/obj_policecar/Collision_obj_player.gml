if (state == (154 << 0))
    return;
if (ds_queue_size(followqueue) < LAG_STEPS)
    return;
with (obj_player1)
{
    targetRoom = other.targetRoom
    lastroom = room
    targetDoor = other.targetDoor
    visible = false
    if (state != (188 << 0))
        state = (154 << 0)
    cutscene = 1
    hsp = 0
    vsp = 0
}
grav = 0
state = (154 << 0)
hsp = 10
image_xscale = 1
vsp = 0
