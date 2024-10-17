function cutscene_ruin_end() //cutscene_ruin_end
{
    with (obj_player1)
    {
        state = (2 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.ruincutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "ruin", 1)
    cutscene_end_action()
}

