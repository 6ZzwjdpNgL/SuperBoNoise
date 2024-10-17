if (!instance_exists(baddieID))
    instance_destroy()
if instance_exists(baddieID)
{
    x = baddieID.x
    y = baddieID.y
    image_xscale = baddieID.image_xscale
}
for (var i = 0; i < 2; i++)
{
    var _obj_player = asset_get_index(concat("obj_player", (i + 1)))
    var _playerindex = i + 1
    if (instance_exists(baddieID) && place_meeting(x, y, _obj_player) && _obj_player.cutscene == 0)
    {
        if (baddieID.state != (6 << 0) && (!baddieID.invincible) && baddieID.state != (19 << 0))
        {
            with (_obj_player)
            {
                if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && (!global.kungfu) && sprite_index != spr_player_mach2jump && ((state == (5 << 0) && vsp > 0) || state == (94 << 0) || state == (105 << 0) || state == (81 << 0)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                {
                    event_play_oneshot("event:/SFX/enemies/stomp", x, y)
                    image_index = 0
                    if (other.baddieID.object_index != obj_tank)
                    {
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign(other.baddieID.x - x)))
                        other.baddieID.hsp = xscale * 5
                        other.baddieID.vsp = -5
                        other.baddieID.state = (140 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        other.baddieID.xscale = 1.4
                        other.baddieID.yscale = 0.6
                    }
                    if (other.baddieID.object_index == obj_pizzaball)
                    {
                        with (other.baddieID)
                        {
                            scr_pizzaball_go_to_thrown(0, -5, 0)
                            vsp = 5
                        }
                    }
                    if input_check("jump")
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -14
                        if (state == (94 << 0))
                            sprite_index = spr_stompprep
                    }
                    else
                    {
                        instance_create(x, (y + 50), obj_stompeffect)
                        stompAnim = 1
                        vsp = -9
                        if (state == (94 << 0))
                            sprite_index = spr_stompprep
                    }
                }
                if (instance_exists(other.baddieID) && state == (46 << 0))
                {
                    other.baddieID.grabbedby = _playerindex
                    other.baddieID.state = (6 << 0)
                    other.baddieID.hp = -99
                    if input_check("down")
                    {
                        sprite_index = spr_piledriver
                        vsp = -5
                        state = (78 << 0)
                        image_index = 0
                        image_speed = 0.35
                    }
                    else
                    {
                        sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
                        image_index = 0
                        hsp = 0
                        movespeed = 0
                        state = (8 << 0)
                    }
                }
                if (instance_exists(other.baddieID) && other.baddieID.state != (207 << 0) && (!other.baddieID.invincible) && state == (195 << 0))
                {
                    other.baddieID.ratplayerid = id
                    other.baddieID.state = (207 << 0)
                    ratgrabbedID = other.baddieID.id
                    state = (193 << 0)
                }
                if (instance_exists(other.baddieID) && other.baddieID.invtime == 0 && ((other.baddieID.object_index != obj_bigcheese && other.baddieID.object_index != obj_pepbat) || state != (7 << 0)) && ((state == (44 << 0) && global.attackstyle == 1) || instakillmove == 1) && other.baddieID.state != (6 << 0) && (!other.baddieID.invincible) && other.baddieID.instantkillable)
                    Instakill()
                else if (state == (44 << 0) && global.attackstyle == 0)
                {
                    image_index = 0
                    if (!input_check("up"))
                    {
                        if (movespeed <= 10)
                            sprite_index = spr_haulingstart
                        else
                            sprite_index = spr_swingding
                        if (!grounded)
                            vsp = -6
                        swingdingendcooldown = 0
                        state = (81 << 0)
                        baddiegrabbedID = other.baddieID
                        grabbingenemy = 1
                        other.baddieID.state = (6 << 0)
                        other.baddieID.grabbedby = _playerindex
                    }
                    else if input_check("up")
                    {
                        baddiegrabbedID = other.baddieID
                        grabbingenemy = 1
                        other.baddieID.state = (6 << 0)
                        other.baddieID.grabbedby = _playerindex
                        sprite_index = spr_piledriver
                        vsp = -14
                        state = (78 << 0)
                        image_index = 0
                        image_speed = 0.35
                    }
                }
                else if (state == (44 << 0) && global.attackstyle == 3)
                {
                    var _ms = movespeed
                    movespeed = 0
                    baddiegrabbedID = other.baddieID
                    grabbingenemy = 1
                    var _prevstate = other.baddieID.state
                    other.baddieID.state = (6 << 0)
                    other.baddieID.grabbedby = _playerindex
                    if global.pummeltest
                    {
                        if (image_index > 6)
                        {
                            if input_check("up")
                            {
                                state = (8 << 0)
                                sprite_index = spr_uppercutfinishingblow
                                image_index = 4
                                movespeed = 0
                            }
                            else if input_check("down")
                            {
                                sprite_index = spr_piledriver
                                vsp = -5
                                state = (78 << 0)
                                image_index = 4
                                image_speed = 0.35
                            }
                            else
                            {
                                state = (8 << 0)
                                sprite_index = spr_null
                                image_index = 0
                            }
                        }
                        else
                        {
                            other.baddieID.state = _prevstate
                            grabbingenemy = 0
                            movespeed = _ms
                        }
                    }
                    else
                    {
                        image_index = 0
                        if input_check("up")
                        {
                            state = (8 << 0)
                            sprite_index = spr_uppercutfinishingblow
                            image_index = 4
                            movespeed = 0
                        }
                        else if input_check("down")
                        {
                            sprite_index = spr_piledriver
                            vsp = -5
                            state = (78 << 0)
                            image_index = 4
                            image_speed = 0.35
                        }
                        else
                        {
                            state = (8 << 0)
                            sprite_index = spr_null
                            image_index = 0
                        }
                    }
                }
                if (place_meeting(x, (y + 1), other) && state == (60 << 0) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_null && (!other.baddieID.invincible))
                {
                    switch pogochargeactive
                    {
                        case 0:
                            pogospeedprev = 0
                            other.baddieID.vsp = -3
                            event_play_oneshot("event:/SFX/enemies/stomp", x, y)
                            other.baddieID.state = (140 << 0)
                            if (other.baddieID.stunned < 100)
                                other.baddieID.stunned = 100
                            sprite_index = spr_null
                            break
                        case 1:
                            pogospeedprev = 0
                            scr_throwenemy()
                            sprite_index = spr_null
                            break
                    }

                    instance_create(x, (y + 50), obj_stompeffect)
                    image_index = 0
                    movespeed = 0
                    vsp = 0
                }
                var pepp_grab = 0
                if (character == "M" && instance_exists(other.baddieID) && (state == (2 << 0) || state == (94 << 0)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == (140 << 0) && other.baddieID.stuntouchbuffer == 0 && (!other.baddieID.thrown) && (!other.baddieID.invincible))
                {
                    other.baddieID.pepperman_grab = 1
                    pepperman_grabID = other.baddieID.id
                    other.baddieID.state = (6 << 0)
                    other.baddieID.grabbedby = _playerindex
                    pepp_grab = 1
                }
                if (instance_exists(other.baddieID) && other.baddieID.object_index != obj_bigcheese && (state == (7 << 0) || state == (106 << 0)) && other.baddieID.state != (82 << 0) && other.baddieID.state != (139 << 0) && (!pepp_grab) && other.baddieID.thrown == false && other.baddieID.stuntouchbuffer <= 0 && other.baddieID.state != (6 << 0) && other.baddieID.state != (43 << 0) && other.baddieID.state != (63 << 0) && (!other.baddieID.invincible))
                {
                    var lag = 0
                    other.baddieID.stuntouchbuffer = 15
                    with (other.baddieID)
                    {
                        xscale = 0.8
                        yscale = 1.3
                        instance_create(x, y, obj_bangeffect)
                        state = (139 << 0)
                        image_xscale = (-other.xscale)
                        hithsp = other.xscale * 12
                        hitvsp = (other.y - 180 - y) / 60
                        trace([hithsp, hitvsp])
                        hitLag = lag
                        hitX = x
                        hitY = y
                        invtime = lag + 5
                        event_play_oneshot("event:/SFX/bo/mach2bump", x, y)
                    }
                    tauntstoredstate = state
                    tauntstoredsprite = sprite_index
                    tauntstoredmovespeed = movespeed
                    tauntstoredvsp = vsp
                    state = (63 << 0)
                    hitLag = lag
                    global.combotimepause = 15
                    hitX = x
                    hitY = y
                    repeat (2)
                    {
                        with (create_debris(x, y, spr_slapstar))
                            vsp = irandom_range(-6, -11)
                    }
                }
                if (character != "M" && instance_exists(other.baddieID) && state == (57 << 0) && (!other.baddieID.invincible))
                {
                    if (instance_exists(other.baddieID) && y < (other.baddieID.y - 50) && attacking == 0 && state != (44 << 0) && other.baddieID.state != (6 << 0) && sprite_index != spr_player_mach2jump && (state == (94 << 0) || state == (105 << 0) || (state == (81 << 0) && sprite_index != spr_swingding)) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && (!other.baddieID.invincible))
                    {
                        event_play_oneshot("event:/SFX/enemies/stomp", x, y)
                        if (x != other.baddieID.x)
                            other.baddieID.image_xscale = (-(sign(other.baddieID.x - x)))
                        image_index = 0
                        other.baddieID.state = (140 << 0)
                        if (other.baddieID.stunned < 100)
                            other.baddieID.stunned = 100
                        if input_check("jump")
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -14
                            if (state != (81 << 0))
                                sprite_index = spr_stompprep
                        }
                        else
                        {
                            instance_create(x, (y + 50), obj_stompeffect)
                            stompAnim = 1
                            other.baddieID.image_index = 0
                            vsp = -9
                            if (state != (81 << 0))
                                sprite_index = spr_stompprep
                        }
                    }
                    if (other.baddieID.thrown == false && (character == "P" || character == "N"))
                    {
                        movespeed = 0
                        image_index = 0
                        sprite_index = spr_haulingstart
                        state = (81 << 0)
                        other.baddieID.state = (6 << 0)
                        other.baddieID.grabbedby = _playerindex
                    }
                }
            }
        }
    }
}
