event_inherited()
dmg = 30
spd = 25
parryable = 1
function player_hurt(argument0, argument1) //player_hurt@gml_Object_obj_revolvershot_Create_0
{
    if (!collisioned)
    {
        var prevstate = argument1.state
        self.SUPER_player_hurt(argument0, argument1)
        argument1.xscale = (-image_xscale)
        argument1.hitxscale = (-image_xscale)
        if (prevstate == (162 << 0))
        {
            argument1.hithsp = 0
            argument1.hitvsp = 0
            argument1.hitstate = (162 << 0)
            with (obj_vigilanteboss)
                duel_buffer = duel_max + irandom(duel_random)
        }
    }
    return;
}

function parry() //parry@gml_Object_obj_revolvershot_Create_0
{
    var prevparried = parried
    self.SUPER_parry()
    if (prevparried != parried)
    {
        image_xscale *= -1
        dmg = 100
        spd = 30
    }
    return;
}

