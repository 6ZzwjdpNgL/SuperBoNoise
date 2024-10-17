function cutscene_set_player_actor() //cutscene_set_player_actor
{
    with (obj_player1)
    {
        if check_player_coop()
        {
            state = (148 << 0)
            image_speed = 0.35
        }
    }
    cutscene_end_action()
    return;
}

