event_inherited()
ds_map_set(player_hurtstates, (44 << 0), 30)
ds_map_set(player_hurtstates, (43 << 0), 50)
ds_map_set(player_hurtstates, (106 << 0), 20)
ds_map_set(player_hurtstates, (123 << 0), 30)
ds_map_set(player_hurtstates, (49 << 0), 60)
ds_map_set(boss_hurtstates, (246 << 0), 60)
ds_map_set(boss_hurtstates, (247 << 0), 50)
ds_map_set(boss_hurtstates, (248 << 0), 50)
ds_map_set(boss_hurtstates, (250 << 0), 50)
ds_map_set(boss_hurtstates, (251 << 0), 50)
hitlist = ds_list_create()
image_speed = 0.35
max_hp = 3600
hp = max_hp
shot = 0
phase = 0
has_attacked = 0
floatdir = 1
attackbuffermax = 180
attackbuffer = attackbuffermax
phase1attacks = [(228 << 0), (230 << 0), (229 << 0), (231 << 0)]
lostattacks = array_length(phase1attacks)
parrycount = 0
transitionstate = 0
bombtimer = 0
hasbomb = 0
bombgrabID = -4
knightbuffer = 0
spawnpool = [obj_tack, obj_grape]
hitplayer = 0
function player_hurt(argument0, argument1) //player_hurt@gml_Object_obj_garpobossold_Create_0
{
    var _prevstate = state
    if (phase < 2)
        self.SUPER_player_hurt(argument0, argument1)
    else if ((argument1.state != (86 << 0) || argument1.parry_inst == -4) && argument1.state != (149 << 0) && ds_list_find_index(hitlist, argument1) == -1)
    {
        ds_list_add(hitlist, argument1)
        self.SUPER_player_hurt(argument0, argument1)
        state = _prevstate
        hitplayer = 1
    }
}

function boss_hurt(argument0, argument1) //boss_hurt
{
    if (phase == 0)
        self.SUPER_boss_hurt(argument0, argument1)
    else
    {
        var _removehp = 1
        with (argument1)
        {
            if (state != (45 << 0) && state != (49 << 0))
                scr_pummel()
            else if (state == (49 << 0) && vsp > 0 && y < (other.y - 30))
            {
                sprite_index = spr_knightpep_doublejump
                image_index = 0
                vsp = -11
                movespeed = 6
            }
            else if (state != (45 << 0) && state != (149 << 0))
                _removehp = 0
            if (state == (45 << 0))
                movespeed = 4
        }
        if _removehp
            hp -= argument0
    }
}

function boss_hurt_noplayer(argument0) //boss_hurt_noplayer
{
    if (inv_timer <= 0)
    {
        hp -= argument0
        inv_timer = 10
    }
}

