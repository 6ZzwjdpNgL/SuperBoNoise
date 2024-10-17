if ((!instance_exists(ID)) && obj_player1.state != (15 << 0) && obj_player1.state != (13 << 0) && obj_player1.state != (14 << 0) && obj_player1.state != (16 << 0) && place_meeting(x, y, obj_player1))
{
    instance_destroy(obj_mort)
    with (instance_create(x, (y - 50), obj_mort))
        other.ID = id
}
