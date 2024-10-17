if (!global.option_secret_cathud)
{
    instance_destroy()
    return;
}
for (var i = 0; i < maxcats; i++)
    fmod_event_stop(purrsnd[i], true)
cats = []
var _catno = 0
var _ecount = irandom_range(3, 5)
var _etaken = []
i = 0
while (i < _ecount)
{
    if (_catno >= maxcats)
        break
    else
    {
        var ii = irandom_range(0, edgecount)
        while array_contains(_etaken, ii)
            ii = irandom_range(0, edgecount)
        array_push(_etaken, ii)
        var per = i / _ecount
        var _x = 760 * per + 150
        var _ec = new cat(_catno, spr_cathud_edges, ii, _x, obj_gameFrame.defaultheight, (0 << 0), (0 << 0))
        array_push(cats, _ec)
        _catno++
        i++
    }
}
