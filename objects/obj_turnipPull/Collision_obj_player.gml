if (other.state == (44 << 0))
{
    if (other.move == 0)
    {
        other.hsp = 0
        other.state = (2 << 0)
        if (!is_undefined(onPick))
            self.onPick()
        instance_destroy()
    }
}
