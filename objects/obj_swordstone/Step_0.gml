if (room == rm_blank)
    return;
if (obj_player1.state == (49 << 0) || (obj_player1.state == (63 << 0) && (obj_player1.tauntstoredstate == (49 << 0) || obj_player1.tauntstoredstate == (40 << 0))) || obj_player1.state == (50 << 0) || obj_player1.state == (40 << 0) || obj_player1.state == (51 << 0))
    sprite_index = spr_swordstonetaken
else
    sprite_index = spr_swordstone
if (sprite_index == spr_swordstone && (!instance_exists(ID)))
{
    with (instance_create(x, (y - 20), obj_grabmarker))
        other.ID = id
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
    instance_destroy(ID)
