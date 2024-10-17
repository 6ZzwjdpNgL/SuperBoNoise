mach3destroy = 0
platformid = -4
hsp_carry = 0
vsp_carry = 0
thrown = false
depth = obj_drawcontroller.depth + 1
hsp = 0
vsp = 0
grav = 0.5
grounded = false
movespeed = 0
state = (2 << 0)
team = 1
important = 1
mach3destroy = 0
jugglecount = 0
max_hp = 400
hp = 0
invincible = 0
inv_timer = -1
inv_max = 25
player_hurtstates = ds_map_create()
boss_hurtstates = ds_map_create()
boss_unparryablestates = ds_map_create()
destroyable = 0
stuntouchbuffer = 0
lungehurt = 1
hitLag = 0
hitX = x
hitY = y
hithsp = 0
hitvsp = 0
hitstate = (2 << 0)
stunfallspr = sprite_index
walkspr = sprite_index
spr_dead = sprite_index
fallspr = sprite_index
bumpspr = sprite_index
parryspr = sprite_index
defeatplayerspr = sprite_index
lastplayerid = obj_player1.id
attacking = 0
destroyed = 0
playerdestroyed = 0
colliding = 1
function SUPER_player_destroy(argument0) //SUPER_player_destroy
{
    depth = argument0.depth
    playerdestroyed = 1
    with (argument0)
    {
        camera_zoom(1, 0.1)
        var lag = room_speed * 3
        other.hitLag = lag
        other.hitX = room_width / 2
        other.hitY = room_height / 2
        other.x = other.hitX
        other.y = other.hitY
        other.state = (63 << 0)
        other.hitstate = (147 << 0)
        other.hitvsp = -4
        other.hithsp = (-other.image_xscale) * 8
        hitLag = lag
        hitX = room_width / 2 + other.image_xscale * 16
        hitY = room_height / 2 - 5
        x = hitX
        y = hitY
        xscale = (-other.image_xscale)
        hitxscale = (-other.image_xscale)
        sprite_index = spr_player_outofpizza1
        hithsp = 15
        hitstunned = 10000
        hitvsp = -8
        state = (139 << 0)
        instance_create(other.x, other.y, obj_parryeffect)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    return;
}

function SUPER_boss_destroy(argument0) //SUPER_boss_destroy
{
    destroyed = 1
    depth = argument0.depth
    global.attackstyle = 0
    global.savedattackstyle = 0
    with (argument0)
    {
        camera_zoom(1, 0.1)
        if (state == (164 << 0) || state == (162 << 0) || state == (149 << 0) || state == (86 << 0))
        {
            sprite_index = spr_null
            image_index = 6
            state = (44 << 0)
        }
        if (state != (63 << 0))
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
        }
        lag = room_speed * 3
        other.image_xscale = (-xscale)
        other.hitLag = lag
        other.hitX = room_width / 2 + xscale * 16
        other.hitY = room_height / 2 - 5
        other.x = other.hitX
        other.y = other.hitY
        other.hitvsp = -8
        other.hithsp = (-other.image_xscale) * 15
        other.state = (139 << 0)
        other.thrown = true
        other.destroyable = 1
        other.colliding = 1
        other.grounded = false
        hitLag = lag
        hitX = room_width / 2
        hitY = room_height / 2
        x = hitX
        y = hitY
        state = (63 << 0)
        instance_create(other.x, other.y, obj_parryeffect)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    return;
}

function SUPER_boss_hurt(argument0, argument1) //SUPER_boss_hurt
{
    if important
        hp -= argument0
    if (argument1.state != (254 << 0))
    {
        with (obj_bosscontroller)
            super += 30
    }
    with (argument1)
    {
        var atstate = state
        if (state == (44 << 0))
        {
            state = (8 << 0)
            sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
            image_index = 6
        }
        if (state != (63 << 0))
        {
            tauntstoredmovespeed = movespeed
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
        }
        state = (63 << 0)
        lag = 8
        hitLag = lag
        hitX = x
        hitY = y
        if (state == (63 << 0) || state == (139 << 0))
        {
            x = hitX
            y = hitY
        }
        if (other.state == (139 << 0) || other.state == (63 << 0))
        {
            other.x = other.hitX
            other.y = other.hitY
        }
        other.image_xscale = (-xscale)
        other.hitLag = lag
        other.hitX = other.x
        other.hitY = other.y
        other.jugglecount++
        other.hitvsp = -9
        other.movespeed = 7 + other.jugglecount * 2
        if (atstate == (149 << 0))
        {
            other.hitvsp = -14
            other.movespeed = 0
        }
        other.hithsp = (-other.image_xscale) * other.movespeed
        other.state = (139 << 0)
        instance_create(other.x, other.y, obj_parryeffect)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    return;
}

function SUPER_boss_hurt_noplayer(argument0) //SUPER_boss_hurt_noplayer
{
    if important
        hp -= argument0
    if (obj_player1.state != (254 << 0))
    {
        with (obj_bosscontroller)
            super += 30
    }
    lag = 8
    if (state == (139 << 0) || state == (63 << 0))
    {
        x = hitX
        y = hitY
    }
    image_xscale = (-other.image_xscale)
    hitLag = lag
    hitX = x
    hitY = y
    hitvsp = -8
    hithsp = other.image_xscale * 15
    state = (139 << 0)
    instance_create(x, y, obj_parryeffect)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_slapstar)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    instance_create(x, y, obj_baddiegibs)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = 3 / room_speed
    }
    return;
}

function SUPER_player_hurt(argument0, argument1) //SUPER_player_hurt
{
    if instance_exists(obj_bosscontroller)
        obj_bosscontroller.player_hp -= argument0
    with (obj_bosscontroller)
        super += 80
    with (argument1)
    {
        lag = 8
        if (state == (139 << 0) || state == (63 << 0))
        {
            x = hitX
            y = hitY
        }
        if (other.state == (63 << 0) || other.state == (139 << 0))
        {
            other.x = other.hitX
            other.y = other.hitY
        }
        other.hitLag = lag
        other.hitX = other.x
        other.hitY = other.y
        other.state = (63 << 0)
        hitLag = lag
        hitX = x
        hitY = y
        xscale = (x != other.x ? sign(other.x - x) : (-other.image_xscale))
        hitxscale = (x != other.x ? sign(other.x - x) : (-other.image_xscale))
        sprite_index = spr_hurt
        hithsp = 15
        if (hitstunned > 0)
        {
            hitstunned -= 50
            if (hitstunned <= 0)
                hitstunned = 1
        }
        else
            hitstunned = 100
        hitvsp = -8
        state = (139 << 0)
        instance_create(other.x, other.y, obj_parryeffect)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    return;
}

function player_destroy(argument0) //player_destroy
{
    self.SUPER_player_destroy(argument0)
    return;
}

function boss_destroy(argument0) //boss_destroy
{
    self.SUPER_boss_destroy(argument0)
    return;
}

function player_hurt(argument0, argument1) //player_hurt
{
    self.SUPER_player_hurt(argument0, argument1)
    return;
}

function boss_hurt(argument0, argument1) //boss_hurt
{
    self.SUPER_boss_hurt(argument0, argument1)
    return;
}

function boss_hurt_noplayer(argument0) //boss_hurt_noplayer
{
    self.SUPER_boss_hurt_noplayer(argument0)
    return;
}

