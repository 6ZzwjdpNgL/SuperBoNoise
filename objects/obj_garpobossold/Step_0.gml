targetplayer = (global.coop ? instance_nearest(x, y, obj_player1) : obj_player1)
if (obj_bosscontroller.state == (146 << 0))
    return;
if (hp <= 0 && state != (147 << 0) && state != (164 << 0))
{
    if ((!thrown) && (!destroyable))
        self.boss_destroy(lastplayerid)
}
image_speed = 0.35
if (knightbuffer > 0)
    knightbuffer--
switch phase
{
    case 0:
        normal_func = boss_garpo_phase1normal
        break
    case 1:
        normal_func = boss_pizzahead_phase2normal
        break
    case 2:
        normal_func = boss_pizzahead_phase3normal
        break
}

switch state
{
    case (147 << 0):
        grav = 0.5
        break
    case (2 << 0):
        grav = 0.5
        self.normal_func()
        break
    case (232 << 0):
        grav = 0.5
        self.boss_garpo_ram()
        break
    case (228 << 0):
        grav = 0.5
        self.boss_garpo_moustache()
        break
    case (230 << 0):
        grav = 0.5
        self.boss_garpo_eyes()
        break
    case (229 << 0):
        grav = 0.5
        self.boss_garpo_mouth()
        break
    case (231 << 0):
        grav = 0.5
        self.boss_garpo_nose()
        break
    case (233 << 0):
        self.boss_garpo_phase2transition()
        break
    case (234 << 0):
        self.boss_pizzahead_look()
        break
    case (235 << 0):
        self.boss_pizzahead_fishing()
        break
    case (237 << 0):
        self.boss_pizzahead_bombrun()
        break
    case (238 << 0):
        self.boss_pizzahead_npcthrow()
        break
    case (239 << 0):
        self.boss_pizzahead_portraitthrow()
        break
    case (240 << 0):
        self.boss_pizzahead_enguarde()
        break
    case (241 << 0):
        self.boss_pizzahead_sexypicture()
        break
    case (242 << 0):
        self.boss_pizzahead_pullinglevel()
        break
    case (243 << 0):
        self.boss_pizzahead_eat()
        break
    case (244 << 0):
        self.boss_pizzahead_surprisebox()
        break
    case (245 << 0):
        self.boss_pizzahead_spinningrun()
        break
    case (246 << 0):
        self.boss_pizzahead_spinningkick()
        break
    case (247 << 0):
        self.boss_pizzahead_spinningpunch()
        break
    case (248 << 0):
        self.boss_pizzahead_groundpunch()
        break
    case (249 << 0):
        self.boss_pizzahead_bigkick()
        break
    case (250 << 0):
        self.boss_pizzahead_slamhead()
        break
    case (251 << 0):
        self.boss_pizzahead_slamhead2()
        break
    case (136 << 0):
        grav = 0.5
        if grounded
            state = (2 << 0)
        invincible = 1
        inv_timer = 2
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
        stunned = 30
        break
    case (140 << 0):
        grav = 0.5
        state_boss_stun()
        break
}

if (phase == 0 && state != (232 << 0))
    invincible = 1
else
    invincible = 0
attacking = (state == (232 << 0) || state == (231 << 0) || state == (246 << 0) || state == (247 << 0) || state == (248 << 0) || state == (250 << 0) || state == (251 << 0))
colliding = state != (232 << 0)
if (phase > 0)
{
    mask_index = spr_pizzahead_giddy
    stunfallspr = spr_pizzahead_giddy
    walkspr = spr_pizzahead_giddy
}
