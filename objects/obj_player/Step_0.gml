if (object_index == obj_player2 && state == (20 << 0))
    return;
prevhsp = hsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevxscale = xscale
if (grounded && vsp > 0)
    coyote_time = 8
if (vsp < 0)
    coyote_time = 0
can_jump = ((grounded && vsp > 0) || (coyote_time > 0 && vsp > 0))
var prevmask = mask_index
var a = instance_place(x, y, obj_secrettile)
secret_array = ((a != noone && instance_exists(a) && a.secretFunction()) ? a.tiles : [])
switch state
{
	// i fucking hate it when it randomly decides to add self. to a funtion call
	// but then again it doesn't exist anyways lol
	// affected states: 3, 4, 5, 105
    case (2 << 0):
        scr_player_normal()
        break
    case (3 << 0):
        //self.state_player_revolver()
        break
    case (4 << 0):
        //self.state_player_dynamite()
        break
    case (5 << 0):
        //self.state_player_boots()
        break
    case (6 << 0):
        state_player_grabbed()
        break
    case (8 << 0):
        state_player_finishingblow()
        break
    case (7 << 0):
        state_player_tumble()
        break
    case (20 << 0):
        state_player_titlescreen()
        break
    case (9 << 0):
        state_player_ejected()
        break
    case (12 << 0):
        state_player_firemouth()
        break
    case (11 << 0):
        state_player_fireass()
        break
    case (10 << 0):
        state_player_transitioncutscene()
        break
    case (21 << 0):
        scr_playerN_hookshot()
        break
    case (25 << 0):
        state_player_slap()
        break
    case (22 << 0):
        state_player_tacklecharge()
        break
    case (26 << 0):
        state_player_cheesepep()
        break
    case (28 << 0):
        state_player_cheesepepjump()
        break
    case (29 << 0):
        state_player_cheesepepfling()
        break
    case (23 << 0):
        state_player_cheeseball()
        break
    case (24 << 0):
        state_player_cheeseballclimbwall()
        break
    case (31 << 0):
        state_player_cheesepepstickside()
        break
    case (32 << 0):
        state_player_cheesepepstickup()
        break
    case (27 << 0):
        state_player_cheesepepstick()
        break
    case (270 << 0):
        state_player_fishswim()
        break
    case (271 << 0):
        state_player_fishdash()
        break
    case (272 << 0):
        state_player_fishground()
        break
    case (273 << 0):
        state_player_fishhurt()
        break
    case (30 << 0):
        state_player_cheesepeplaunch()
        break
    case (35 << 0):
        state_player_boxxedpep()
        break
    case (37 << 0):
        state_player_boxxedpepjump()
        break
    case (36 << 0):
        state_player_boxxedpepspin()
        break
    case (38 << 0):
        state_player_pistolaim()
        break
    case (39 << 0):
        state_player_climbwall()
        break
    case (40 << 0):
        state_player_knightpepslopes()
        break
    case (41 << 0):
        state_player_portal()
        break
    case (42 << 0):
        state_player_secondjump()
        break
    case (43 << 0):
        state_player_chainsawbump()
        break
    case (44 << 0):
        state_player_handstandjump()
        break
    case (45 << 0):
        state_player_lungeattack()
        break
    case (46 << 0):
        state_player_lungegrab()
        break
    case (47 << 0):
        state_player_dashtumble()
        break
    case (155 << 0):
        state_player_shoulderbash()
        break
    case (48 << 0):
        state_player_gottreasure()
        break
    case (49 << 0):
        state_player_knightpep()
        break
    case (50 << 0):
        state_player_knightpepattack()
        break
    case (51 << 0):
        state_player_knightpepbump()
        break
    case (52 << 0):
        state_player_meteorpep()
        break
    case (53 << 0):
        state_player_bombpep()
        break
    case (56 << 0):
        state_player_bombpepup()
        break
    case (55 << 0):
        state_player_bombpepside()
        break
    case (54 << 0):
        state_player_bombgrab()
        break
    case (57 << 0):
        state_player_grabbing()
        break
    case (58 << 0):
        state_player_chainsawpogo()
        break
    case (59 << 0):
        state_player_shotgunjump()
        break
    case (61 << 0):
        state_player_stunned()
        break
    case (62 << 0):
        state_player_highjump()
        break
    case (63 << 0):
        state_player_chainsaw()
        break
    case (139 << 0):
        state_player_hit()
        break
    case (158 << 0):
        state_player_thrown()
        break
    case (64 << 0):
        state_player_facestomp()
        break
    case (66 << 0):
        state_player_timesup()
        break
    case (67 << 0):
        state_player_machroll()
        break
    case (74 << 0):
        state_player_pistol()
        break
    case (68 << 0):
        state_player_shotgun()
        break
    case (69 << 0):
        state_player_shotguncrouch()
        break
    case (70 << 0):
        state_player_shotguncrouchjump()
        break
    case (71 << 0):
        state_player_shotgunshoot()
        break
    case (73 << 0):
        state_player_shotgunfreefall()
        break
    case (72 << 0):
        state_player_shotgundash()
        break
    case (75 << 0):
        state_player_machfreefall()
        break
    case (76 << 0):
        state_player_throwing()
        break
    case (78 << 0):
        state_player_superslam()
        break
    case (77 << 0):
        state_player_slam()
        break
    case (79 << 0):
        state_player_skateboard()
        break
    case (80 << 0):
        state_player_grind()
        break
    case (81 << 0):
        state_player_grab()
        break
    case (82 << 0):
        state_player_punch()
        break
    case (83 << 0):
        state_player_backkick()
        break
    case (84 << 0):
        state_player_uppunch()
        break
    case (85 << 0):
        state_player_shoulder()
        break
    case (86 << 0):
        state_player_backbreaker()
        break
    case (87 << 0):
        state_player_graffiti()
        break
    case (88 << 0):
        state_player_bossdefeat()
        break
    case (90 << 0):
        state_player_bossintro()
        break
    case (98 << 0):
        state_player_smirk()
        break
    case (89 << 0):
        state_player_pizzathrow()
        break
    case (91 << 0):
        state_player_gameover()
        break
    case (125 << 0):
        state_player_Sjumpland()
        break
    case (124 << 0):
        state_player_freefallprep()
        break
    case (122 << 0):
        state_player_runonball()
        break
    case (120 << 0):
        state_player_boulder()
        break
    case (92 << 0):
        state_player_keyget()
        break
    case (93 << 0):
        state_player_tackle()
        break
    case (96 << 0):
        state_player_slipnslide()
        break
    case (95 << 0):
        state_player_ladder()
        break
    case (94 << 0):
        scr_player_jump()
        break
    case (100 << 0):
        state_player_victory()
        break
    case (97 << 0):
        state_player_comingoutdoor()
        break
    case (99 << 0):
        state_player_Sjump()
        break
    case (101 << 0):
        state_player_Sjumpprep()
        break
    case (102 << 0):
        state_player_crouch()
        break
    case (103 << 0):
        state_player_crouchjump()
        break
    case (104 << 0):
        state_player_crouchslide()
        break
    case (105 << 0):
        //self.state_player_mach1()
        break
    case (106 << 0):
        state_player_mach2()
        break
    case (123 << 0):
        state_player_mach3()
        break
    case (107 << 0):
        state_player_machslide()
        break
    case (108 << 0):
        state_player_bump()
        break
    case (109 << 0):
        state_player_hurt()
        break
    case (110 << 0):
        state_player_freefall()
        break
    case (113 << 0):
        state_player_freefallland()
        break
    case (111 << 0):
        state_player_hang()
        break
    case (114 << 0):
        state_player_door()
        break
    case (115 << 0):
        state_player_barrel()
        break
    case (116 << 0):
        state_player_barreljump()
        break
    case (118 << 0):
        state_player_barrelslide()
        break
    case (117 << 0):
        state_player_barrelclimbwall()
        break
    case (119 << 0):
        state_player_current()
        break
    case (121 << 0):
        state_player_taxi()
        break
    case (154 << 0):
        state_player_taxi()
        break
    case (60 << 0):
        state_player_pogo()
        break
    case (33 << 0):
        state_player_rideweenie()
        break
    case (34 << 0):
        state_player_motorcycle()
        break
    case (126 << 0):
        state_player_faceplant()
        break
    case (18 << 0):
        state_player_ghost()
        break
    case (19 << 0):
        state_player_ghostpossess()
        break
    case (13 << 0):
        state_player_mort()
        break
    case (14 << 0):
        state_player_mortjump()
        break
    case (15 << 0):
        state_player_mortattack()
        break
    case (16 << 0):
        state_player_morthook()
        break
    case (17 << 0):
        state_player_hook()
        break
    case (146 << 0):
        state_player_arenaintro()
        break
    case (148 << 0):
        state_player_actor()
        break
    case (149 << 0):
        state_player_parry()
        break
    case (150 << 0):
        state_player_golf()
        break
    case (152 << 0):
        state_player_tube()
        break
    case (156 << 0):
        state_player_pummel()
        break
    case (167 << 0):
        state_player_slipbanan()
        break
    case (185 << 0):
        state_player_bombdelete()
        break
    case (186 << 0):
        state_player_rocket()
        break
    case (187 << 0):
        state_player_rocketslide()
        break
    case (188 << 0):
        state_player_gotoplayer()
        break
    case (189 << 0):
        state_player_trickjump()
        break
    case (192 << 0):
        state_player_ridecow()
        break
    case (193 << 0):
        state_player_ratmount()
        break
    case (198 << 0):
        state_player_ratmounthurt()
        break
    case (194 << 0):
        state_player_ratmountjump()
        break
    case (195 << 0):
        state_player_ratmountattack()
        break
    case (196 << 0):
        state_player_ratmountspit()
        break
    case (197 << 0):
        state_player_ratmountclimbwall()
        break
    case (199 << 0):
        state_player_ratmountgroundpound()
        break
    case (200 << 0):
        state_player_ratmountbounce()
        break
    case (202 << 0):
        state_player_ratmountballoon()
        break
    case (204 << 0):
        state_player_ratmountgrind()
        break
    case (203 << 0):
        state_player_ratmounttumble()
        break
    case (261 << 0):
        state_player_ratmountpunch()
        break
    case (205 << 0):
        state_player_ratmounttrickjump()
        break
    case (206 << 0):
        state_player_ratmountskid()
        break
    case (208 << 0):
        state_player_blockstance()
        break
    case (209 << 0):
        state_player_balloon()
        break
    case (210 << 0):
        state_player_debugstate()
        break
    case (212 << 0):
        state_player_trashjump()
        break
    case (213 << 0):
        state_player_trashroll()
        break
    case (214 << 0):
        state_player_stringfling()
        break
    case (215 << 0):
        state_player_stringjump()
        break
    case (216 << 0):
        state_player_stringfall()
        break
    case (217 << 0):
        state_player_noisejetpack()
        break
    case (218 << 0):
        state_player_spiderweb()
        break
    case (227 << 0):
        state_player_animatronic()
        break
    case (254 << 0):
        state_player_playersuperattack()
        break
    case (256 << 0):
        state_player_jetpackjump()
        break
    case (259 << 0):
        state_player_bee()
        break
    case (262 << 0):
        state_player_ratmountcrouch()
        break
    case (263 << 0):
        state_player_ratmountladder()
        break
    case (267 << 0):
        state_player_antigrav()
        break
    case (269 << 0):
        state_player_firemove()
        break
    case (274 << 0):
        state_player_waterfloat()
        break
    case (275 << 0):
        scr_player_backtohub()
        break
    case (276 << 0):
        state_player_oilcutscene()
        break
}

