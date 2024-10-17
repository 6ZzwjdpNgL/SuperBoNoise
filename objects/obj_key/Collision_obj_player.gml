if (room == rm_blank)
    return;
if global.key_inv
    return;
with (other)
{
    if (state != (53 << 0) && state != (188 << 0) && state != (18 << 0) && state != (49 << 0) && state != (23 << 0) && state != (35 << 0) && state != (26 << 0) && state != (50 << 0) && state != (40 << 0) && state != (109 << 0) && state != (51 << 0))
    {
        instance_destroy(other)
        global.key_inv = 1
        key_particles = 1
        alarm[7] = 30
        event_play_oneshot("event:/SFX/misc/collecttoppin")
        state = (92 << 0)
        image_index = 0
        global.heattime = 60
    }
}
