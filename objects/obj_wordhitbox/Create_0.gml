event_inherited()
dmg = 40
var t = obj_player1
if global.coop
    t = instance_nearest(x, y, obj_player1)
direction = (point_direction(x, y, t.x, t.y)) + (irandom_range(-4, 4))
parryable = 1
parried = 0
function parry() //parry
{
    var prevparried = parried
    self.SUPER_parry()
    if (prevparried != parried)
    {
        direction *= -1
        dmg = 100
        spd = 30
    }
    return;
}

