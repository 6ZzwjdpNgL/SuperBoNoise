if (room == rm_blank)
    return;
switch state
{
    case (128 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_charge()
        break
    case (132 << 0):
        scr_enemy_turn()
        break
    case (136 << 0):
        scr_enemy_walk()
        if (!instance_exists(coneID))
        {
            coneID = instance_create(x, y, obj_patrolcone)
            coneID.baddieID = id
        }
        if (alarm[5] != -1)
            hsp = 0
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
}

if (state == (140 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (140 << 0))
    birdcreated = 0
if (state == (136 << 0) && y > ystart && (!(scr_solid(x, (y - 1)))))
    y--
if (state == (136 << 0) && y < ystart && (!(scr_solid(x, (y + 1)))))
    y++
if (state == (140 << 0))
    grav = 0.5
else
    grav = 0
if (cooldown > 0)
    cooldown--
if (state == (136 << 0))
{
    if (!patrolfound)
    {
        if (cooldown <= 0 && alarm[5] == -1 && instance_exists(coneID) && coneID.collision)
        {
            patroltimer = patroltimermax
            patrolfound = 1
            alarm[5] = 60
        }
    }
    else if (alarm[5] == -1)
        alarm[5] = 60
}
else if (state == (140 << 0) || state == (6 << 0) || state == (139 << 0))
    alarm[5] = -1
if (state == (136 << 0) && point_in_camera(x, y, view_camera[0]))
{
    var p = 0
    with (obj_player1)
    {
        if (state == (86 << 0) && sprite_index == spr_taunt)
            p = 1
    }
    if p
    {
        patroltimer = 0
        alarm[5] = 1
    }
}
if (state == (82 << 0))
{
    hsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = (136 << 0)
        sprite_index = walkspr
        cooldown = 100
    }
}
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = 0.15 * room_speed
if (state != (6 << 0))
    depth = 0
if (state == (140 << 0) || state == (136 << 0))
    movespeed = 0
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
