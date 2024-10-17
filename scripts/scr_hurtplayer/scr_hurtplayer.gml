function scr_hurtplayer(argument0) //scr_hurtplayer
{
    var _hurt = 0
    with (argument0)
    {
        if global.failcutscene
        {
        }
        else if (state == (149 << 0) || state == (210 << 0) || state == (150 << 0) || state == (167 << 0))
        {
        }
        else if (state == (44 << 0) && flash == 1)
        {
        }
        else if (state == (86 << 0) || state == (63 << 0))
        {
        }
        else if global.kungfu
        {
            if (state == (208 << 0))
            {
                if (sprite_index != spr_null)
                {
                    instance_create(x, y, obj_parryeffect)
                    image_index = 0
                }
                sprite_index = spr_null
                hsp = (-xscale) * 2
            }
            else if (state != (158 << 0) && state != (139 << 0) && (!hurted))
            {
                instance_create(x, y, obj_parryeffect)
                repeat (5)
                {
                    with (create_debris(x, y, spr_slapstar))
                        vsp = irandom_range(-6, -11)
                }
                hitLag = 3
                hitxscale = (x != other.x ? sign(other.x - x) : (-other.image_xscale))
                state = (139 << 0)
                hitstunned = 50
                hurted = 1
                alarm[7] = hitstunned + 30
                hithsp = 12
                hitvsp = -5
                hitX = x
                hitY = y
                sprite_index = spr_hurt
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player1)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
        }
        else if isgustavo
        {
            if (!hurted)
            {
                state = (198 << 0)
                movespeed = 6
                vsp = -9
                flash = 1
                alarm[8] = 100
                hurted = 1
                instance_create(x, y, obj_spikehurteffect)
                _hurt = 1
            }
        }
        else if (state == (72 << 0))
        {
        }
        else if (state == (273 << 0))
        {
        }
        else if ((state == (49 << 0) || state == (50 << 0) || state == (40 << 0) || state == (51 << 0)) && cutscene == 0)
        {
        }
        else if (state == (18 << 0))
        {
        }
        else if (state == (19 << 0))
        {
            if (instance_exists(possessID) && object_get_parent(possessID) == 407)
            {
                state = (18 << 0)
                with (obj_baddie)
                {
                    if (is_controllable && state == (19 << 0) && playerid == other.id)
                        instance_destroy()
                }
            }
        }
        else if (state == (96 << 0))
        {
        }
        else if (state == (189 << 0))
        {
        }
        else if (state == (43 << 0))
        {
        }
        else if (state == (53 << 0) && hurted == 0)
        {
        }
        else if (state == (33 << 0))
        {
        }
        else if (state == (96 << 0))
        {
        }
        else if (state == (35 << 0))
        {
            hsp = (-xscale) * 4
            vsp = -5
            state = (108 << 0)
            sprite_index = spr_bump
            alarm[5] = 2
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
        }
        else if (pizzashield == 1)
        {
            pizzashield = 0
            with (instance_create(x, y, obj_baddieDead))
                sprite_index = spr_pizzashield_collectible
            hsp = (-xscale) * 4
            vsp = -5
            state = (108 << 0)
            sprite_index = spr_bump
            invhurt_buffer = 120
            alarm[8] = 60
            alarm[7] = 120
            hurted = 1
        }
        else if (state != (109 << 0) && state != (198 << 0) && state != (6 << 0) && (hurted == 0 || state == (26 << 0) || state == (31 << 0) || state == (32 << 0)) && cutscene == 0)
        {
            if (state == (13 << 0) || state == (16 << 0) || state == (14 << 0) || state == (15 << 0))
            {
                with (instance_create(x, y, obj_mortflyaway))
                    image_xscale = (-other.xscale)
            }
            _hurt = 1
            if (character == "V")
                global.playerhealth -= 25
            if (state == (115 << 0) || state == (117 << 0) || state == (116 << 0) || state == (118 << 0))
            {
                repeat (4)
                    create_debris(x, y, spr_barreldebris)
            }
            if global.kungfu
            {
                if (global.hp > 1)
                {
                    global.hp--
                    with (obj_camera)
                        healthshaketime = 60
                }
                else
                {
                    with (obj_music)
                        arena = 0
                    global.kungfu = 0
                    if (!instance_exists(obj_fadeout))
                    {
                        with (obj_player1)
                            targetRoom = lastroom
                        instance_create(x, y, obj_fadeout)
                    }
                }
            }
            if (state == (6 << 0))
            {
                if (object_index == obj_player1)
                    y = obj_player2.y
                else
                    y = obj_player1.y
            }
            alarm[8] = 100
            alarm[7] = 150
            hurted = 1
            event_play_oneshot("event:/SFX/bo/hurt", x, y)
            if chance(50)
                fmod_event_play(voice_hurt)
            if (xscale == other.image_xscale)
                sprite_index = spr_hurtjump
            else
                sprite_index = spr_hurt
            movespeed = 8 / getRPGMulti("defense")
            vsp = -14 / getRPGMulti("defense")
            timeuntilhpback = 300
            instance_create(x, y, obj_spikehurteffect)
            if (state == (271 << 0) || state == (270 << 0) || state == (272 << 0))
                state = (273 << 0)
            else
                state = (109 << 0)
            image_index = 0
            flash = 1
            global.player_damage++
        }
        if _hurt
        {
            global.combotime -= 25
            global.style -= 25
            global.hurtcounter += 1
            var loseamount = 50 * (global.stylethreshold + 1)
            if ((!instance_exists(obj_bosscontroller)) && global.collect > 0)
            {
                with (instance_create(190, 65, obj_negativenumber))
                    number = concat("-", loseamount)
            }
            if (!global.pizzadelivery)
            {
                if (global.collect > loseamount)
                    global.collect -= loseamount
                else
                    global.collect = 0
                if (global.collect != 0)
                {
                    if (character == "P" || character == "V")
                    {
                        repeat (10)
                        {
                            with (instance_create(x, y, obj_pizzaloss))
                                sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
                        }
                    }
                    else
                    {
                        repeat (10)
                            instance_create(x, y, obj_pizzaloss)
                    }
                }
            }
        }
    }
    return;
}

