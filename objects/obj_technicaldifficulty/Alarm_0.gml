var _check = ((storedState == (270 << 0) || storedState == (273 << 0) || storedState == (271 << 0) || storedState == (272 << 0)) ? (270 << 0) : (2 << 0))
use_static = 1
static_index = sprite_get_number(spr_tvstatic) - 1
static_dir = -1
event_play_oneshot("event:/SFX/misc/tvswitchback")
with (playerid)
{
    if (!isgustavo)
        state = _check
    else
        state = (193 << 0)
    visible = true
    x = roomstartx
    y = roomstarty
    landAnim = 0
}
with (obj_ghostfollow)
{
    x = xstart
    y = ystart
}
