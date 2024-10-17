if (place_meeting(x, (y - 1), obj_player1) || place_meeting((x + 16), (y - 1), obj_player1) || place_meeting((x - 16), (y - 1), obj_player1))
{
    with (obj_player1)
    {
        if (((place_meeting(x, (y + 1), obj_ladder) && (!(place_meeting((other.x + 16), (y + 1), obj_solid))) && (state == (102 << 0) || state == (110 << 0))) || (state == (110 << 0) && (place_meeting((x - 16), (y + vsp), obj_ladder) || place_meeting((x + 16), (y + vsp), obj_ladder)))) && input_check("down") && place_meeting(x, (y + 1), obj_platform))
        {
            if (state == (110 << 0))
            {
                flash = 1
                ladderfast = 1
            }
            y += 5
            state = (95 << 0)
            x = other.x + 16
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
        if (input_check("down") && place_meeting(x, (y + 1), obj_ladder) && (!(place_meeting((other.x + 16), (y + 1), obj_solid))) && state == (262 << 0) && place_meeting(x, (y + 1), obj_platform))
        {
            state = (263 << 0)
            if (brick == 1)
            {
                with (instance_create(x, y, obj_brickcomeback))
                {
                    wait = 1
                    instance_create(x, y, obj_genericpoofeffect)
                }
            }
            y += 5
            brick = 0
            x = other.x + 16
            y = floor(y)
            if ((y % 2) == 1)
                y -= 1
        }
    }
}
if instance_exists(obj_player2)
{
    if place_meeting(x, (y - 2), obj_player2)
    {
        with (obj_player2)
        {
            if (place_meeting(x, (y + 2), obj_ladder) && (!(place_meeting((other.x + 16), (y + 2), obj_solid))) && input_check("down") && (state == (102 << 0) || (character == "S" && (state == (2 << 0) || state == (105 << 0)))) && place_meeting(x, (y + 1), obj_platform))
            {
                y += 5
                state = (95 << 0)
                x = other.x + 16
                y = floor(y)
                if ((y % 2) == 1)
                    y -= 1
            }
        }
    }
}
