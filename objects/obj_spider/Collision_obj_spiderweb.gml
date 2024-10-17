if ((!other.active) && active && other.id == webID)
{
    other.active = 1
    active = 0
    create_particle(other.x, other.y, (9 << 0), 0)
}
