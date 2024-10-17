if (vsp > 0)
{
    instance_destroy()
    instance_destroy(obj_pizzaballblock)
    obj_player1.state = (86 << 0)
    if (obj_player1.character == "P")
        obj_player1.sprite_index = spr_null
    else
        obj_player1.sprite_index = spr_playerN_victory
    obj_player1.image_index = 0
}
