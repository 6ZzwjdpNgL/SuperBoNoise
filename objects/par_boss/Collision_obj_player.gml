var _player = other.id
if ds_map_empty(player_hurtstates)
    return;
if (!attacking)
{
    if (!invincible)
    {
        var s = ds_map_find_value(player_hurtstates, _player.state)
        if (!is_undefined(s))
        {
            lastplayerid = _player
            invincible = 1
            inv_timer = inv_max
            self.boss_hurt(s, _player)
        }
    }
}
else
{
    var sb = ds_map_find_value(boss_hurtstates, state)
    if ((!is_undefined(sb)) && state != (63 << 0) && state != (140 << 0))
    {
        self.player_hurt(sb, _player)
        lastplayerid = _player
    }
}
