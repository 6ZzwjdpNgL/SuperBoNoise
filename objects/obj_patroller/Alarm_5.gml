if (patroltimer > 0)
{
    patroltimer--
    alarm[5] = 60
}
else
{
    patrolfound = 0
    state = (82 << 0)
    sprite_index = spr_patroller_alert
    image_index = 0
    self.scr_monster_activate()
}
