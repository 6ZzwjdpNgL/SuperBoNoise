with (other)
{
    if input_check_pressed("up")
    {
        if (state == (2 << 0))
            state = (193 << 0)
        else if (state == (193 << 0))
            state = (2 << 0)
    }
}
