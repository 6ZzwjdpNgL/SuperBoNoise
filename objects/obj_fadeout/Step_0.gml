if (fadealpha > 1)
{
    fadein = 1
    if instance_exists(obj_player1)
    {
        if (custom_level == 0)
        {
            with (obj_player1)
            {
                if place_meeting(x, y, obj_goldendoor)
                    game_restart()
            }
            if (room != obj_player1.targetRoom || roomreset)
            {
                scr_room_goto(obj_player1.targetRoom)
                with (obj_player1)
                {
                    if (state == (9 << 0) || state == (154 << 0))
                    {
                        visible = true
                        state = (2 << 0)
                    }
                }
            }
            if (global.coop == true)
            {
                if (room != obj_player2.targetRoom || roomreset)
                    scr_room_goto(obj_player1.targetRoom)
                with (obj_player1)
                {
                    if (state == (9 << 0))
                        state = (2 << 0)
                }
                with (obj_player2)
                {
                    if instance_exists(obj_coopplayerfollow)
                        state = (188 << 0)
                }
            }
        }
    }
}
if (fadein == 0)
    fadealpha += 0.1
else if (fadein == 1)
    fadealpha -= 0.1
if instance_exists(obj_player1)
{
    with (obj_player1)
    {
        if (other.fadein == 1 && (obj_player1.state == (114 << 0) || obj_player1.state == (100 << 0)) && (sprite_index == spr_victory || place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
        {
            state = (97 << 0)
            image_index = 0
            if (global.coop == true)
            {
                obj_player2.state = (97 << 0)
                obj_player2.image_index = 0
            }
        }
        if (other.fadein == 1 && obj_player1.state == (114 << 0) && (obj_player1.sprite_index == spr_downpizzabox || obj_player1.sprite_index == spr_uppizzabox))
        {
            state = (103 << 0)
            if (global.coop == true)
                obj_player2.state = (103 << 0)
        }
    }
    if instance_exists(obj_player2)
    {
        with (obj_player2)
        {
            if (other.fadein == 1 && (obj_player2.state == (114 << 0) || obj_player2.state == (100 << 0)) && (place_meeting(x, y, obj_door) || place_meeting(x, y, obj_startgate)))
            {
                state = (97 << 0)
                image_index = 0
                if (global.coop == true)
                {
                    obj_player1.state = (97 << 0)
                    obj_player1.image_index = 0
                }
            }
            if (other.fadein == 1 && obj_player2.state == (114 << 0) && (obj_player2.sprite_index == spr_downpizzabox || obj_player2.sprite_index == spr_uppizzabox))
            {
                state = (103 << 0)
                if (global.coop == true)
                    obj_player1.state = (103 << 0)
            }
        }
    }
    with (obj_player2)
    {
        if instance_exists(obj_coopplayerfollow)
            state = (188 << 0)
    }
}
if (fadein == 1 && fadealpha < 0)
    instance_destroy()
