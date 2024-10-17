if (playerid.visible == false)
{
    global.hp = 8
    global.failcutscene = 0
    with (obj_player1)
    {
        state = (2 << 0)
        instance_create(x, y, obj_genericpoofeffect)
        cutscene = 0
    }
    if (global.coop == true)
    {
        with (obj_player2)
        {
            state = (2 << 0)
            cutscene = 0
        }
    }
    obj_player1.visible = true
    obj_player2.visible = true
}
