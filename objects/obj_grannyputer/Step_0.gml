var _hide = 0
wave_timer += 20
with (obj_granny)
{
    if (text_state != (20 << 0))
        _hide = 1
}
switch text_state
{
    case (20 << 0):
        repeat (_hide + 1)
            text_y = approach(text_y, (-((text_sprite_height * text_yscale))), 5)
        if (place_meeting(x, y, obj_player1) && (!_hide))
        {
            if (text_y == (-((text_sprite_height * text_yscale))))
                event_play_oneshot("event:/SFX/voice/grannypute", x, y)
            text_state = (137 << 0)
            text_vsp = 0
        }
        break
    case (137 << 0):
        text_y += text_vsp
        if (text_vsp < 20)
            text_vsp += 0.5
        if (text_y > text_ystart)
            text_state = (2 << 0)
        break
    case (2 << 0):
        text_y = approach(text_y, text_ystart, 2)
        if ((!(place_meeting(x, y, obj_player1))) || _hide)
            text_state = (20 << 0)
        break
}

text_wave_x = Wave(-5, 5, 2, 10)
text_wave_y = Wave(-1, 1, 4, 0)