a = instance_place(x, y, obj_secrettile)
secret_array = (a != noone ? a.tiles : ["-4"])
scr_playersounds()
if (prevstate != state)
{
    if (prevstate == (213 << 0) && prevsprite != spr_null && prevsprite != spr_null)
        create_debris(x, y, spr_player_trashlid)
}
if (!(place_meeting(x, (y + 1), obj_railparent)))
{
    if (state == (123 << 0) || state == (106 << 0) || state == (7 << 0))
        railmovespeed = approach(railmovespeed, 0, 0.1)
    else
        railmovespeed = approach(railmovespeed, 0, 0.5)
}
if (state != (44 << 0) && state != (7 << 0))
    crouchslipbuffer = 0
if (state != (123 << 0))
    mach4mode = 0
if (ratshootbuffer > 0)
    ratshootbuffer--
if (state != (227 << 0))
{
    animatronic_buffer = 360
    animatronic_collect_buffer = 0
}
if (state == (35 << 0) && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
    verticalbuffer--
if (superchargecombo_buffer > 0)
    superchargecombo_buffer--
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1
    global.combotime = 4
}
if (state != (2 << 0))
    breakdance_speed = 0.25
if ((!grounded) && (state == (189 << 0) || state == (94 << 0) || state == (105 << 0) || state == (106 << 0) || state == (123 << 0)) && input_check_pressed("jump") && global.noisejetpack == 1)
{
    vsp = -14
    state = (256 << 0)
    sprite_index = spr_player_jetpackstart
    doublejump = 0
    with (instance_create(x, y, obj_highjumpcloud2))
        sprite_index = spr_null
}
if (walljumpbuffer > 0)
    walljumpbuffer--
