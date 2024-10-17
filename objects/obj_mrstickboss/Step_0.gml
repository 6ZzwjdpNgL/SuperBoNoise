targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (hp <= 0 && state != (147 << 0))
{
    if ((!destroyed) && (!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
switch state
{
    case (147 << 0):
        grav = 0.5
        state_boss_arenaround()
        break
    case (2 << 0):
        grav = 0.5
        boss_mrstick_normal()
        break
    case (176 << 0):
        grav = 0.5
        boss_mrstick_shield()
        break
    case (177 << 0):
        grav = 0.5
        boss_mrstick_helicopterhat()
        break
    case (178 << 0):
        grav = 0.5
        boss_mrstick_panicjump()
        break
    case (94 << 0):
        grav = 0.5
        boss_mrstick_jump()
        break
    case (179 << 0):
        grav = 0.5
        boss_mrstick_smokebombstart()
        break
    case (180 << 0):
        grav = 0.5
        boss_mrstick_smokebombcrawl()
        break
    case (181 << 0):
        grav = 0.5
        boss_mrstick_springshoes()
        break
    case (182 << 0):
        grav = 0.5
        boss_mrstick_cardboard()
        break
    case (183 << 0):
        grav = 0.5
        boss_mrstick_cardboardend()
        break
    case (184 << 0):
        grav = 0.5
        boss_mrstick_mockery()
        break
    case (136 << 0):
        grav = 0.5
        state_boss_walk(boss_mrstick_decide_attack)
        inv_timer = 2
        invincible = 1
        break
    case (63 << 0):
        grav = 0.5
        state_boss_chainsaw()
        break
    case (86 << 0):
        grav = 0.5
        state_boss_taunt()
        invincible = 1
        inv_timer = 2
        break
    case (149 << 0):
        grav = 0.5
        state_boss_parry()
        invincible = 1
        inv_timer = 2
        break
    case (139 << 0):
        grav = 0.5
        scr_enemy_hit()
        stunned = targetstunned
        break
    case (140 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

colliding = (!((state == (94 << 0) || state == (182 << 0) || state == (183 << 0))))
attacking = (state == (176 << 0) || state == (94 << 0) || state == (182 << 0) || state == (183 << 0) || state == (179 << 0))
