event_inherited()
state = (147 << 0)
ds_map_set(player_hurtstates, (44 << 0), 30)
ds_map_set(player_hurtstates, (43 << 0), 50)
ds_map_set(player_hurtstates, (106 << 0), 20)
ds_map_set(player_hurtstates, (123 << 0), 30)
ds_map_set(player_hurtstates, (110 << 0), 20)
ds_map_set(player_hurtstates, (82 << 0), 20)
ds_map_set(player_hurtstates, (7 << 0), 20)
ds_map_set(player_hurtstates, (99 << 0), 20)
ds_map_set(boss_hurtstates, (85 << 0), 60)
ds_map_set(boss_hurtstates, (155 << 0), 60)
ds_map_set(boss_hurtstates, (159 << 0), 90)
ds_map_set(boss_hurtstates, (78 << 0), 200)
ds_map_set(boss_hurtstates, (82 << 0), 30)
ds_map_set(boss_hurtstates, (110 << 0), 70)
stunfallspr = spr_pepperman_hurtplayer
walkspr = spr_pepperman_move
idlespr = spr_pepperman_idle
spr_dead = spr_pepperman_timesup
tauntspr = spr_pepperman_taunt
fallspr = spr_pepperman_fall
defeatplayerspr = spr_pepperman_shoulderstart
normal_spd = 6
shoulder_spd = 12
attack_max[0] = 120
attack_max[1] = 80
attack_max[2] = 0
attack_max[3] = 0
attack_max[4] = 0
attack_max[5] = 0
attack_cooldown = attack_max[0]
targetstunned = 0
targetstunnedminus[0] = 40
targetstunnedminus[1] = 40
targetstunnedminus[2] = 40
targetstunnedminus[3] = 40
targetstunnedminus[4] = 40
targetstunnedminus[5] = 40
targetxscale = 1
phase = 1
max_phase = 6
max_hp = 500 * max_phase
hp = max_hp
xscale = 1
jumping_pepper = 0
shoulderbash_fakeout = 0
groundpound_fakeout = 0
groundpound_readjust = 3
groundpound_readjust_max = 16
groundpound_readjust_buffer = groundpound_readjust_max
readjusting = 0
superjumping_pepper = 0
shoulderturns = 3
target_x = 0
shoulderpound_fakeout = 0
shoulderpound_buffer = 0
shoulderpound_max = 60
chooseparry_max[0] = 600
chooseparry_max[1] = 480
chooseparry_max[2] = 300
chooseparry_max[3] = 300
chooseparry_max[4] = 300
chooseparry_max[5] = 300
chooseparry_random = 4
chooseparry_buffer = chooseparry_max[(phase - 1)]
taunt_buffer = 0
taunt_max = 25
fistmatch_buffer = 0
fistmatch_max = 360
fist_buffer = 0
fist_max = 20
fist_dmg = 10
fist_dmg_player = 20
superattack_hpthreshold = 500
superattack_buffer = 0
superattack_max = 360
function player_destroy(argument0) //player_destroy
{
    self.SUPER_player_destroy(argument0)
    return;
}

function boss_destroy(argument0) //boss_destroy
{
    hitstate = (2 << 0)
    self.SUPER_boss_destroy(argument0)
    with (obj_peppermanbrick)
        instance_destroy()
    global.peppermancutscene2 = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "pepperman2", 1)
    targetstunned = 1000
    stunned = 1000
    return;
}

function boss_hurt(argument0, argument1) //boss_hurt
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    self.SUPER_boss_hurt(argument0, argument1)
    targetxscale = (-argument1.xscale)
    return;
}

function boss_hurt_noplayer(argument0) //boss_hurt_noplayer
{
    if (targetstunned > 0)
    {
        targetstunned -= targetstunnedminus[(phase - 1)]
        attack_cooldown = 0
        if (targetstunned < 0)
            targetstunned = 1
    }
    else
        targetstunned = 150
    self.SUPER_boss_hurt_noplayer(argument0)
    return;
}

function player_hurt(argument0, argument1) //player_hurt
{
    if (argument1.state != (86 << 0) || argument1.parry_inst == -4)
    {
        var _prevstate = state
        self.SUPER_player_hurt(argument0, argument1)
        if (_prevstate == (155 << 0) || _prevstate == (159 << 0) || _prevstate == (85 << 0) || _prevstate == (78 << 0))
        {
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
            hitstate = (140 << 0)
            stunned = 70
            hitvsp = -4
            hithsp = (-image_xscale) * 8
        }
        else if (_prevstate == (86 << 0))
        {
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
            sprite_index = spr_pepperman_throw
            image_index = 0
            hitstate = (149 << 0)
            hitvsp = 0
            hithsp = 0
            movespeed = 8
        }
        else
        {
            hithsp = 0
            hitvsp = -4
            hitstate = (2 << 0)
        }
    }
    else if (state == (78 << 0))
    {
        with (argument1)
        {
            if (state == (139 << 0) || state == (63 << 0))
            {
                x = hitX
                y = hitY
            }
            if (other.state == (139 << 0) || other.state == (63 << 0))
            {
                other.x = hitX
                other.y = hitY
            }
            sprite_index = spr_idle
            state = (164 << 0)
            hitX = x
            hitY = y
            hsp = 0
            vsp = 0
            movespeed = 0
            other.sprite_index = other.idlespr
            other.state = (164 << 0)
            other.image_xscale = (-xscale)
            other.hitX = x + xscale * 16
            other.hitY = y
            other.hsp = 0
            other.vsp = 0
            other.fistmatch_buffer = other.fistmatch_max
            camera_zoom(0.6, 0.1)
        }
    }
    return;
}

