if (room == rm_blank)
    return;
switch state
{
    case (128 << 0):
        scr_enemy_idle()
        break
    case (132 << 0):
        scr_enemy_turn()
        break
    case (136 << 0):
        if (!idle)
            scr_enemy_walk()
        else
        {
            sprite_index = idlespr
            hsp = 0
        }
        break
    case (138 << 0):
        scr_enemy_land()
        break
    case (139 << 0):
        scr_enemy_hit()
        break
    case (140 << 0):
        scr_enemy_stun()
        break
    case (131 << 0):
        scr_pizzagoblin_throw()
        break
    case (6 << 0):
        scr_enemy_grabbed()
        break
    case (156 << 0):
        scr_enemy_pummel()
        break
    case (157 << 0):
        scr_enemy_staggered()
        break
    case (127 << 0):
        scr_enemy_rage()
        break
    case (19 << 0):
        scr_enemy_ghostpossess()
        break
}

scr_scareenemy()
if (state != (136 << 0))
    idle = 0
if (state == (136 << 0))
{
    var x1 = 270
    playerid = instance_nearest(x, y, obj_player1)
    var t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100))
    if (cooldown > 0)
        cooldown--
    else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
    {
        var b = id
        with (obj_farmerbaddie)
        {
            if ((id == b || distance_to_object(other) < 300) && state != (6 << 0) && state != (140 << 0) && state != (139 << 0) && state != (268 << 0))
            {
                state = (94 << 0)
                sprite_index = ragespr
                vsp = -5
                hsp = 0
                if (other.playerid.x != x)
                    image_xscale = sign(other.playerid.x - x)
                if (id != b)
                    leaderID = b
                else
                    leaderID = noone
            }
        }
    }
}
else if (state == (94 << 0))
{
    if (grounded && vsp > 0)
    {
        state = (82 << 0)
        sprite_index = ragespr
        attackspeed = 8
    }
}
else if (state == (82 << 0))
{
    if (object_index != obj_farmerbaddie3 && (!instance_exists(hitboxID)))
    {
        with (instance_create(x, y, obj_tackhitbox))
        {
            ID = other.id
            other.hitboxID = id
        }
    }
    x1 = 450
    playerid = instance_nearest(x, y, obj_player1)
    t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400))
    hsp = image_xscale * attackspeed
    var q = outofsight
    if (leaderID == noone)
    {
        if ((!t) || collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
            outofsight = 1
        if t
            outofsight = 0
    }
    else if (instance_exists(leaderID) && leaderID.state == (82 << 0))
        outofsight = leaderID.outofsight
    else
        leaderID = noone
    if outofsight
    {
        if (q != outofsight)
            waitbuffer = 30
        if (waitbuffer > 0)
            waitbuffer--
        else
            attackspeed = approach(attackspeed, 0, 0.1)
    }
    else
        attackspeed = approach(attackspeed, attackmaxspeed, 1)
    if (attackspeed <= 0)
    {
        cooldown = 60
        state = (136 << 0)
        idle = 0
        hsp = 0
        sprite_index = walkspr
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
        image_xscale *= -1
}
if (state != (82 << 0) && hitboxID != noone && instance_exists(hitboxID))
{
    instance_destroy(hitboxID)
    hitboxID = -4
}
if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state != (140 << 0))
    thrown = false
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