if (grounded && vsp > 0 && state != (217 << 0))
    jetpackfuel = jetpackmax
if tauntstoredisgustavo
{
    isgustavo = 1
    if (state != (86 << 0) && state != (149 << 0) && state != (87 << 0))
        tauntstoredisgustavo = 0
}
var splash_check = (state == (110 << 0) || state == (124 << 0) || state == (113 << 0) || state == (67 << 0) || state == (7 << 0) || vsp >= 15)
if place_meeting(x, y, obj_water)
{
    if ((!wet) && vsp > 2)
    {
        event_play_oneshot("event:/SFX/misc/watersplash", x, y)
        instance_create(x, bbox_bottom, obj_watersplasheffect, 
        {
            image_index: (splash_check ? 0 : 2)
        }
)
    }
    wet = true
}
else
{
    if (wet && vsp < 0)
    {
        event_play_oneshot("event:/SFX/misc/watersplashout", x, y)
        instance_create(x, bbox_bottom, obj_watersplasheffect, 
        {
            image_index: (state == (271 << 0) ? 0 : 2)
        }
)
    }
    wet = false
}
if (state != (123 << 0) && (state != (107 << 0) || sprite_index != spr_mach3boost))
{
    launch = 0
    launched = 0
    launch_buffer = 0
}
if (launch_buffer > 0)
    launch_buffer--
