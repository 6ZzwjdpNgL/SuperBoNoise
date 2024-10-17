if (grounded && grabbed == 0 && (!ratgrabbed))
    thrown = false
if (!ratgrabbed)
    state = (2 << 0)
if (ratgrabbed && ratplayerid.ratgrabbedID != id)
    ratgrabbed = 0
if (grabbed == 1 && (!ratgrabbed))
{
    image_xscale = (-playerid.xscale)
    grav = 0
    playerid.baddiegrabbedID = id
    if (playerid.state == (8 << 0) || playerid.state == (57 << 0) || playerid.state == (81 << 0) || playerid.state == (76 << 0) || playerid.state == (77 << 0) || playerid.state == (22 << 0))
    {
        grav = 0
        grounded = false
        x = playerid.x
        if (playerid.sprite_index != spr_null && playerid.state != (8 << 0))
            y = playerid.y - 60
        else if (floor(playerid.image_index) == 0)
            y = playerid.y - 20
        else if (floor(playerid.image_index) == 1)
            y = playerid.y - 30
        else if (floor(playerid.image_index) == 2)
            y = playerid.y - 40
        else if (floor(playerid.image_index) == 3)
            y = playerid.y - 50
        image_xscale = (-playerid.xscale)
    }
    with (playerid)
    {
        move = (-input_check_pressed("left")) + input_check_pressed("right")
        if (!((state == (8 << 0) || state == (81 << 0) || state == (57 << 0) || state == (76 << 0) || state == (77 << 0) || state == (22 << 0) || state == (82 << 0) || state == (78 << 0) || state == (83 << 0) || state == (84 << 0) || state == (85 << 0))))
        {
            other.grav = 0.5
            other.x = x
            other.y = y
            other.grabbed = 0
        }
    }
    hsp = 0
    if (playerid.state == (8 << 0))
    {
        x = playerid.x + playerid.xscale * 50
        y = playerid.y
    }
    if (playerid.state == (81 << 0) && playerid.sprite_index == playerid.spr_swingding)
    {
        if (floor(playerid.image_index) == 0)
        {
            depth = -9
            x = playerid.x + playerid.xscale * 25
            y = playerid.y
        }
        if (floor(playerid.image_index) == 1)
        {
            depth = -9
            x = playerid.x
            y = playerid.y
        }
        if (floor(playerid.image_index) == 2)
        {
            depth = -9
            x = playerid.x + playerid.xscale * -25
            y = playerid.y
        }
        if (floor(playerid.image_index) == 3)
        {
            depth = 0
            x = playerid.x + playerid.xscale * -50
            y = playerid.y
        }
        if (floor(playerid.image_index) == 4)
        {
            depth = 0
            x = playerid.x + playerid.xscale * -25
            y = playerid.y
        }
        if (floor(playerid.image_index) == 5)
        {
            depth = 0
            x = playerid.x
            y = playerid.y
        }
        if (floor(playerid.image_index) == 6)
        {
            depth = 0
            x = playerid.x + playerid.xscale * 25
            y = playerid.y
        }
        if (floor(playerid.image_index) == 7)
        {
            depth = 0
            x = playerid.x + playerid.xscale * 50
            y = playerid.y
        }
    }
    if (playerid.state == (85 << 0))
    {
        grav = 0.5
        instance_create(x, (y + 20), obj_bumpeffect)
        grabbed = 0
        thrown = true
        x = playerid.x
        y = playerid.y
        if (playerid.sprite_index == spr_player_shoulder)
            vsp = 15
        if (playerid.sprite_index == spr_player_diagonaldownthrow)
        {
            hsp = (-image_xscale) * 10
            vsp = 15
        }
        if (playerid.sprite_index == spr_player_diagonalupthrow)
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
    if (playerid.state == (76 << 0))
    {
        grav = 0.5
        grabbed = 0
        thrown = true
        x = playerid.x
        y = playerid.y
        hsp = (-image_xscale) * 10
        vsp = -10
    }
    if (playerid.state == (84 << 0))
    {
        instance_create((x + (-playerid.xscale) * 15), (y - 50), obj_bumpeffect)
        grav = 0.5
        thrown = true
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
    if (playerid.state == (22 << 0))
    {
        x = playerid.x + playerid.xscale * 15
        y = playerid.y
    }
    if (playerid.state == (78 << 0))
    {
        if (playerid.character == "P")
        {
            if (floor(playerid.image_index) == 0)
            {
                depth = 0
                x = playerid.x + playerid.xscale * 10
                y = playerid.y
            }
            if (floor(playerid.image_index) == 1)
            {
                depth = 0
                x = playerid.x + playerid.xscale * 5
                y = playerid.y
            }
            if (floor(playerid.image_index) == 2)
            {
                depth = 0
                x = playerid.x
                y = playerid.y
            }
            if (floor(playerid.image_index) == 3)
            {
                depth = 0
                x = playerid.x + playerid.xscale * -5
                y = playerid.y
            }
            if (floor(playerid.image_index) == 4)
            {
                depth = 0
                x = playerid.x + playerid.xscale * -10
                y = playerid.y
            }
            if (floor(playerid.image_index) == 5)
            {
                depth = -9
                x = playerid.x + playerid.xscale * -5
                y = playerid.y
            }
            if (floor(playerid.image_index) == 6)
            {
                depth = -9
                x = playerid.x
                y = playerid.y
            }
            if (floor(playerid.image_index) == 7)
            {
                depth = -9
                x = playerid.x + playerid.xscale * 5
                y = playerid.y
            }
        }
        else
        {
            depth = -7
            x = playerid.x
            y = playerid.y - 40
        }
        if (playerid.sprite_index == playerid.spr_piledriverland)
        {
            instance_create(x, y, obj_slapstar)
            instance_create(x, y, obj_baddiegibs)
            grabbed = 0
            thrown = true
            x = playerid.x
            y = playerid.y
            grav = 0.5
            hsp = (-image_xscale) * 10
            vsp = -10
        }
    }
}
if (vsp > 0 && grounded && (!(place_meeting(x, y, obj_spike))))
    hsp = 0
if (grabbed == 0 && ratgrabbed == 0 && use_collision)
    scr_collide()
if (place_meeting(x, y, obj_swordhitbox) && thrown == false)
{
    grabbed = 0
    thrown = true
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
    if scr_solid(x, y)
    {
        x = playerid.x
        y = playerid.y
    }
    grav = 0.5
    -2.alarm[8] = 60
    -2.alarm[7] = 120
    with (playerid)
    {
        move = input_check("right") - input_check("left")
        if (sprite_index == spr_uppercutfinishingblow)
            other.vsp = -25
        else
        {
            other.hsp = xscale * 15
            other.vsp = -6
        }
    }
}
if thrown
{
    var num = instance_place_list((x + hsp), y, obj_destructibles, global.instancelist, 0)
    for (var i = 0; i < num; i++)
        instance_destroy(ds_list_find_value(global.instancelist, i))
    ds_list_clear(global.instancelist)
}
