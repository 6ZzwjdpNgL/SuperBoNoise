if (global.panic && (!donepanic))
{
    donepanic = true
    text = "GET OUT"
    event_perform(ev_other, ev_room_start)
}
text_xscale = (camera_get_view_width(view_camera[0]) - 64) / sprite_get_width(spr_grannybubble)
wave_timer += 20
if (text_xscale != text_oldxscale)
    event_perform(ev_other, ev_room_start)
if showgranny
{
    if (voicecooldown > 1)
        voicecooldown--
    else if (!(place_meeting(x, y, obj_player1)))
        voicecooldown = 0
    if place_meeting(x, y, obj_player1)
    {
        sprite_index = spr_grannygrape
        if (voicecooldown == 0)
        {
            event_play_oneshot("event:/SFX/voice/granny", x, y)
            voicecooldown = 100
        }
    }
    else
        sprite_index = spr_grannygrapeidle
}
var _hide = false
switch text_state
{
    case (20 << 0):
        repeat (_hide + 1)
            text_y = approach(text_y, (-((text_sprite_height * text_yscale))), 5)
        if (obj_player1.state != (275 << 0) && place_meeting(x, y, obj_player1) && (!_hide))
        {
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