else
    launched = 0
if (state != (8 << 0))
    finishingblow = 0
if (dash_doubletap > 0)
    dash_doubletap--
if (cow_buffer > 0)
    cow_buffer--
if (state == (45 << 0))
    lunge_buffer = 14
if (blur_effect > 0)
    blur_effect--
else if (breakdance_speed >= 0.6 || mach4mode == 1 || boxxeddash == 1 || state == (18 << 0) || state == (7 << 0) || state == (200 << 0) || state == (195 << 0) || state == (44 << 0) || state == (118 << 0) || (state == (81 << 0) && sprite_index == spr_swingding && swingdingdash <= 0) || (state == (82 << 0) && (sprite_index == spr_breakdanceuppercut || sprite_index == spr_breakdanceuppercutend)) || state == (110 << 0) || state == (45 << 0) || (state == (95 << 0) && ladderfast == 1) || state == (271 << 0) || state == (99 << 0) || (state == (82 << 0) && (sprite_index == spr_kungfu1 || sprite_index == spr_kungfu2 || sprite_index == spr_kungfu3 || sprite_index == spr_shotgunsuplexdash || sprite_index == spr_player_kungfujump || sprite_index == spr_kungfuair1transition || sprite_index == spr_kungfuair1 || sprite_index == spr_kungfuair2transition || sprite_index == spr_kungfuair2 || sprite_index == spr_kungfuair3transition || sprite_index == spr_kungfuair3)))
{
    if (visible && (!(place_meeting(x, y, obj_secretportal))) && (!(place_meeting(x, y, obj_secretportalstart))))
    {
        blur_effect = 2
        with (create_blur_afterimage(x, y, sprite_index, image_index, (xscale * scale_xs), image_yscale, image_angle))
            playerid = other.id
    }
}
if (state != (63 << 0) && state != (108 << 0) && state != (35 << 0) && state != (36 << 0) && state != (37 << 0))
{
    boxxed = 0
    boxxeddash = 0
}
if (state != (81 << 0))
    grabbingenemy = 0
