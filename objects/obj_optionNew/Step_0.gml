var m = menuarr[menu]
var bgArr = [[(0 << 0)], [(1 << 0)], [(2 << 0)], [(3 << 0)], [(4 << 0), (5 << 0), (6 << 0), (7 << 0)], [(8 << 0)]]
for (var i = 0; i < array_length(bgArr); i++)
{
    var target = 1
    if (!(array_contains(bgArr[i], menu)))
        target = 0
    for (var j = 0; j < array_length(bgArr[i]); j++)
    {
        var mn = menuarr[bgArr[i][j]]
        mn.alpha = approach(mn.alpha, target, (target == 1 ? 0.1 : 0.05))
    }
}
bg_x--
bg_y--
var move = input_check_pressed("down") - input_check_pressed("up")
var move2 = input_check_pressed("right") - input_check_pressed("left")
var key_confirm = input_check_pressed("jump")
var key_back = (input_check_pressed("slap") || keyboard_check_pressed(vk_escape))
if (backbuffer > 0)
{
    backbuffer--
    key_back = false
    key_confirm = false
}
if (move != 0)
    slidebuffer = 0
moveslide = input_check("right") - input_check("left")
var sel = selected
selected += move
selected = clamp(selected, 0, (array_length(m.options) - 1))
var option = m.options[selected]
if (sel != selected)
{
    event_play_oneshot("event:/SFX/ui/pauseselect")
    if (option.type == (5 << 0))
        slidevalue = option.value
    if (m.options[sel].type == (5 << 0))
        m.options[sel].silence()
}
switch option.type
{
    case (1 << 0):
    case (2 << 0):
        if key_confirm
        {
            option.onPress()
            event_play_oneshot("event:/SFX/ui/optionselect")
        }
        break
    case (3 << 0):
        if (key_confirm || move2 != 0)
        {
            option.onPress()
            event_play_oneshot("event:/SFX/ui/optionselect")
        }
        break
    case (4 << 0):
        if (move2 != 0)
        {
            option.onPress(move2)
            event_play_oneshot("event:/SFX/ui/optionselect")
        }
        break
    case (5 << 0):
        if (moveslide != 0 && slidebuffer <= 0 && (option.value + moveslide) != 101 && (option.value + moveslide) != -1)
        {
            slidebuffer = 1
            option.onChange(moveslide)
            if (menu == (1 << 0))
                set_option_params()
        }
        else if (moveslide == 0 && slidevalue != option.value)
        {
            option.doSet()
            slidevalue = option.value
        }
        else
        {
            option.moving = false
            option.silence()
        }
        break
}

if (slidebuffer > 0)
    slidebuffer--
if (key_back && (!instance_exists(obj_option_keyconfig)))
{
    event_play_oneshot("event:/SFX/ui/back")
    if (menu == (0 << 0))
    {
        if (room == rm_mainmenu)
        {
            with (obj_pauseNew)
                state = (1 << 0)
        }
        instance_destroy()
    }
    else
    {
        for (i = 0; i < array_length(m.options); i++)
        {
            var b = m.options[i]
            if (b.type == (5 << 0))
                b.silence()
        }
        m.options[0].onPress()
    }
}
if (keyboard_string != "")
{
    keystring += string_lower(keyboard_string)
    keyboard_string = ""
}
if string_ends_with(keystring, "awesome")
{
    event_play_oneshot("event:/SFX/special/magicharp")
    menuprev = menu
    menu = (8 << 0)
    selected = 0
    keystring = ""
}
