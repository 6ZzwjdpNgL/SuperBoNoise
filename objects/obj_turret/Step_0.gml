targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
switch state
{
    case (2 << 0):
        state_turret_normal()
        break
    case (130 << 0):
        state_turret_charge()
        break
}

if (invtime > 0)
    invtime--
if (hp <= 0)
    instance_destroy()
