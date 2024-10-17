if (state == (6 << 0))
    scr_enemy_grabbed()
else if (state == (45 << 0))
    scr_enemy_lungeattack()
else if (state == (268 << 0))
    scr_enemy_secret()
scr_squash()
if (state != (140 << 0) && state != (139 << 0))
    linethrown = false
if (state == (140 << 0) && (!thrown))
    linethrown = false
if (object_index != obj_pizzaball && (place_meeting((x + 1), y, obj_spike) || place_meeting((x - 1), y, obj_spike) || place_meeting(x, (y + 1), obj_spike) || place_meeting(x, (y - 1), obj_spike)))
    instance_destroy()
if (state != (6 << 0) && state != (156 << 0) && object_index != obj_pepbat && object_index != obj_ghoul && object_index != obj_fakesanta && use_collision)
    scr_collide()
if (invtime > 0)
    invtime--
if (sprite_index == walkspr && hsp != 0 && floor(image_index) == (image_number - 1) && object_index != obj_ghoul && object_index != obj_bobby)
    create_particle((x - image_xscale * 20), (y + 43), (1 << 0), 0)
if (state == (136 << 0))
    image_speed = 0.35 + global.baddiespeed * 0.05
else if (state != (130 << 0))
    image_speed = 0.35
if (dodgebuffer > 0)
    dodgebuffer--
with (instance_nearest(x, y, obj_player1))
{
    if (state == (86 << 0))
    {
        other.stunned = 0
        if (other.state != (131 << 0) && (!other.provoked) && other.bombreset > 0)
        {
            other.bombreset = 0
            other.provoked = 1
        }
        other.scaredbuffer = 0
    }
    else if (other.state != (131 << 0))
        other.provoked = 0
}
if (y > (room_height + 100))
    instance_destroy()
if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
    instance_destroy()
