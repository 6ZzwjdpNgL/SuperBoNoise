function state_player_ratmounttumble() //state_player_ratmounttumble
{
    hsp = xscale * movespeed
    move = input_check("right") - input_check("left")
    sprite_index = spr_player_ratmountwalljump
    image_speed = (-abs(movespeed)) / 15
    if (!input_check("attack"))
        movespeed = approach(movespeed, 0, 1)
    if (scr_slope() && hsp != 0)
        scr_playerAddSlopeMomentum(0.25, 0.25)
    if (abs(hsp) <= 2)
        state = (193 << 0)
    if ((place_meeting((x + hsp), y, obj_solid) && (!(scr_solid_slope((x + hsp), y))) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        state = (198 << 0)
        vsp = -5
        movespeed = 3
    }
    if input_check_pressed("jump")
        input_buffer_jump = 0
    if ((!jumpstop) && vsp < 0.5 && (!input_check("jump")))
    {
        vsp /= 10
        jumpstop = 1
    }
    if (input_check_pressed("jump") && brick && input_check("up"))
    {
        state = (199 << 0)
        sprite_index = spr_lonegustavo_jumpstart
        image_index = 0
        image_speed = 0.35
        gustavokicktimer = 5
        brick = 0
        movespeed = hsp
        with (instance_create(x, (y + 50), obj_ratmountgroundpound))
        {
            image_xscale = other.xscale
            image_index = 0
        }
    }
    if (input_buffer_jump < 8 && can_jump)
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        event_play_oneshot("event:/SFX/bo/jump", x, y)
        vsp = -11
        jumpstop = 0
    }
}

