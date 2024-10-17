if (obj_player1.state == (210 << 0) || instance_exists(obj_backtohub_fadeout))
    return;
with (other)
{
    x = other.x
    y = other.y + other.sprite_height - 46
    if (!instance_exists(obj_fadeout))
    {
        obj_player1.lastroom = room
        obj_player2.lastroom = room
        obj_player1.targetDoor = other.targetDoor
        obj_player1.targetRoom = other.targetRoom
        obj_player1.hallway = 1
        obj_player1.hallwaydirection = other.image_xscale
        if instance_exists(obj_player2)
        {
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            obj_player2.hallway = 1
            obj_player2.hallwaydirection = other.image_xscale
        }
        other.visited = 1
        event_play_oneshot("event:/SFX/misc/door")
        instance_create(x, y, obj_fadeout)
    }
}
