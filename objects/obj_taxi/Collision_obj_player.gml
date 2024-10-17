with (other)
{
    if (input_check("up") && grounded && ((state == (193 << 0) && brick) || state == (2 << 0) || state == (105 << 0) || state == (106 << 0) || state == (60 << 0) || state == (123 << 0) || state == (101 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_fadeout)) && state != (121 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect)
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
        }
    }
}