if (state != (106 << 0) && state != (123 << 0) && state != (189 << 0) && state != (203 << 0) && state != (205 << 0))
{
    ramp = 0
    ramp_points = 0
}
if (state != (114 << 0) && state != (63 << 0) && state != (139 << 0) && place_meeting(x, y, obj_boxofpizza))
    state = (102 << 0)
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (state != (31 << 0))
    yscale = 1
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == (109 << 0))
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if (room == Realtitlescreen && instance_exists(obj_mainmenuselect))
    state = (20 << 0)
if (wallclingcooldown < 10)
    wallclingcooldown++
if ((!instance_exists(superchargedeffectid)) && supercharged)
{
    var superchargeStates = [(2 << 0), (94 << 0), (105 << 0), (106 << 0), (123 << 0), (65 << 0)]
    if array_contains(superchargeStates, state)
    {
        with (instance_create((x + (irandom_range(-25, 25))), (y + (irandom_range(-10, 35))), obj_superchargeeffect))
        {
            playerid = other.id
            other.superchargedeffectid = id
        }
    }
}
if (state != (99 << 0))
    sjumpvsp = -12
if (state != (110 << 0))
    freefallvsp = 20
if (supercharge > 9 && state != (86 << 0))
{
    if (!supercharged)
    {
        ini_open_from_string(obj_savesystem.ini_str)
        if (ini_read_real("Game", "supertaunt", false) == 0)
            scr_queueToolTipPrompt(string("[fa_middle][spr_transfopromptfont]{0}{1} Supertaunt", get_control_sprite("up"), get_control_sprite("taunt")))
        ini_close()
        event_play_oneshot("event:/sfx/misc/supertauntnotif")
    }
    supercharged = 1
}
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == (97 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == true)
{
    if ((state == (82 << 0) || state == (44 << 0)) && (!((obj_player2.state == (82 << 0) || obj_player2.state == (44 << 0)))))
        fightballadvantage = 1
    else if (!((obj_player2.state == (82 << 0) || obj_player2.state == (44 << 0))))
        fightballadvantage = 0
}
if (state != (60 << 0) && state != (86 << 0))
{
    pogospeed = 6
    pogospeedprev = 0
}
if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_null)
            sprite_index = spr_null
        if (pogochargeactive == 1 && sprite_index == spr_null)
            sprite_index = spr_null
    }
    flashflicker = 1
    pogocharge--
}
else
    flashflicker = 0
if (state != (76 << 0))
    kickbomb = 0
if (pogocharge == 0)
{
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 20)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (state != (123 << 0) && state != (6 << 0))
    fightball = 0
if (state != (6 << 0) && state != (109 << 0))
{
    if (grounded && state != (57 << 0))
        suplexmove = 0
}
var _state = ((state == (63 << 0) || state == (86 << 0)) ? tauntstoredstate : state)
if (_state != (110 << 0) && _state != (78 << 0))
    freefallsmash = -14
if (state == (91 << 0) && y > (room_height * 2))
{
    scr_playerreset()
    with (instance_create(0, 0, obj_backtohub_fadeout))
        fadealpha = 0.9
}
if (baddiegrabbedID == obj_null && (state == (81 << 0) || state == (78 << 0) || state == (22 << 0)))
    state = (2 << 0)
if (!((state == (81 << 0) || state == (78 << 0) || state == (106 << 0))))
{
    baddiegrabbedID = obj_null
    heavy = 0
}
if (cutscene == 1 && state != (188 << 0))
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if (sprite_index == spr_winding && state != (2 << 0))
    windingAnim = 0
if (state != (81 << 0))
    swingdingbuffer = 0
if (state == (267 << 0) || state == (186 << 0) || state == (187 << 0))
    grav = 0
