function scr_enemy_grabbed() //scr_enemy_grabbed
{
    if (!pepperman_grab)
    {
        var _obj_player = obj_player1
        image_xscale = (-_obj_player.xscale)
        stunned = 200
        _obj_player.baddiegrabbedID = id
        if (_obj_player.state == (57 << 0) || _obj_player.state == (81 << 0) || _obj_player.state == (76 << 0) || _obj_player.state == (77 << 0) || _obj_player.state == (22 << 0))
        {
            x = _obj_player.x
            var walk_bobbing = 0
            if (_obj_player.sprite_index == _obj_player.spr_haulingwalk)
                walk_bobbing = ((floor(_obj_player.image_index) % 4) <= 0 ? 0 : 2)
            if (_obj_player.sprite_index != _obj_player.spr_haulingstart)
                y = _obj_player.y - 48 + walk_bobbing
            else if (floor(_obj_player.image_index) == 0)
                y = _obj_player.y - 10
            else if (floor(_obj_player.image_index) == 1)
                y = _obj_player.y - 20
            else if (floor(_obj_player.image_index) == 2)
                y = _obj_player.y - 25
            else if (floor(_obj_player.image_index) == 3)
                y = _obj_player.y - 52
            else
                y = _obj_player.y - 45
            depth = _obj_player.depth - 1
            image_xscale = (-_obj_player.xscale)
        }
        with (_obj_player)
        {
            suplexhavetomash = other.hp - 1
            move = (-input_check_pressed("left")) + input_check_pressed("right")
            if (!((state == (81 << 0) || state == (63 << 0) || state == (156 << 0) || state == (8 << 0) || state == (57 << 0) || state == (76 << 0) || state == (77 << 0) || state == (22 << 0) || state == (82 << 0) || state == (78 << 0) || state == (83 << 0) || state == (84 << 0) || state == (85 << 0))))
            {
                other.x = x
                other.y = y
                other.state = (140 << 0)
                other.image_index = 0
            }
        }
        hsp = 0
        if (_obj_player.state == (82 << 0) || _obj_player.state == (149 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            instance_create((x + _obj_player.xscale * 30), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = true
            x = _obj_player.x
            vsp = 0
            y = _obj_player.y
            state = (140 << 0)
            hsp = (-image_xscale) * 25
            grav = 0
            global.combotime = 60
            if (!important)
                global.style += (5 + global.combo)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
        }
        if (_obj_player.state == (8 << 0))
        {
            if (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)
            {
                x = _obj_player.x + _obj_player.xscale * 60
                y = _obj_player.y
            }
            else if (floor(_obj_player.image_index) < 4)
            {
                x = _obj_player.x + _obj_player.xscale * 60
                y = _obj_player.y
            }
            check_grabbed_solid(_obj_player)
            check_grabbed_solid(_obj_player)
        }
        if (_obj_player.state == (83 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + (-_obj_player.xscale) * 50), y, obj_bumpeffect)
            alarm[1] = 5
            thrown = true
            x = _obj_player.x
            y = _obj_player.y
            state = (140 << 0)
            image_xscale *= -1
            hsp = (-image_xscale) * 20
            vsp = -7
            global.combotime = 60
            if (!important)
                global.style += (5 + global.combo)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
        }
        if (_obj_player.state == (85 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create(x, (y + 20), obj_bumpeffect)
            alarm[1] = 5
            thrown = true
            x = _obj_player.x
            y = _obj_player.y
            state = (140 << 0)
            if (_obj_player.sprite_index == spr_player_shoulder)
                vsp = 15
            if (_obj_player.sprite_index == spr_player_diagonaldownthrow)
            {
                hsp = (-image_xscale) * 10
                vsp = 15
            }
            if (_obj_player.sprite_index == spr_player_diagonalupthrow)
            {
                hsp = (-image_xscale) * 10
                vsp = -15
            }
            global.combotime = 60
            if (!important)
                global.style += (5 + global.combo)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
        }
        if (_obj_player.state == (8 << 0) && (floor(_obj_player.image_index) >= 4 || (floor(_obj_player.image_index) < 1 && _obj_player.sprite_index == _obj_player.spr_swingdingend)))
        {
            thrown = true
            var lag = 5
            hitLag = lag
            hitX = x
            hitY = y
            if (object_index != obj_noisey && object_index != obj_tank)
            {
            }
            _obj_player.movespeed = 0
            _obj_player.hitLag = lag
            _obj_player.hitX = _obj_player.x
            _obj_player.hitY = _obj_player.y
            event_play_oneshot("event:/SFX/bo/punch", x, y)
            event_play_oneshot("event:/SFX/enemies/killingblow", x, y)
            instance_create(x, y, obj_parryeffect)
            alarm[3] = 1
            global.combotime = 60
            global.heattime = 60
            if (!important)
                global.style += (5 + global.combo)
            state = (140 << 0)
            image_xscale = (-_obj_player.xscale)
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
            with (_obj_player)
            {
                if (sprite_index == spr_uppercutfinishingblow)
                {
                    other.hithsp = 0
                    other.hitvsp = -25
                    other.linethrown = true
                }
                else
                {
                    other.hithsp = (-other.image_xscale) * 25
                    other.hitvsp = -8
                    other.linethrown = true
                }
                vsp = -6
            }
            check_grabbed_solid(_obj_player)
            check_grabbed_solid(_obj_player)
            hsp = hithsp
            vsp = hitvsp
            linethrown = true
        }
        if (_obj_player.state == (76 << 0))
        {
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            alarm[1] = 5
            thrown = true
            x = _obj_player.x
            y = _obj_player.y
            state = (140 << 0)
            hsp = (-image_xscale) * 8
            vsp = -6
            check_grabbed_solid(_obj_player)
            check_grabbed_solid(_obj_player)
        }
        if (_obj_player.state == (84 << 0))
        {
            alarm[3] = 3
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            hp -= 1
            instance_create((x + (-_obj_player.xscale) * 15), (y - 50), obj_bumpeffect)
            alarm[1] = 5
            thrown = true
            x = _obj_player.x
            y = _obj_player.y
            hsp = (-image_xscale) * 2
            state = (140 << 0)
            vsp = -20
            global.combotime = 60
            if (!important)
                global.style += (5 + global.combo)
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
            check_grabbed_solid(_obj_player)
        }
        if (_obj_player.state == (22 << 0))
        {
            x = _obj_player.x + _obj_player.xscale * 15
            y = _obj_player.y
        }
        if (_obj_player.state == (78 << 0) || (_obj_player.state == (63 << 0) && sprite_index == spr_null))
        {
            if (_obj_player.character == "P" && _obj_player.ispeppino)
            {
                if (_obj_player.sprite_index != _obj_player.spr_piledriverland)
                {
                    if (floor(_obj_player.image_index) == 0)
                    {
                        depth = 0
                        x = _obj_player.x + _obj_player.xscale * 10
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 1)
                    {
                        depth = 0
                        x = _obj_player.x + _obj_player.xscale * 5
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 2)
                    {
                        depth = 0
                        x = _obj_player.x
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 3)
                    {
                        depth = 0
                        x = _obj_player.x + _obj_player.xscale * -5
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 4)
                    {
                        depth = 0
                        x = _obj_player.x + _obj_player.xscale * -10
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 5)
                    {
                        depth = -9
                        x = _obj_player.x + _obj_player.xscale * -5
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 6)
                    {
                        depth = -9
                        x = _obj_player.x
                        y = _obj_player.y
                    }
                    if (floor(_obj_player.image_index) == 7)
                    {
                        depth = -9
                        x = _obj_player.x + _obj_player.xscale * 5
                        y = _obj_player.y
                    }
                    check_grabbed_solid(_obj_player)
                }
                else
                {
                    x = _obj_player.x + _obj_player.xscale * 10
                    y = _obj_player.y
                    check_grabbed_solid(_obj_player)
                }
            }
            else
            {
                depth = -7
                x = _obj_player.x
                y = _obj_player.y - 40
            }
        }
        if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) >= (_obj_player.image_number - 1))
        {
            lag = 5
            hitLag = lag
            hitX = x
            hitY = y
            _obj_player.hitLag = lag
            _obj_player.hitX = _obj_player.x
            _obj_player.hitY = _obj_player.y
            instance_create(_obj_player.x, _obj_player.y, obj_parryeffect)
            alarm[3] = 3
            if (elitehit > 0)
                elitehit--
            mach3destroy = 1
            state = (139 << 0)
            image_xscale = (-_obj_player.xscale)
            explodeInstant = true
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
            with (_obj_player)
            {
                if (state != (63 << 0))
                {
                    tauntstoredmovespeed = movespeed
                    tauntstoredsprite = sprite_index
                    tauntstoredstate = state
                    tauntstoredvsp = vsp
                }
                state = (63 << 0)
                other.hithsp = (-other.image_xscale) * 8
                other.hitvsp = -11
            }
        }
        if (_obj_player.state == (81 << 0) && _obj_player.sprite_index == _obj_player.spr_swingding)
        {
            if (floor(_obj_player.image_index) == 0)
            {
                depth = -9
                x = _obj_player.x + _obj_player.xscale * 25
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 1)
            {
                depth = -9
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 2)
            {
                depth = -9
                x = _obj_player.x + _obj_player.xscale * -25
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 3)
            {
                depth = 0
                x = _obj_player.x + _obj_player.xscale * -50
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 4)
            {
                depth = 0
                x = _obj_player.x + _obj_player.xscale * -25
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 5)
            {
                depth = 0
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 6)
            {
                depth = 0
                x = _obj_player.x + _obj_player.xscale * 25
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 7)
            {
                depth = 0
                x = _obj_player.x + _obj_player.xscale * 50
                y = _obj_player.y
            }
        }
        if (state != (6 << 0) || _obj_player.state != (81 << 0))
        {
            check_grabbed_solid(_obj_player)
            if (state == (139 << 0))
            {
                hitX = x
                hitY = y
            }
        }
    }
    if pepperman_grab
    {
        var _player = (grabbedby == 1 ? obj_player1.id : obj_player2.id)
        image_xscale = _player.xscale
        if (!thrown)
        {
            x = _player.x
            y = _player.y - 60
        }
        if (_player.input_check("attack") && (!_player.input_check("up")))
        {
            alarm[1] = 5
            thrown = true
            x = _player.x
            y = _player.y - 10
            state = (140 << 0)
            hsp = image_xscale * 30
            vsp = -6
            _player.sprite_index = spr_pepperman_throw
            _player.image_index = 0
            _player.pepperman_grabID = -4
        }
        if (_player.input_check("attack") && _player.input_check("up"))
        {
            alarm[1] = 5
            thrown = true
            x = _player.x
            y = _player.y - 10
            check_grabbed_solid(_player)
            state = (140 << 0)
            hsp = image_xscale * 2
            vsp = -20
            _player.sprite_index = spr_pepperman_throw
            _player.image_index = 0
            _player.pepperman_grabID = -4
        }
        if (_player.state != (2 << 0) && _player.state != (94 << 0))
        {
            _player.pepperman_grabID = -4
            state = (140 << 0)
            pepperman_grab = 0
        }
    }
    sprite_index = stunfallspr
    image_speed = 0.35
    return;
}

function check_grabbed_solid(argument0) //check_grabbed_solid
{
    if instakilled
        return;
    if (instance_exists(argument0) && argument0.sprite_index == spr_playerN_piledriver)
        return;
    if (((!(place_meeting(x, y, obj_destructibles))) || (place_meeting(x, y, obj_onewaybigblock) && collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4)) && (scr_solid(x, y) || collision_line(x, y, argument0.x, argument0.y, obj_solid, false, true) != -4))
    {
        var _dist = abs(x - obj_player1.x)
        x = argument0.x
        y = argument0.y
        if (!(scr_solid((x + argument0.xscale), y)))
        {
            var i = 0
            while (!(scr_solid((x + argument0.xscale), y)))
            {
                x += argument0.xscale
                i++
                if (i > _dist)
                    break
            }
            if scr_solid(x, y)
            {
                i = 0
                while scr_solid(x, y)
                {
                    x -= argument0.xscale
                    i++
                    if (i > _dist)
                        break
                }
            }
        }
    }
}

