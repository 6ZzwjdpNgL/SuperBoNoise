state = (136 << 0)
playerid = instance_nearest(x, y, obj_player1)
targetx = (playerid.xscale > 0 ? 896 : 64)
currentx = x - camera_get_view_x(view_camera[0])
attack_buffer = 0
attack_max = 120
hitboxcreate = 0
