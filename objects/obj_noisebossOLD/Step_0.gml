targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (hp <= 0 && state != (147 << 0))
{
    if ((!destroyed) && (!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
if (chooseparry_buffer > 0)
    chooseparry_buffer--
if ((state == (44 << 0) || state == (104 << 0) || state == (169 << 0) || state == (173 << 0) || state == (175 << 0) || (state == (60 << 0) && pogochargeactive) || state == (79 << 0)) && alarm[0] <= 0)
    alarm[0] = 6
switch state
{
    case (147 << 0):
        grav = 0.5
        state_boss_arenaround()
        movespeed = 0
        inv_timer = 2
        invincible = 1
        break
    case (2 << 0):
        grav = 0.5
        boss_noise_normal()
        break
    case (108 << 0):
        grav = 0.5
        state_boss_bump()
        break
    case (44 << 0):
        grav = 0.5
        boss_noise_handstandjump()
        break
    case (104 << 0):
        grav = 0.5
        boss_noise_crouchslide()
        break
    case (79 << 0):
        grav = 0.5
        boss_noise_skateboard()
        break
    case (169 << 0):
        grav = 0.5
        boss_noise_skateboardturn()
        break
    case (94 << 0):
        grav = 0.5
        boss_noise_jump()
        break
    case (76 << 0):
        grav = 0.5
        boss_noise_throwing()
        break
    case (60 << 0):
        grav = 0.5
        boss_noise_pogo()
        break
    case (172 << 0):
        grav = 0.5
        boss_noise_jetpackstart()
        break
    case (173 << 0):
        grav = 0.5
        boss_noise_jetpack()
        break
    case (175 << 0):
        grav = 0.5
        boss_noise_jetpackspin()
        break
    case (136 << 0):
        grav = 0.5
        state_boss_walk(boss_noise_do_attack)
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

angry = phase > 6
attacking = (state == (44 << 0) || state == (104 << 0) || state == (79 << 0) || state == (169 << 0) || state == (60 << 0) || state == (172 << 0) || state == (173 << 0) || state == (175 << 0) || state == (76 << 0))
