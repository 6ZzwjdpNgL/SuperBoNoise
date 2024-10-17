function cutscene_title_start() //cutscene_title_start
{
    with (obj_player1)
        state = (148 << 0)
    cutscene_end_action()
    return;
}

function cutscene_title_middle() //cutscene_title_middle
{
    var finish = 0
    with (obj_title)
    {
        collide = 1
        if grounded
            finish = 1
    }
    if finish
        cutscene_end_action()
    return;
}

function cutscene_title_end() //cutscene_title_end
{
    with (obj_player1)
        sprite_index = spr_idle
    if obj_inputController.device_selected[0]
    {
        with (obj_player1)
            state = (2 << 0)
        cutscene_end_action()
    }
    else
    {
        with (obj_inputController)
            press_start = 1
    }
    return;
}

