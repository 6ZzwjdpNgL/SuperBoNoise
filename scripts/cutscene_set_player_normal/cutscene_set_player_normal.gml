function cutscene_set_player_normal() //cutscene_set_player_normal
{
    with (obj_player1)
    {
        if check_player_coop()
            state = (2 << 0)
    }
    cutscene_end_action()
    return;
}

