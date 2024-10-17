if active
{
    if (device_found && (!(device_selected[(0 << 0)])))
    {
        for (var i = 0; i < 8; i++)
        {
            var _index = scr_button_pressed(i)
            if (_index != -2)
            {
                device_selected[(0 << 0)] = true
                global.player_input_device = _index
            }
        }
    }
    i = 0
    while (i < 2)
    {
        if (device_selected[i] && global.player_input_device >= 0)
        {
            if (!gamepad_is_connected(global.player_input_device))
            {
                active = false
                device_selected[i] = false
                global.player_input_device = -2
                disconnected_device = i
                break
            }
            else
                i++
        }
        else
            i++
    }
    if (global.player_input_device >= 0 && gamepad_is_connected(global.player_input_device))
    {
        if (vibrationDecay1 > 0)
            vibrationDecay1--
        else if (vibration1 != 0)
        {
            vibration1 = 0
            gamepad_set_vibration(global.player_input_device, vibration1, vibration1)
        }
    }
}
else
{
    i = 0
    while (i < 8)
    {
        var slot = scr_button_pressed(i)
        if (global.player_input_device == -2 && slot >= -1)
        {
            global.player_input_device = slot
            active = true
            break
        }
        else
            i++
    }
}
if keyboard_check_pressed(vk_f1)
    scr_resetinput()
