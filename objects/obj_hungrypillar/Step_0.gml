if (room == rm_blank)
    return;
var targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
var scare_check = (targetplayer.state == (43 << 0) || targetplayer.state == (123 << 0) || targetplayer.state == (33 << 0) || targetplayer.state == (186 << 0) || targetplayer.state == (22 << 0) || targetplayer.state == (40 << 0) || (targetplayer.state == (81 << 0) && targetplayer.swingdingdash <= 0 && targetplayer.sprite_index == targetplayer.spr_swingding))
if (!(sprite_index == spr_hungrypillar_fightback))
{
    sprite_index = spr_hungrypillar
    if (collision_rectangle((x - 400), (y - 60), (x + 400), (y + 60), targetplayer, false, false) && (targetplayer.x - x) == (-sign(image_xscale)) && scare_check)
        sprite_index = spr_hungrypillar_angry
}
