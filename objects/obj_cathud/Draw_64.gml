var hide = false
with (obj_player1)
{
    if ((state == (100 << 0) && place_meeting(x, y, obj_startgate)) || state == (91 << 0))
        hide = true
}
if (hide || (!global.option_hud) || (instance_exists(obj_pauseNew) && obj_pauseNew.state == (0 << 0)) || room == rm_evilleafyishere || instance_exists(obj_titlecard) || instance_exists(obj_levelselect) || instance_exists(obj_technicaldifficulty) || instance_exists(obj_option) || instance_exists(obj_optionNew) || instance_exists(obj_rank) || instance_exists(obj_mainmenu) || instance_exists(obj_endlevelfade))
{
    show = false
    return;
}
show = true
var a = 1
with (obj_fadeout)
    a = 1 - fadealpha
for (var i = 0; i < array_length(cats); i++)
{
    var c = cats[i]
    c.draw(a)
}
