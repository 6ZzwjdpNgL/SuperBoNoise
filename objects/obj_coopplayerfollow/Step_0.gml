var _temp_local_var_1;
if (room == rank_room)
    visible = false
else
    visible = true
playerid = obj_player1.id
image_speed = 0
var _p1spr = obj_player1.sprite_index
var _spr = obj_player2.spr_idle
var _temp_local_var_1 = _p1spr
if (_p1spr == obj_player1.spr_idle)
    _spr = obj_player2.spr_idle
else if (_p1spr == obj_player1.spr_move)
    _spr = obj_player2.spr_move
else if (_p1spr == obj_player1.spr_crawl)
    _spr = obj_player2.spr_crawl
else if (_p1spr == obj_player1.spr_hurt)
    _spr = obj_player2.spr_hurt
else if (_p1spr == obj_player1.spr_jump)
    _spr = obj_player2.spr_jump
else if (_p1spr == obj_player1.spr_jump2)
    _spr = obj_player2.spr_jump2
else if (_p1spr == obj_player1.spr_fall)
    _spr = obj_player2.spr_fall
else if (_p1spr == obj_player1.spr_fall2)
    _spr = obj_player2.spr_fall2
else if (_p1spr == obj_player1.spr_crouch)
    _spr = obj_player2.spr_crouch
else if (_p1spr == obj_player1.spr_crouchjump)
    _spr = obj_player2.spr_crouchjump
else if (_p1spr == obj_player1.spr_crouchfall)
    _spr = obj_player2.spr_crouchfall
else if (_p1spr == obj_player1.spr_bump)
    _spr = obj_player2.spr_bump
else if (_p1spr == obj_player1.spr_land)
    _spr = obj_player2.spr_land
else if (_p1spr == obj_player1.spr_lookdoor)
    _spr = obj_player2.spr_lookdoor
else if (_p1spr == obj_player1.spr_walkfront)
    _spr = obj_player2.spr_walkfront
else if (_p1spr == obj_player1.spr_Ladder)
    _spr = obj_player2.spr_Ladder
else if (_p1spr == obj_player1.spr_laddermove)
    _spr = obj_player2.spr_laddermove
else if (_p1spr == obj_player1.spr_mach)
    _spr = obj_player2.spr_mach
else if (_p1spr == obj_player1.spr_mach1)
    _spr = obj_player2.spr_mach1
else if (_p1spr == obj_player1.spr_secondjump1)
    _spr = obj_player2.spr_secondjump1
else if (_p1spr == obj_player1.spr_secondjump2)
    _spr = obj_player2.spr_secondjump2
else if (_p1spr == obj_player1.spr_machslide)
    _spr = obj_player2.spr_machslide
else if (_p1spr == obj_player1.spr_machslidestart)
    _spr = obj_player2.spr_machslidestart
else if (_p1spr == obj_player1.spr_machslideend)
    _spr = obj_player2.spr_machslideend
else if (_p1spr == obj_player1.spr_machslideboost)
    _spr = obj_player2.spr_machslideboost
else if (_p1spr == obj_player1.spr_idle1)
    _spr = obj_player2.spr_idle1
else if (_p1spr == obj_player1.spr_idle2)
    _spr = obj_player2.spr_idle2
else if (_p1spr == obj_player1.spr_idle3)
    _spr = obj_player2.spr_idle3
else if (_p1spr == obj_player1.spr_idle4)
    _spr = obj_player2.spr_idle4
else if (_p1spr == obj_player1.spr_idle5)
    _spr = obj_player2.spr_idle5
else if (_p1spr == obj_player1.spr_idle6)
    _spr = obj_player2.spr_idle6
else if (_p1spr == obj_player1.spr_land2)
    _spr = obj_player2.spr_land2
else if (_p1spr == obj_player1.spr_punch)
    _spr = obj_player2.spr_punch
else if (_p1spr == obj_player1.spr_backkick)
    _spr = obj_player2.spr_backkick
else if (_p1spr == obj_player1.spr_shoulder)
    _spr = obj_player2.spr_shoulder
else if (_p1spr == obj_player1.spr_uppunch)
    _spr = obj_player2.spr_uppunch
else if (_p1spr == obj_player1.spr_stomp)
    _spr = obj_player2.spr_stomp
