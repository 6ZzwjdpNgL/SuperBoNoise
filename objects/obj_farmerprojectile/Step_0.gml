x += hsp
y += vsp
var num = collision_line_list(x, y, xprevious, yprevious, obj_haystack, 0, 1, global.instancelist, 0)
if (num > 0)
{
    var i = 0
    while (i < num)
    {
        var b = ds_list_find_value(global.instancelist, i)
        var t = 0
        with (b)
        {
            if (state == (2 << 0))
            {
                state = (10 << 0)
                if b.func(other.id, other)
                    t = 1
                else
                {
                    state = (2 << 0)
                    t = 0
                }
            }
        }
        if t
        {
            instance_destroy()
            break
        }
        else
            i++
    }
}
ds_list_clear(global.instancelist)
