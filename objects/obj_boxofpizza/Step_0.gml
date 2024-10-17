if global.horse
    return;
with (obj_player1)
{
    if (other.image_yscale == 1)
    {
        if (((input_check("down") && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other) && (state == (102 << 0) || character == "S" || character == "M" || state == (67 << 0) || (state == (7 << 0) && sprite_index == spr_dive))) || ((state == (104 << 0) || state == (110 << 0) || state == (113 << 0) || (state == (7 << 0) && sprite_index == spr_machroll)) && (!(place_meeting(x, (y + 1), obj_destructibles))) && place_meeting(x, (y + 1), other))) && (!instance_exists(obj_fadeout)) && state != (114 << 0) && state != (97 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            with (other)
            {
                event_user(0)
                sprite_index = spr_boxofpizza_top
            }
            other.depth = -10
            event_play_oneshot("event:/SFX/bo/box", x, y)
            obj_player1.box = 1
            obj_player2.box = 1
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            if (global.coop == true)
            {
                var _box = other.id
                with (obj_player1)
                {
                    x = _box.x
                    y = _box.y - 76
                }
                obj_player1.sprite_index = obj_player1.spr_downpizzabox
                obj_player1.image_index = 0
                obj_player1.state = (114 << 0)
                obj_player2.sprite_index = obj_player2.spr_downpizzabox
                obj_player2.image_index = 0
                if (obj_player2.state != (188 << 0))
                    obj_player2.state = (114 << 0)
            }
            else
            {
                sprite_index = spr_downpizzabox
                image_index = 0
                state = (114 << 0)
            }
        }
    }
    if (other.image_yscale == -1)
    {
        if (((input_check("up") && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 10), other) && (state == (2 << 0) || state == (60 << 0) || state == (94 << 0) || state == (105 << 0) || state == (106 << 0) || state == (123 << 0) || state == (101 << 0) || (state == (82 << 0) && sprite_index == spr_breakdanceuppercut))) || ((state == (99 << 0) || state == (125 << 0)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && place_meeting(x, (y - 1), other))) && (!instance_exists(obj_fadeout)) && state != (114 << 0) && state != (97 << 0))
        {
            obj_player1.lastroom = room
            obj_player2.lastroom = room
            event_play_oneshot("event:/SFX/bo/box", x, y)
            with (other)
            {
                event_user(0)
                sprite_index = spr_boxofpizza_top
            }
            other.depth = -10
            obj_player1.box = 1
            obj_player2.box = 1
            other.depth = -9
            mach2 = 0
            obj_camera.chargecamera = 0
            x = other.x
            y = other.y + 24
            obj_player1.targetDoor = other.targetDoor
            obj_player1.targetRoom = other.targetRoom
            obj_player2.targetDoor = other.targetDoor
            obj_player2.targetRoom = other.targetRoom
            obj_player1.vsp = 0
            obj_player2.vsp = 0
            if (global.coop == true)
            {
                _box = other.id
                with (obj_player1)
                {
                    x = _box.x
                    y = _box.y + 24
                }
                obj_player1.sprite_index = obj_player1.spr_uppizzabox
                obj_player1.image_index = 0
                obj_player1.state = (114 << 0)
                obj_player2.sprite_index = obj_player2.spr_uppizzabox
                obj_player2.image_index = 0
                if (obj_player2.state != (188 << 0))
                    obj_player2.state = (114 << 0)
            }
            else
            {
                sprite_index = spr_uppizzabox
                image_index = 0
                state = (114 << 0)
            }
        }
    }
}
if (place_meeting(x, (y + 1), obj_doorA) || place_meeting(x, (y - 1), obj_doorA))
    targetDoor = "A"
if (place_meeting(x, (y + 1), obj_doorB) || place_meeting(x, (y - 1), obj_doorB))
    targetDoor = "B"
if (place_meeting(x, (y + 1), obj_doorC) || place_meeting(x, (y - 1), obj_doorC))
    targetDoor = "C"
if (place_meeting(x, (y + 1), obj_doorD) || place_meeting(x, (y - 1), obj_doorD))
    targetDoor = "D"
if (place_meeting(x, (y + 1), obj_doorE) || place_meeting(x, (y - 1), obj_doorE))
    targetDoor = "E"
if (place_meeting(x, (y + 1), obj_doorF) || place_meeting(x, (y - 1), obj_doorF))
    targetDoor = "F"
