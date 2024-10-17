// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
menu = 0
menuprev = 0
menuarr = []
selected = 0
backbuffer = 0
slidebuffer = 0
slidevalue = 0
moveslide = 0
bg_x = 0
bg_y = 0
keystring = ""
keyboard_string = ""
optionMenu = function(argument0, argument1, argument2) constructor //anon@864@gml_Object_obj_optionNew_Create_0
{
    if (argument1 == undefined)
        argument1 = bg_options_general
    if (argument2 == undefined)
        argument2 = false
    type = (0 << 0)
    index = argument0
    align_center = argument2
    bgspr = argument1
    ypad = 40
    xpad = 150
    options = []
    alpha = 0
    addOption = function() //anon@1095@anon@864_gml_Object_obj_optionNew_Create_0
    {
        for (var i = 0; i < argument_count; i++)
        {
            var option = argument[i]
            array_push(options, option)
            show_debug_message(concat("Added option: ", option.name, " to menu index: ", index))
        }
    }

}

optionPress = function(argument0) constructor //anon@1389@gml_Object_obj_optionNew_Create_0
{
    type = (1 << 0)
    name = argument0
    onActivate = undefined
    onPress = function() //anon@1500@anon@1389_gml_Object_obj_optionNew_Create_0
    {
        if (!is_undefined(onActivate))
            self.onActivate()
    }

}

optionRedirect = function(argument0, argument1, argument2) constructor //anon@1703@gml_Object_obj_optionNew_Create_0
{
    if (argument2 == undefined)
        argument2 = [spr_null, 0]
    type = (2 << 0)
    name = argument0
    drawArr = argument2
    target = argument1
    onActivate = undefined
    drawIcon = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //anon@1893@anon@1703_gml_Object_obj_optionNew_Create_0
    {
        if (argument2 == undefined)
            argument2 = 1
        if (argument3 == undefined)
            argument3 = 1
        if (argument4 == undefined)
            argument4 = 0
        if (argument5 == undefined)
            argument5 = c_white
        if (argument6 == undefined)
            argument6 = 1
        draw_sprite_ext(drawArr[0], drawArr[1], argument0, argument1, argument2, argument3, argument4, argument5, argument6)
    }

    onPress = function() //anon@2044@anon@1703_gml_Object_obj_optionNew_Create_0
    {
        with (obj_optionNew)
        {
            menuprev = menu
            menu = other.target
            selected = 0
        }
        if (!is_undefined(onActivate))
            self.onActivate()
    }

}

optionToggle = function(argument0, argument1, argument2) constructor //anon@2333@gml_Object_obj_optionNew_Create_0
{
    type = (3 << 0)
    name = argument0
    variable = argument1
    key = argument2
    value = variable_global_get(argument1)
    onActivate = undefined
    onPress = function() //anon@2528@anon@2333_gml_Object_obj_optionNew_Create_0
    {
        var val = variable_global_get(variable)
        val = (!val)
        variable_global_set(variable, val)
        value = val
        ini_open_from_string(obj_savesystem.ini_str_options)
        ini_write_real("Option", key, val)
        obj_savesystem.ini_str_options = ini_close()
        if (!is_undefined(onActivate))
            self.onActivate()
    }

}

optionMultiple = function(argument0, argument1, argument2, argument3) constructor //anon@3017@gml_Object_obj_optionNew_Create_0
{
    type = (4 << 0)
    name = argument0
    variable = argument1
    key = argument2
    value = variable_global_get(argument1)
    dictionary = argument3
    onActivate = undefined
    onPress = function(argument0) //anon@3255@anon@3017_gml_Object_obj_optionNew_Create_0
    {
        var val = variable_global_get(variable)
        val += argument0
        if (val < 0)
            val = array_length(dictionary) - 1
        if (val >= array_length(dictionary))
            val = 0
        variable_global_set(variable, val)
        value = val
        ini_open_from_string(obj_savesystem.ini_str_options)
        ini_write_real("Option", key, val)
        obj_savesystem.ini_str_options = ini_close()
        if (!is_undefined(onActivate))
            self.onActivate()
    }

}

optionSlide = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6) constructor //anon@3920@gml_Object_obj_optionNew_Create_0
{
    if (argument3 == undefined)
        argument3 = 100
    if (argument4 == undefined)
        argument4 = undefined
    if (argument5 == undefined)
        argument5 = false
    if (argument6 == undefined)
        argument6 = 0
    type = (5 << 0)
    name = argument0
    variable = argument1
    key = argument2
    use_array = argument5
    index = argument6
    value_min = 0
    value_max = 100
    if argument5
        value = (array_get(variable_global_get(argument1), argument6)) * argument3
    else
        value = variable_global_get(argument1) * argument3
    multiplier = argument3
    moving = false
    onActivate = undefined
    onChange = function(argument0) //anon@4432@anon@3920_gml_Object_obj_optionNew_Create_0
    {
        var val = 50
        if use_array
            val = (array_get(variable_global_get(variable), index)) * multiplier
        else
            val = variable_global_get(variable) * multiplier
        val += argument0
        val = clamp(val, 0, 100)
        value = val
        if (val != 0 && val != 100)
        {
            moving = true
            if (!is_undefined(sound))
            {
                if (!event_isplaying(sound))
                    fmod_event_play(sound)
            }
        }
        if use_array
            array_set(variable_global_get(variable), index, (val / multiplier))
        else
            variable_global_set(variable, (val / multiplier))
    }

    doSet = function() //anon@5023@anon@3920_gml_Object_obj_optionNew_Create_0
    {
        self.silence()
        var val = 0.5
        if use_array
            val = array_get(variable_global_get(variable), index)
        else
            val = variable_global_get(variable)
        ini_open_from_string(obj_savesystem.ini_str_options)
        ini_write_real("Option", key, val)
        obj_savesystem.ini_str_options = ini_close()
        moving = false
        if (!is_undefined(onActivate))
            self.onActivate()
    }

    makeSound = function(argument0) //anon@5440@anon@3920_gml_Object_obj_optionNew_Create_0
    {
        if is_undefined(argument0)
            return undefined;
        return fmod_createEventInstance(argument0);
    }

    silence = function() //anon@5565@anon@3920_gml_Object_obj_optionNew_Create_0
    {
        if (!is_undefined(sound))
        {
            if event_isplaying(sound)
                fmod_event_stop(sound, true)
        }
    }

    sound = self.makeSound(argument4)
}

event_user(0)
