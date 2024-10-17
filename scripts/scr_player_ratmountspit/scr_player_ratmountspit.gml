function state_player_ratmountspit() //state_player_ratmountspit
{
    image_speed = 0.6
    hsp = 0
    vsp = 0
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    if (floor(image_index) == (image_number - 1))
    {
        state = (193 << 0)
        ratgrabbedID = -4
    }
    return;
}

