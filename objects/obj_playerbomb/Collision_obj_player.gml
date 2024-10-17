if ((!kick) && countdown <= 0)
{
    other.vsp = -14
    other.jumpstop = 1
    if (other.state == (94 << 0))
    {
        other.sprite_index = other.spr_stompprep
        other.image_index = 0
        other.jumpAnim = 1
    }
    countdown = 10
    create_particle(x, y, (5 << 0), 0)
}
