var player = other.id
var kill = false
if (abs(player.hsp) > killspeed || player.instakillmove || player.state == (82 << 0) || player.state == (44 << 0))
    kill = true
else if (player.y < y && player.vsp > 1)
{
    kill = true
    with (player)
    {
        vsp = -8
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
}
if kill
    instance_destroy()