else if (_p1spr == obj_player1.spr_stompprep)
    _spr = obj_player2.spr_stompprep
else if (_p1spr == obj_player1.spr_crouchslide)
    _spr = obj_player2.spr_crouchslide
else if (_p1spr == obj_player1.spr_victory)
    _spr = obj_player2.spr_victory
else if (_p1spr == obj_player1.spr_climbwall)
    _spr = obj_player2.spr_climbwall
else if (_p1spr == obj_player1.spr_grab)
    _spr = obj_player2.spr_grab
else if (_p1spr == obj_player1.spr_mach2jump)
    _spr = obj_player2.spr_mach2jump
else if (_p1spr == obj_player1.spr_Timesup)
    _spr = obj_player2.spr_Timesup
else if (_p1spr == obj_player1.spr_deathstart)
    _spr = obj_player2.spr_deathstart
else if (_p1spr == obj_player1.spr_deathend)
    _spr = obj_player2.spr_deathend
else if (_p1spr == obj_player1.spr_machpunch1)
    _spr = obj_player2.spr_machpunch1
else if (_p1spr == obj_player1.spr_machpunch2)
    _spr = obj_player2.spr_machpunch2
else if (_p1spr == obj_player1.spr_hurtjump)
    _spr = obj_player2.spr_hurtjump
else if (_p1spr == obj_player1.spr_entergate)
    _spr = obj_player2.spr_entergate
else if (_p1spr == obj_player1.spr_gottreasure)
    _spr = obj_player2.spr_gottreasure
else if (_p1spr == obj_player1.spr_bossintro)
    _spr = obj_player2.spr_bossintro
else if (_p1spr == obj_player1.spr_hurtidle)
    _spr = obj_player2.spr_hurtidle
else if (_p1spr == obj_player1.spr_hurtwalk)
    _spr = obj_player2.spr_hurtwalk
else if (_p1spr == obj_player1.spr_suplexmash1)
    _spr = obj_player2.spr_suplexmash1
else if (_p1spr == obj_player1.spr_suplexmash2)
    _spr = obj_player2.spr_suplexmash2
else if (_p1spr == obj_player1.spr_suplexmash3)
    _spr = obj_player2.spr_suplexmash3
else if (_p1spr == obj_player1.spr_suplexmash4)
    _spr = obj_player2.spr_suplexmash4
else if (_p1spr == obj_player1.spr_tackle)
    _spr = obj_player2.spr_tackle
else if (_p1spr == obj_player1.spr_airdash1)
    _spr = obj_player2.spr_airdash1
else if (_p1spr == obj_player1.spr_airdash2)
    _spr = obj_player2.spr_airdash2
else if (_p1spr == obj_player1.spr_piledriver)
    _spr = obj_player2.spr_piledriver
else if (_p1spr == obj_player1.spr_piledriverland)
    _spr = obj_player2.spr_piledriverland
else if (_p1spr == obj_player1.spr_charge)
    _spr = obj_player2.spr_charge
else if (_p1spr == obj_player1.spr_mach3jump)
    _spr = obj_player2.spr_mach3jump
else if (_p1spr == obj_player1.spr_mach4)
    _spr = obj_player2.spr_mach4
else if (_p1spr == obj_player1.spr_machclimbwall)
    _spr = obj_player2.spr_machclimbwall
else if (_p1spr == obj_player1.spr_dive)
    _spr = obj_player2.spr_dive
else if (_p1spr == obj_player1.spr_machroll)
    _spr = obj_player2.spr_machroll
else if (_p1spr == obj_player1.spr_hitwall)
    _spr = obj_player2.spr_hitwall
else if (_p1spr == obj_player1.spr_superjumpland)
    _spr = obj_player2.spr_superjumpland
else if (_p1spr == obj_player1.spr_walljumpstart)
    _spr = obj_player2.spr_walljumpstart
else if (_p1spr == obj_player1.spr_superjumpprep)
    _spr = obj_player2.spr_superjumpprep
else if (_p1spr == obj_player1.spr_superjump)
    _spr = obj_player2.spr_superjump
else if (_p1spr == obj_player1.spr_superjumppreplight)
    _spr = obj_player2.spr_superjumppreplight
else if (_p1spr == obj_player1.spr_superjumpright)
    _spr = obj_player2.spr_superjumpright
