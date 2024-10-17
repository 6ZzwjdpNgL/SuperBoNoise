function scr_soundeffect() //scr_soundeffect
{
    if instance_exists(self)
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index))
    else
        show_message("Defunct sound function found Somewhere!")
    return;
}

function scr_soundeffect_3d(argument0, argument1, argument2) //scr_soundeffect_3d
{
    if instance_exists(self)
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index))
    else
        show_message("Defunct sound function found Somewhere!")
    return;
}

function scr_soundeffect_randpitch() //scr_soundeffect_randpitch
{
    if instance_exists(self)
        show_message(string("Defunct sound function in id: {0}, object_index: {1}", id, object_index))
    else
        show_message("Defunct sound function found Somewhere!")
    return;
}

function sfx_gain(argument0) //sfx_gain
{
    audio_sound_gain(argument0, (audio_sound_get_gain(argument0) * global.option_sfx_volume), 0)
    return;
}

