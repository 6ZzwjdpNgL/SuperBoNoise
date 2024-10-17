draw_rectangle_color(0, 0, obj_gameFrame.defaultwidth, obj_gameFrame.defaultheight, c_black, c_black, c_black, c_black, 0)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var _os = optionselected
var _os_fs = optionsaved_fullscreen
draw_text_colour(480, 50, "FULLSCREEN", c_white, c_white, c_white, c_white, (_os == 0 ? 1 : 0.5))
draw_text_colour(380, 100, "ON", c_white, c_white, c_white, c_white, (_os_fs == 0 ? 1 : 0.5))
draw_text_colour(580, 100, "OFF", c_white, c_white, c_white, c_white, (_os_fs == 1 ? 1 : 0.5))
var _os_rs = optionsaved_resolution
draw_text_colour(480, 180, "RESOLUTION", c_white, c_white, c_white, c_white, (_os == 1 ? 1 : 0.5))
draw_text_colour(300, 230, concat(480, "X", 270), c_white, c_white, c_white, c_white, (_os_rs == 0 ? 1 : 0.5))
draw_text_colour(480, 230, concat(obj_gameFrame.defaultwidth, "X", obj_gameFrame.defaultheight), c_white, c_white, c_white, c_white, (_os_rs == 1 ? 1 : 0.5))
draw_text_colour(680, 230, concat(1920, "X", 1080), c_white, c_white, c_white, c_white, (_os_rs == 2 ? 1 : 0.5))
draw_text_colour(480, 295, "KEY CONFIG", c_white, c_white, c_white, c_white, (_os == 2 ? 1 : 0.5))
draw_text_colour(480, 345, "AUDIO CONFIG", c_white, c_white, c_white, c_white, (_os == 3 ? 1 : 0.5))
draw_text_colour(480, 395, "MOD CONFIG", c_white, c_white, c_white, c_white, (_os == 4 ? 1 : 0.5))
var _os_vb = optionsaved_vibration
draw_text_colour(480, 440, "CONTROLLER VIBRATION", c_white, c_white, c_white, c_white, (_os == 5 ? 1 : 0.5))
draw_text_colour(380, 480, "ON", c_white, c_white, c_white, c_white, (_os_vb == 0 ? 1 : 0.5))
draw_text_colour(580, 480, "OFF", c_white, c_white, c_white, c_white, (_os_vb == 1 ? 1 : 0.5))
draw_sprite(spr_option_bo, 0, 557, 14)
draw_sprite(spr_option_video, 0, 49, 88)