else if (state == (115 << 0))
    grav = 0.6
else if (state == (18 << 0) || state == (270 << 0) || state == (19 << 0))
    grav = 0
else if ((boxxed && state != (36 << 0)) || state == (274 << 0))
    grav = 0.3
else if (state == (256 << 0))
    grav = 0.5
else if (state == (36 << 0))
    grav = 0.6
else
    grav = 0.5
if (state == (115 << 0) && input_check_pressed("jump") && (!jumpstop))
    grav = 0.4
if (global.combo >= 25 && (!instance_exists(angryeffectid)) && state == (2 << 0) && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combotimepause > 0)
        global.combotimepause--
    if (global.combo != global.previouscombo)
    {
        global.previouscombo = global.combo
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            instance_destroy(obj_combotitle)
            with (instance_create(x, (y - 80), obj_combotitle))
                title = floor(global.combo / 5)
        }
    }
    if (!((state == (114 << 0) || state == (152 << 0) || state == (121 << 0) || state == (48 << 0) || state == (100 << 0) || state == (48 << 0) || state == (148 << 0) || state == (97 << 0) || (state == (273 << 0) && fishthrown == true) || (state == (49 << 0) && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))))
    {
        if (global.combotime > 0 && global.combotimepause <= 0)
            global.combotime -= 0.15
    }
    if (global.heattime > 0)
        global.heattime -= 0.15
    if (global.combotime <= 0 && global.combo != 0)
    {
        if (global.combo >= 50)
            tv_do_expression(spr_tv_exprheatcomboend)
        global.savedcombo = global.combo
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
        global.style -= 0.05
}
if (coyote_time > 0)
    coyote_time--
if (input_check_pressed("jump") && (!grounded) && (state == (106 << 0) || state == (123 << 0)) && state != ((39 << 0) & walljumpbuffer) <= 0)
    input_buffer_walljump = 24
if (input_buffer_jump < 8)
    input_buffer_jump++
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (input_buffer_slap < 8)
    input_buffer_slap++
if (key_particles == 1)
    create_particle((x + (random_range(-25, 25))), (y + (random_range(-35, 25))), (10 << 0), 0)
if (inv_frames == 0 && hurted == 0 && state != (18 << 0))
    image_alpha = 1
if (state == (82 << 0) || (state == (94 << 0) && sprite_index == spr_null) || state == (22 << 0) || state == (79 << 0) || state == (49 << 0) || state == (26 << 0) || state == (40 << 0) || state == (50 << 0) || state == (53 << 0) || state == (64 << 0) || state == (75 << 0) || state == (64 << 0) || state == (123 << 0) || state == (110 << 0) || state == (99 << 0))
    attacking = 1
else
    attacking = 0
if (state == (76 << 0) || state == (83 << 0) || state == (85 << 0) || state == (84 << 0))
    grabbing = 1
else
    grabbing = 0
