function state_player_grabbed() //state_player_grabbed
{
    var _obj_player = (object_index == obj_player2 ? obj_player1 : obj_player2)
    if (fightball == 0)
        xscale = (-_obj_player.xscale)
    _obj_player.baddiegrabbedID = id
    if (_obj_player.state == (123 << 0) && fightball == 1)
    {
        x = _obj_player.x
        y = _obj_player.y
    }
    if (_obj_player.state == (57 << 0) || _obj_player.state == (81 << 0) || _obj_player.state == (76 << 0) || _obj_player.state == (77 << 0) || _obj_player.state == (22 << 0))
    {
        x = _obj_player.x
        if (_obj_player.sprite_index != _obj_player.spr_haulingstart)
            y = _obj_player.y - 40
        else if (floor(_obj_player.image_index) == 0)
            y = _obj_player.y
        else if (floor(_obj_player.image_index) == 1)
            y = _obj_player.y - 10
        else if (floor(_obj_player.image_index) == 2)
            y = _obj_player.y - 20
        else if (floor(_obj_player.image_index) == 3)
            y = _obj_player.y - 30
        xscale = (-_obj_player.xscale)
    }
    with (_obj_player)
    {
        move = (-input_check_pressed("left")) + input_check_pressed("right")
        if (input_check("slap") && sprite_index == spr_grab)
        {
            global.hit += 1
            if (other.object_index == obj_pizzaball)
                global.golfhit += 1
            image_index = 0
            sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4)
            instance_create(other.x, other.y, obj_slapstar)
            instance_create(other.x, other.y, obj_baddiegibs)
            other.flash = 1
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = 3 / room_speed
            }
        }
        if (!((state == (81 << 0) || (state == (123 << 0) && fightball == 1) || state == (193 << 0) || state == (195 << 0) || state == (194 << 0) || state == (196 << 0) || state == (8 << 0) || state == (57 << 0) || state == (76 << 0) || state == (77 << 0) || state == (22 << 0) || state == (82 << 0) || state == (78 << 0) || state == (83 << 0) || state == (84 << 0) || state == (85 << 0))))
        {
            baddiegrabbedID = obj_null
            other.x = _obj_player.x
            other.y = _obj_player.y
            other.state = (109 << 0)
            -2.alarm[8] = 60
            -2.alarm[7] = 120
            other.image_index = 0
        }
    }
    if (_obj_player.state == (193 << 0) || _obj_player.state == (194 << 0))
    {
        visible = false
        x = _obj_player.x
        y = _obj_player.y
    }
    if (_obj_player.state == (22 << 0))
    {
        x = _obj_player.x + _obj_player.xscale * 20
        y = _obj_player.y
    }
    if (_obj_player.state == (8 << 0) && _obj_player.image_index < 5)
    {
        x = _obj_player.x + _obj_player.xscale * 60
        y = _obj_player.y + 14
    }
    if place_meeting(x, y, obj_swordhitbox)
    {
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
        state = (109 << 0)
        if (scr_solid(x, y) || collision_line(x, y, _obj_player.x, _obj_player.y, obj_solid, false, true) != -4)
        {
            x = _obj_player.x
            y = _obj_player.y
        }
        self.alarm[8] = 60
        self.alarm[7] = 120
        with (_obj_player)
        {
            move = input_check("right") - input_check("left")
            if (sprite_index == spr_uppercutfinishingblow)
            {
                other.movespeed = 0
                other.vsp = -25
            }
            else
            {
                other.movespeed = 15
                other.vsp = -6
            }
        }
    }
    if (_obj_player.state == (78 << 0) && _obj_player.sprite_index == _obj_player.spr_piledriver)
    {
        if (_obj_player.character == "P" && _obj_player.ispeppino)
        {
            if (floor(_obj_player.image_index) == 0)
            {
                x = _obj_player.x + _obj_player.xscale * 10
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 1)
            {
                x = _obj_player.x + _obj_player.xscale * 5
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 2)
            {
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 3)
            {
                x = _obj_player.x + _obj_player.xscale * -5
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 4)
            {
                x = _obj_player.x + _obj_player.xscale * -10
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 5)
            {
                x = _obj_player.x + _obj_player.xscale * -5
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 6)
            {
                x = _obj_player.x
                y = _obj_player.y
            }
            if (floor(_obj_player.image_index) == 7)
            {
                x = _obj_player.x + _obj_player.xscale * 5
                y = _obj_player.y
            }
        }
        else
        {
            x = _obj_player.x
            y = _obj_player.y - 40
        }
    }
    if (_obj_player.state == (81 << 0) && _obj_player.sprite_index == _obj_player.spr_swingding)
    {
        if (floor(_obj_player.image_index) == 0)
        {
            x = _obj_player.x + _obj_player.xscale * 25
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 1)
        {
            x = _obj_player.x
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 2)
        {
            x = _obj_player.x + _obj_player.xscale * -25
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 3)
        {
            x = _obj_player.x + _obj_player.xscale * -50
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 4)
        {
            x = _obj_player.x + _obj_player.xscale * -25
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 5)
        {
            x = _obj_player.x
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 6)
        {
            x = _obj_player.x + _obj_player.xscale * 25
            y = _obj_player.y
        }
        if (floor(_obj_player.image_index) == 7)
        {
            x = _obj_player.x + _obj_player.xscale * 50
            y = _obj_player.y
        }
    }
    if (_obj_player.sprite_index == _obj_player.spr_piledriverland && floor(_obj_player.image_index) == (_obj_player.image_number - 1))
    {
        with (_obj_player)
        {
            state = (94 << 0)
            vsp = -8
            sprite_index = spr_machfreefall
        }
        thrown = true
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        x = _obj_player.x
        y = _obj_player.y
        state = (109 << 0)
        hithsp = (-image_xscale) * 10
        hitvsp = -10
        -2.alarm[8] = 60
        -2.alarm[7] = 120
    }
    if (_obj_player.state != (123 << 0))
        sprite_index = spr_hurt
    else
    {
        sprite_index = spr_fightball
        image_index = _obj_player.image_index
    }
    image_speed = 0.4
    return;
}

