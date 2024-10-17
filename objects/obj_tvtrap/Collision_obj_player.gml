if (other.instakillmove || other.state == (44 << 0))
{
    with (other)
    {
        scr_pummel()
        instance_destroy(other)
    }
}
