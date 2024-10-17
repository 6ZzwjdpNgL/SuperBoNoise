// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
musicArr = []
position = 0
pos_playing = 0
active = false
bubbleindex = 0
function playlistEntry(argument0, argument1) constructor //playlistEntry@gml_Object_obj_soundtest_Create_0
{
    path = argument0
    desc = argument1
    event = undefined
    is_paused = true
    playing = false
    pause = function() //anon@247@playlistEntry_gml_Object_obj_soundtest_Create_0
    {
        if is_undefined(event)
            return;
        is_paused = (!is_paused)
        if (!is_paused)
            playing = true
        fmod_event_setPause(event, is_paused)
    }

    play = function() //anon@432@playlistEntry_gml_Object_obj_soundtest_Create_0
    {
        if is_undefined(event)
            return;
        playing = true
        if is_paused
        {
            fmod_event_setPause(event, false)
            is_paused = false
        }
        fmod_event_play(event)
    }

    stop = function(argument0) //anon@637@playlistEntry_gml_Object_obj_soundtest_Create_0
    {
        if (argument0 == undefined)
            argument0 = false
        if is_undefined(event)
            return;
        playing = false
        fmod_event_stop(event, argument0)
    }

    release = function() //anon@782@playlistEntry_gml_Object_obj_soundtest_Create_0
    {
        if is_undefined(event)
            return;
        fmod_event_release(event)
    }

}

addSong = function(argument0, argument1) //anon@971@gml_Object_obj_soundtest_Create_0
{
    if (argument1 == undefined)
        argument1 = "default description"
    var s = new playlistEntry(argument0, argument1)
    s.event = fmod_createEventInstance(argument0)
    array_push(musicArr, s)
}

event_user(0)
pos_last = array_length(musicArr) - 1
