function cutscene_forest_end() //cutscene_forest_end
{
    with (obj_player1)
    {
        state = (2 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.forestcutscene = 1
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "forest", 1)
    cutscene_end_action()
    return;
}

function cutscene_beach_end() //cutscene_beach_end
{
    with (obj_player1)
    {
        state = (2 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.beachcutscene = 1
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "beach", 1)
    cutscene_end_action()
    return;
}

function cutscene_sewer_end() //cutscene_sewer_end
{
    with (obj_player1)
    {
        state = (2 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.sewercutscene = 1
    global.levelcompletename = -4
    quick_ini_write_real(get_savefile_ini(), "cutscene", "sewer", 1)
    cutscene_end_action()
    return;
}

