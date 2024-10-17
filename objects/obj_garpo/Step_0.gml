var playerid = obj_player1
var _hide = (instance_exists(obj_treasure) || global.inSecret)
if ((!event_isplaying(grapeSnd)) && _hide == false)
    fmod_event_play(grapeSnd)
else if (event_isplaying(grapeSnd) && _hide == true)
    fmod_event_stop(grapeSnd)
event_quick3D(grapeSnd)
if (!instance_exists(playerid))
    return;
var _move = true
with (obj_player1)
{
    if (_hide || state == (100 << 0) || state == (92 << 0) || state == (48 << 0) || state == (114 << 0))
        _move = false
}
if (!absent)
{
    if (image_alpha >= 1 && (!instance_exists(obj_fadeout)) && _move && (!obj_player1.cutscene))
    {
        var dir = point_direction(x, y, playerid.x, playerid.y)
        x += lengthdir_x(maxspeed, dir)
        y += lengthdir_y(maxspeed, dir)
    }
    else
        image_alpha += 0.01
}
if ((!_move) || absent)
    image_alpha = approach(image_alpha, 0, 0.1)
if (_move && place_meeting(x, y, playerid) && (!playerid.cutscene) && playerid.state != (148 << 0) && (!instance_exists(obj_fadeout)) && (!instance_exists(obj_endlevelfade)) && image_alpha >= 1)
{
    with (playerid)
    {
        instance_destroy(obj_fadeout)
        instance_destroy(other, false)
        mail_trigger((16 << 0))
        targetDoor = "A"
        room_goto(timesuproom)
        state = (66 << 0)
        sprite_index = spr_gameover
        image_index = 0
        stop_music()
    }
    instance_destroy(id, false)
}
if (maxspeed < 3 && image_alpha >= 1)
    maxspeed += 0.01