if ((state == (200 << 0) && vsp >= 0) || state == (271 << 0) || sprite_index == spr_player_Sjumpcancel || sprite_index == spr_swingding || sprite_index == spr_tumble || state == (36 << 0) || state == (213 << 0) || state == (212 << 0) || state == (72 << 0) || (state == (73 << 0) && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == (99 << 0) || state == (186 << 0) || state == (187 << 0) || state == (43 << 0) || state == (82 << 0) || state == (126 << 0) || state == (33 << 0) || state == (123 << 0) || (state == (94 << 0) && sprite_index == spr_null) || state == (110 << 0) || state == (11 << 0) || state == (256 << 0) || state == (12 << 0) || state == (21 << 0) || state == (256 << 0) || state == (79 << 0) || state == (65 << 0) || state == (99 << 0) || state == (75 << 0) || state == (22 << 0) || (state == (78 << 0) && sprite_index == spr_piledriver) || state == (49 << 0) || state == (50 << 0) || state == (40 << 0) || state == (189 << 0) || state == (26 << 0) || state == (23 << 0) || state == (203 << 0) || state == (199 << 0) || state == (261 << 0) || state == (267 << 0) || ratmount_movespeed == 12 || state == (167 << 0) || state == (155 << 0) || sprite_index == spr_mach3boost)
    instakillmove = 1
else
    instakillmove = 0
if (state == (200 << 0) && vsp < 0)
    stunmove = 1
else
    stunmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed
if (state != (95 << 0))
    hooked = 0
if (state != (123 << 0) && state != (107 << 0))
    autodash = 0
if ((state != (94 << 0) && state != (103 << 0) && state != (25 << 0)) || vsp < 0)
    fallinganimation = 0
if (state != (113 << 0) && state != (2 << 0) && state != (107 << 0) && state != (94 << 0))
    facehurt = 0
if (state != (2 << 0) && state != (107 << 0))
    machslideAnim = 0
if (state != (2 << 0) && state != (193 << 0))
{
    idle = 0
    dashdust = 0
}
if (state != (105 << 0) && state != (28 << 0) && state != (94 << 0) && state != (21 << 0) && state != (44 << 0) && state != (2 << 0) && state != (106 << 0) && state != (123 << 0) && state != (124 << 0) && state != (49 << 0) && state != (68 << 0) && state != (40 << 0))
    momemtum = 0
if (state != (99 << 0) && state != (101 << 0))
    a = 0
if (state != (64 << 0))
    facestompAnim = 0
if (state != (110 << 0) && state != (64 << 0) && state != (78 << 0) && state != (113 << 0))
    superslam = 0
if (state != (106 << 0))
    machpunchAnim = 0
if (ladderbuffer > 0)
    ladderbuffer--
if (state != (94 << 0))
    stompAnim = 0
var mach_effect_check = (state == (123 << 0) || state == (99 << 0) || (freefallsmash >= 10 && state == (110 << 0)) || state == (106 << 0) || ratmount_movespeed == 12)
if ((!(place_meeting(x, y, obj_secretportal))) && (!(place_meeting(x, y, obj_secretportalstart))))
{
    if mach_effect_check
    {
        if (macheffect == 0)
        {
            macheffect = 1
            toomuchalarm1 = 6
            create_mach3effect(x, y, sprite_index, (image_index - 1), (xscale * scale_xs), id, image_yscale)
        }
    }
    if (toomuchalarm1 > 0)
    {
        toomuchalarm1 -= 1
        if (toomuchalarm1 <= 0 && mach_effect_check)
        {
            create_mach3effect(x, y, sprite_index, (image_index - 1), (xscale * scale_xs), id, image_yscale)
            toomuchalarm1 = 6
        }
    }
}
else
    macheffect = 0
if (!mach_effect_check)
    macheffect = 0
if ((y > (room_height + 300) || y < -800) && (!(place_meeting(x, y, obj_verticalhallway))) && (!verticalhallway) && state != (91 << 0) && state != (275 << 0) && state != (188 << 0))
{
    visible = true
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = 3 / room_speed
    }
    if (state == (19 << 0))
    {
        state = (18 << 0)
        sprite_index = spr_ghostidle
    }
    var store_state = state
    state = (148 << 0)
    visible = false
    hsp = 0
    vsp = 0
    event_play_oneshot("event:/SFX/bo/groundpound", x, y)
    with (instance_create(x, (y + obj_gameFrame.defaultheight), obj_technicaldifficulty))
    {
        storedState = store_state
        playerid = other.id
        if (!other.isgustavo)
            sprite = choose(spr_technicaldifficulty1, spr_technicaldifficulty2, spr_technicaldifficulty3, spr_technicaldifficulty4)
        else
            sprite = spr_technicaldifficulty_drown
    }
    with (obj_ghostfollow)
    {
        x = xstart
        y = ystart
    }
    vsp = 10
}
if (character == "S")
{
    if (state == (103 << 0) || state == (102 << 0))
        state = (2 << 0)
}
if (character != "M")
{
    if (!(scr_solid_player(x, y)))
    {
        if (state != (262 << 0) && state != (37 << 0) && state != (36 << 0) && (!((state == (108 << 0) && sprite_index == spr_tumbleend))) && state != (118 << 0) && state != (117 << 0) && sprite_index != spr_knightpepthunder && state != (61 << 0) && state != (102 << 0) && state != (69 << 0) && state != (70 << 0) && state != (35 << 0) && state != (74 << 0) && sprite_index != spr_null && state != (101 << 0) && state != (104 << 0) && state != (63 << 0) && state != (67 << 0) && state != (109 << 0) && state != (103 << 0) && state != (32 << 0) && state != (31 << 0) && state != (7 << 0))
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else
        mask_index = spr_crouchmask
}
if (state == (48 << 0) || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == (92 << 0) || state == (63 << 0) || state == (114 << 0) || state == (9 << 0) || state == (100 << 0) || state == (97 << 0) || state == (91 << 0) || state == (188 << 0) || state == (154 << 0) || state == (148 << 0) || place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    cutscene = 1
else
    cutscene = 0
if (((place_meeting(x, y, obj_door) && (!(place_meeting(x, y, obj_doorblocked)))) || place_meeting(x, y, obj_taxi) || place_meeting(x, y, obj_dialognpc) || place_meeting(x, y, obj_dresser) || place_meeting(x, y, obj_keydoor) || place_meeting(x, y, obj_filedoor) || place_meeting(x, y, obj_optiondoor) || (place_meeting(x, y, obj_startgate) && grounded && state != (100 << 0)) || (place_meeting(x, y, obj_exitgate) && global.panic == true)) && (!instance_exists(obj_uparrow)) && scr_solid(x, (y + 1)) && state == (2 << 0) && obj_player1.spotlight == 1)
{
    with (instance_create(x, y, obj_uparrow))
        playerid = other.object_index
}
if (movespeed >= 12 && state == (123 << 0) && (!instance_exists(speedlineseffectid)))
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
with (obj_ratblock)
    scr_ratblock_destroy()
scr_collide_destructibles()
if (state == (152 << 0) || state == (188 << 0) || state == (210 << 0))
{
    x += hsp
    y += vsp
}
if (state != (269 << 0))
{
    angle = 0
    firemovedir = 0
}
if (state != (97 << 0))
    image_blend = c_white
prevstate = state
prevsprite = sprite_index
if (state != (19 << 0) && state != (188 << 0) && state != (210 << 0) && state != (20 << 0) && state != (152 << 0) && state != (6 << 0) && state != (114 << 0) && state != (9 << 0) && state != (97 << 0) && state != (120 << 0) && state != (92 << 0) && state != (100 << 0) && state != (41 << 0) && state != (66 << 0) && state != (48 << 0) && state != (91 << 0))
    scr_collide_player()
if (state == (120 << 0))
    scr_collide_player()
if place_meeting(x, y, obj_water)
{
    if (bubbleBuffer >= bubbleBufferMax)
    {
        bubbleBuffer = 0
        bubbleBufferMax = irandom_range(25, 50)
        instance_create((x + (random_range(-9, 9))), (y + (random_range(-9, 9))), obj_waterBubble)
    }
    bubbleBuffer++
}
else
    bubbleBuffer = 0
if (state == (274 << 0) && place_meeting(x, y, obj_water))
{
    if (drownBuffer < drownBufferMax)
    {
        drownBuffer++
        trace(drownBuffer)
    }
    else
    {
        visible = false
        drownBuffer = 0
        wet = false
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
        if (state == (19 << 0))
        {
            state = (18 << 0)
            sprite_index = spr_ghostidle
        }
        state = (148 << 0)
        hsp = 0
        vsp = 0
        mail_trigger((9 << 0))
        event_play_oneshot("event:/SFX/bo/drown", x, y)
        with (instance_create(x, (y + obj_gameFrame.defaultheight), obj_technicaldifficulty))
        {
            playerid = other.id
            if (!other.isgustavo)
                sprite = choose(spr_technicaldifficulty_drown)
            else
                sprite = spr_technicaldifficulty_drown
        }
        with (instance_create(x, y, obj_playerDrown))
        {
            sprite_index = spr_player_drown
            buffer = 100
            vsp = 0
            hsp = 0
        }
        with (obj_ghostfollow)
        {
            x = xstart
            y = ystart
        }
        vsp = 10
    }
}
else
    drownBuffer = 0
