x = playerid.x
y = playerid.y
mask_index = playerid.mask_index
xs = approach(xs, 1, 0.12)
image_xscale = xs
image_yscale = xs
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false
else
    visible = playerid.visible
if (playerid.state != (267 << 0) && playerid.state != (63 << 0) && (playerid.state != (86 << 0) || playerid.tauntstoredstate != (267 << 0)))
    instance_destroy()
