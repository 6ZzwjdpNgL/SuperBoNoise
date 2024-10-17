if (targetplayer.id != other.id)
    return;
obj_player1.visible = false
obj_player1.sprite_index = obj_player1.spr_idle
obj_player1.hsp = 0
obj_player1.vsp = 0
obj_player1.state = (121 << 0)
playerid = obj_player1
sprite_index = spr_null
hsp = 10
obj_player1.cutscene = 1
if (global.coop == true)
{
    obj_player2.sprite_index = obj_player2.spr_idle
    playerid = obj_player2
    sprite_index = spr_null
    hsp = 10
    obj_player2.visible = false
    obj_player2.hsp = 0
    obj_player2.vsp = 0
    obj_player2.state = (121 << 0)
    obj_player2.cutscene = 1
}
if (pickedup == 0)
    instance_create(x, y, obj_genericpoofeffect)
pickedup = 1
