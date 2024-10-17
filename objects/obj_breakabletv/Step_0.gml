if place_meeting(x, y, obj_player1)
{
    with (obj_player1)
    {
        if (state == (105 << 0) || state == (106 << 0))
        {
            state = (8 << 0)
            sprite_index = spr_null
            image_index = 0
            hsp = 0
            movespeed = 0
        }
        if (state == (123 << 0))
        {
            hsp = (-xscale) * 3
            state = (108 << 0)
            mach2 = 0
            image_index = 0
            vsp = -5
            instance_destroy(other)
        }
    }
}
if (grabbed == 1)
{
    image_xscale = (-obj_player1.xscale)
    grav = 0
    obj_player1.baddiegrabbedID = id
    if (obj_player1.state == (57 << 0) || obj_player1.state == (81 << 0) || obj_player1.state == (76 << 0) || obj_player1.state == (77 << 0) || obj_player1.state == (22 << 0))
    {
        grounded = false
        x = obj_player1.x
        if (obj_player1.sprite_index != spr_null)
            y = obj_player1.y - 40
        else if (floor(obj_player1.image_index) == 0)
            y = obj_player1.y
        else if (floor(obj_player1.image_index) == 1)
            y = obj_player1.y - 10
        else if (floor(obj_player1.image_index) == 2)
            y = obj_player1.y - 20
        else if (floor(obj_player1.image_index) == 3)
            y = obj_player1.y - 30
        image_xscale = (-obj_player1.xscale)
    }
    with (obj_player1)
    {
        move = input_check_pressed("left") + input_check_pressed("right")
        if (!((state == (81 << 0) || state == (57 << 0) || state == (76 << 0) || state == (77 << 0) || state == (22 << 0) || state == (82 << 0) || state == (78 << 0) || state == (83 << 0) || state == (84 << 0) || state == (85 << 0))))
        {
            other.x = x
            other.y = y
            other.grabbed = 0
        }
    }
    hsp = 0
    if (obj_player1.state == (82 << 0))
    {
        instance_create((x + obj_player1.xscale * 30), y, obj_bumpeffect)
        grabbed = 0
        grav = 0.5
        x = obj_player1.x
        vsp = 0
        y = obj_player1.y - 5
        thrown = true
        hsp = (-image_xscale) * 25
        grav = 0
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    if (obj_player1.state == (85 << 0))
    {
        grav = 0.5
        instance_create(x, (y + 20), obj_bumpeffect)
        grabbed = 0
        thrown = true
        x = obj_player1.x
        y = obj_player1.y
        if (obj_player1.sprite_index == spr_player_shoulder)
            vsp = 15
        if (obj_player1.sprite_index == spr_player_diagonaldownthrow)
        {
            hsp = (-image_xscale) * 10
            vsp = 15
        }
        if (obj_player1.sprite_index == spr_player_diagonalupthrow)
        {
            hsp = (-image_xscale) * 10
            vsp = -15
        }
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    if (obj_player1.state == (76 << 0))
    {
        grav = 0.5
        grabbed = 0
        thrown = true
        x = obj_player1.x
        y = obj_player1.y
        hsp = (-image_xscale) * 10
        vsp = -10
    }
    if (obj_player1.state == (84 << 0))
    {
        instance_create((x + (-obj_player1.xscale) * 15), (y - 50), obj_bumpeffect)
        grav = 0.5
        thrown = true
        x = obj_player1.x
        y = obj_player1.y
        hsp = (-image_xscale) * 2
        grabbed = 0
        vsp = -20
        instance_create(x, y, obj_slapstar)
        instance_create(x, y, obj_baddiegibs)
        flash = 1
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = 3 / room_speed
        }
    }
    if (obj_player1.state == (22 << 0))
    {
        x = obj_player1.x + obj_player1.xscale * 15
        y = obj_player1.y
    }
    if (obj_player1.state == (78 << 0))
    {
        if (obj_player1.character == "P")
        {
            if (floor(obj_player1.image_index) == 0)
            {
                depth = 0
                x = obj_player1.x + obj_player1.xscale * 10
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 1)
            {
                depth = 0
                x = obj_player1.x + obj_player1.xscale * 5
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 2)
            {
                depth = 0
                x = obj_player1.x
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 3)
            {
                depth = 0
                x = obj_player1.x + obj_player1.xscale * -5
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 4)
            {
                depth = 0
                x = obj_player1.x + obj_player1.xscale * -10
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 5)
            {
                depth = -9
                x = obj_player1.x + obj_player1.xscale * -5
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 6)
            {
                depth = -9
                x = obj_player1.x
                y = obj_player1.y
            }
            if (floor(obj_player1.image_index) == 7)
            {
                depth = -9
                x = obj_player1.x + obj_player1.xscale * 5
                y = obj_player1.y
            }
        }
        else
        {
            depth = -7
            x = obj_player1.x
            y = obj_player1.y - 40
        }
        if (obj_player1.sprite_index == obj_player1.spr_piledriverland)
        {
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            grabbed = 0
            thrown = true
            x = obj_player1.x
            y = obj_player1.y
            grav = 0.5
            hsp = (-image_xscale) * 10
            vsp = -10
        }
    }
}
if (vsp > 0 && grounded)
    hsp = 0
if (place_meeting((x + hsp), y, obj_solid) && thrown == true)
    instance_destroy()
if (grounded == true && thrown == true && vsp > 0)
    instance_destroy()
if (grabbed == 0)
    scr_collide()
