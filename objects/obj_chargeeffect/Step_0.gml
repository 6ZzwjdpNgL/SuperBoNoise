depth = obj_player1.depth - 1
image_xscale = playerid.xscale
if (playerid.state != (186 << 0) && playerid.state != (123 << 0) && playerid.state != (104 << 0) && playerid.state != (155 << 0))
    instance_destroy()
x = playerid.x + (playerid.character == "M" ? 18 : 0) * playerid.xscale
y = playerid.y - (playerid.character == "M" ? 10 : 0)
if (playerid.state == (186 << 0))
    x = playerid.x + playerid.xscale * 18
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false
