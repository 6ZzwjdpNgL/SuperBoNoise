if (hurted == 0 && other.grounded == false && state != (86 << 0) && state != (149 << 0))
{
    instance_destroy(other)
    instance_create(x, y, obj_canonexplosion)
}
