function cutscene_set_player_visible(argument0) //cutscene_set_player_visible
{
    with (obj_player1)
        visible = argument0
    cutscene_end_action()
    return;
}

