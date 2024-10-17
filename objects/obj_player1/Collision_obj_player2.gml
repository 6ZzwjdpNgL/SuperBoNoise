if (other.cutscene == 0 && other.state != (148 << 0) && state != (148 << 0) && other.state != (188 << 0) && state != (188 << 0))
{
    if (hurted == 0 && other.hurted == 0 && fightballadvantage == 1 && (state == (44 << 0) || state == (82 << 0)) && (other.state == (44 << 0) || other.state == (82 << 0)))
    {
        if (object_index == obj_player1)
        {
            obj_player1.state = (123 << 0)
            obj_player2.state = (6 << 0)
            obj_player2.xscale = xscale
            obj_player1.depth = -7
            obj_player2.depth = -6
        }
        if (object_index == obj_player2)
        {
            obj_player2.state = (123 << 0)
            obj_player1.state = (6 << 0)
            obj_player1.xscale = xscale
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        obj_player1.image_index = 0
        obj_player2.image_index = 0
        obj_player1.sprite_index = obj_player1.spr_fightball
        obj_player2.sprite_index = obj_player2.spr_fightball
        obj_player1.fightball = 1
        obj_player2.fightball = 1
    }
    with (obj_player2)
    {
        if (state == (44 << 0) && other.hurted == 0 && other.state != (109 << 0) && other.state != (40 << 0) && other.state != (49 << 0) && other.state != (7 << 0) && other.state != (11 << 0) && other.state != (53 << 0) && other.cutscene == 0 && other.hurted == 0 && hurted == 0 && (!((other.state == (44 << 0) || other.state == (82 << 0)))))
        {
            movespeed = 0
            image_index = 0
            sprite_index = spr_haulingstart
            baddiegrabbedID = other.id
            state = (81 << 0)
            other.state = (6 << 0)
            obj_player1.depth = -6
            obj_player2.depth = -7
        }
        if (state == (110 << 0) && other.hurted == 0 && other.state != (61 << 0) && other.state != (109 << 0) && hurted == 0)
        {
            scr_changetoppings()
            obj_player1.depth = -6
            obj_player2.depth = -7
            obj_player1.state = (61 << 0)
            obj_player1.sprite_index = obj_player1.spr_squished
            obj_player1.image_index = 0
        }
        if (other.state == (82 << 0) && hurted == 0 && other.hurted == 0 && (!((state == (44 << 0) || state == (82 << 0)))))
        {
            xscale = (-other.xscale)
            with (other)
                scr_pummel()
            obj_player1.depth = -7
            obj_player2.depth = -6
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
            x = obj_player1.x
            y = obj_player1.y
            alarm[8] = 60
            alarm[7] = 120
            movespeed = 15
            vsp = -6
            sprite_index = spr_hurt
        }
    }
}
