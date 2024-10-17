if ((!grabbed) && (other.state == (44 << 0) || other.state == (82 << 0) || other.state == (45 << 0)) && unpickable == 0)
{
    instance_create((x + obj_player1.xscale * 40), y, obj_punchdust)
    with (other)
    {
        image_index = 0
        sprite_index = spr_haulingstart
        baddiegrabbedID = other.id
        grabbingenemy = 1
        state = (81 << 0)
    }
    playerid = other.object_index
    grabbed = 1
}
if ((!grabbed) && unpickable == 0 && (!ratgrabbed) && other.state == (195 << 0))
{
    ratplayerid = other.id
    ratgrabbed = 1
    state = (207 << 0)
    other.ratgrabbedID = id
    other.state = (193 << 0)
}