else if (_p1spr == obj_player1.spr_superjumpleft)
    _spr = obj_player2.spr_superjumpleft
else if (_p1spr == obj_player1.spr_machfreefall)
    _spr = obj_player2.spr_machfreefall
else if (_p1spr == obj_player1.spr_mach3hit)
    _spr = obj_player2.spr_mach3hit
else if (_p1spr == obj_player1.spr_knightpepwalk)
    _spr = obj_player2.spr_knightpepwalk
else if (_p1spr == obj_player1.spr_knightpepjump)
    _spr = obj_player2.spr_knightpepjump
else if (_p1spr == obj_player1.spr_knightpepfall)
    _spr = obj_player2.spr_knightpepfall
else if (_p1spr == obj_player1.spr_knightpepidle)
    _spr = obj_player2.spr_knightpepidle
else if (_p1spr == obj_player1.spr_knightpepjumpstart)
    _spr = obj_player2.spr_knightpepjumpstart
else if (_p1spr == obj_player1.spr_knightpepthunder)
    _spr = obj_player2.spr_knightpepthunder
else if (_p1spr == obj_player1.spr_knightpepland)
    _spr = obj_player2.spr_knightpepland
else if (_p1spr == obj_player1.spr_knightpepdownslope)
    _spr = obj_player2.spr_knightpepdownslope
else if (_p1spr == obj_player1.spr_knightpepstart)
    _spr = obj_player2.spr_knightpepstart
else if (_p1spr == obj_player1.spr_knightpepcharge)
    _spr = obj_player2.spr_knightpepcharge
else if (_p1spr == obj_player1.spr_bodyslamstart)
    _spr = obj_player2.spr_bodyslamstart
else if (_p1spr == obj_player1.spr_bodyslamfall)
    _spr = obj_player2.spr_bodyslamfall
else if (_p1spr == obj_player1.spr_bodyslamland)
    _spr = obj_player2.spr_bodyslamland
else if (_p1spr == obj_player1.spr_crazyrun)
    _spr = obj_player2.spr_crazyrun
else if (_p1spr == obj_player1.spr_bombpeprun)
    _spr = obj_player2.spr_bombpeprun
else if (_p1spr == obj_player1.spr_bombpepintro)
    _spr = obj_player2.spr_bombpepintro
else if (_p1spr == obj_player1.spr_bombpeprunabouttoexplode)
    _spr = obj_player2.spr_bombpeprunabouttoexplode
else if (_p1spr == obj_player1.spr_bombpepend)
    _spr = obj_player2.spr_bombpepend
else if (_p1spr == obj_player1.spr_fireass)
    _spr = obj_player2.spr_fireass
else if (_p1spr == obj_player1.spr_fireassground)
    _spr = obj_player2.spr_fireassground
else if (_p1spr == obj_player1.spr_fireassend)
    _spr = obj_player2.spr_fireassend
else if (_p1spr == obj_player1.spr_tumblestart)
    _spr = obj_player2.spr_tumblestart
else if (_p1spr == obj_player1.spr_tumbleend)
    _spr = obj_player2.spr_tumbleend
else if (_p1spr == obj_player1.spr_tumble)
    _spr = obj_player2.spr_tumble
else if (_p1spr == obj_player1.spr_stunned)
    _spr = obj_player2.spr_stunned
else if (_p1spr == obj_player1.spr_downpizzabox)
    _spr = obj_player2.spr_downpizzabox
else if (_p1spr == obj_player1.spr_uppizzabox)
    _spr = obj_player2.spr_uppizzabox
else if (_p1spr == obj_player1.spr_slipnslide)
    _spr = obj_player2.spr_slipnslide
else if (_p1spr == obj_player1.spr_mach3boost)
    _spr = obj_player2.spr_mach3boost
else if (_p1spr == obj_player1.spr_facehurtup)
    _spr = obj_player2.spr_facehurtup
else if (_p1spr == obj_player1.spr_facehurt)
    _spr = obj_player2.spr_facehurt
else if (_p1spr == obj_player1.spr_walljumpend)
    _spr = obj_player2.spr_walljumpend
else if (_p1spr == obj_player1.spr_suplexdash)
    _spr = obj_player2.spr_suplexdash
else if (_p1spr == obj_player1.spr_suplexdashjumpstart)
    _spr = obj_player2.spr_suplexdashjumpstart
else if (_p1spr == obj_player1.spr_suplexdashjump)
    _spr = obj_player2.spr_suplexdashjump
else if (_p1spr == obj_player1.spr_shotgunsuplexdash)
    _spr = obj_player2.spr_shotgunsuplexdash
else if (_p1spr == obj_player1.spr_rollgetup)
    _spr = obj_player2.spr_rollgetup
else if (_p1spr == obj_player1.spr_swingding)
    _spr = obj_player2.spr_swingding
else if (_p1spr == obj_player1.spr_swingdingend)
    _spr = obj_player2.spr_swingdingend
else if (_p1spr == obj_player1.spr_haulingjump)
    _spr = obj_player2.spr_jump
else if (_p1spr == obj_player1.spr_haulingidle)
    _spr = obj_player2.spr_idle
else if (_p1spr == obj_player1.spr_haulingwalk)
    _spr = obj_player2.spr_move
else if (_p1spr == obj_player1.spr_haulingfall)
    _spr = obj_player2.spr_fall
else if (_p1spr == obj_player1.spr_haulingland)
    _spr = obj_player2.spr_land
else if (_p1spr == obj_player1.spr_winding)
    _spr = obj_player2.spr_winding
else if (_p1spr == obj_player1.spr_3hpwalk)
    _spr = obj_player2.spr_3hpwalk
else if (_p1spr == obj_player1.spr_3hpidle)
    _spr = obj_player2.spr_3hpidle
else if (_p1spr == obj_player1.spr_panic)
    _spr = obj_player2.spr_panic
else if (_p1spr == obj_player1.spr_facestomp)
    _spr = obj_player2.spr_facestomp
else if (_p1spr == obj_player1.spr_freefall)
    _spr = obj_player2.spr_freefall
else if (_p1spr == obj_player1.spr_shotgunland)
    _spr = obj_player2.spr_shotgunland
else if (_p1spr == obj_player1.spr_shotgunshoot)
    _spr = obj_player2.spr_shotgunshoot
else if (_p1spr == obj_player1.spr_shotgunidle)
    _spr = obj_player2.spr_shotgunidle
else if (_p1spr == obj_player1.spr_shotgunwalk)
    _spr = obj_player2.spr_shotgunwalk
else if (_p1spr == obj_player1.spr_shotgunfall)
    _spr = obj_player2.spr_shotgunfall
else if (_p1spr == obj_player1.spr_shotgunjump)
    _spr = obj_player2.spr_shotgunjump
else if (_p1spr == obj_player1.spr_shotgunjump1)
    _spr = obj_player2.spr_shotgunjump1
else if (_p1spr == obj_player1.spr_shotgunjump2)
    _spr = obj_player2.spr_shotgunjump2
else if (_p1spr == obj_player1.spr_shotgunjump3)
    _spr = obj_player2.spr_shotgunjump3
else if (_p1spr == obj_player1.spr_shotgunpullout)
    _spr = obj_player2.spr_shotgunpullout
else if (_p1spr == obj_player1.spr_shotgunduck)
    _spr = obj_player2.spr_shotgunduck
else if (_p1spr == obj_player1.spr_shotguncrawl)
    _spr = obj_player2.spr_shotguncrawl
else if (_p1spr == obj_player1.spr_shotgungoduck)
    _spr = obj_player2.spr_shotgungoduck
else if (_p1spr == obj_player1.spr_fightball)
    _spr = obj_player2.spr_fightball
else if (_p1spr == obj_player1.spr_squished)
    _spr = obj_player2.spr_squished
else if (_p1spr == obj_player1.spr_supertaunt1)
    _spr = obj_player2.spr_supertaunt1
else if (_p1spr == obj_player1.spr_supertaunt2)
    _spr = obj_player2.spr_supertaunt2
else if (_p1spr == obj_player1.spr_supertaunt3)
    _spr = obj_player2.spr_supertaunt3
else if (_p1spr == obj_player1.spr_supertaunt4)
    _spr = obj_player2.spr_supertaunt4
else if (_p1spr == obj_player1.spr_taunt)
    _spr = obj_player2.spr_taunt
else if (_p1spr == obj_player1.spr_rideweenie)
    _spr = obj_player2.spr_rideweenie
ds_queue_enqueue(spritequeue, [_spr, obj_player1.image_index])
