function scr_initenemy() //scr_initenemy
{
    scr_collision_init()
    mySoundEmitter = 0
    santaID = -4
    rattime = 0
    platformid = -4
    usepalette = 0
    blur_effect = 0
    hsp_carry = 0
    vsp_carry = 0
    xscale = 1
    yscale = 1
    grav = 0.5
    hsp = 0
    vsp = 0
    stunned = 0
    alarm[0] = 150
    roaming = 1
    throwspd = 0.35
    throwframe = 999
    throw_spr = spr_null
    flying = 0
    straightthrow = 0
    stomped = 0
    reset = 0
    bombreset = 0
    hp = 1
    maxhp = 1
    grounded = true
    hit_connected = 0
    flash = 0
    birdcreated = 0
    boundbox = 0
    hitboxcreate = 0
    important = 0
    heavy = 0
    depth = 0
    grabbedby = 0
    paletteselect = 0
    spr_palette = palette_tack
    stuntouchbuffer = 0
    scaredbuffer = 0
    movespeed = 1
    ragebuffer = 0
    ragehitbox = 0
    ragedash = 0
    ragecooldown = 0
    img_angle = image_angle
    steppy = 20
    invtime = 0
    invincible = 0
    bumpable = 1
    stompable = 1
    killbyenemy = 1
    groundpound = 1
    instantkillable = 1
    stunnable = 1
    parryable = 1
    destroyable = 1
    hittable = 1
    shakestun = 1
    pepperman_grab = 0
    stagger_buffer = -1
    stagger_max = 45
    stagger_jumpspeed = 4
    stagger_movespeed = 1
    stagger_dir = 1
    hitLag = 75
    hitX = x
    hitY = y
    hitvsp = 0
    hithsp = 0
    dodgebuffer = 0
    arcprojectiletimer = 0
    oggrav = 0.5
    arena = 0
    wave = 0
    rage = 0
    instakilled = 0
    killprotection = 0
    mach3destroy = 0
    provoked = 0
    is_controllable = 0
    possess_movespeed = 0
    stuntouch_yoffset = 0
    turnmax = 200
    turntimer = 0
    turnstart = 0
    timedgate = 0
    chargeID = -4
    angle = image_angle
    is_controllable = 0
    possess_movespeed = 0
    grav = 0.5
    hsp = 0
    vsp = 0
    state = (136 << 0)
    storedstate = (136 << 0)
    stunned = 0
    alarm[0] = 150
    roaming = 1
    collectdrop = 5
    flying = 0
    straightthrow = 0
    cigar = 0
    cigarcreate = 0
    stomped = 0
    shot = 0
    reset = 0
    flash = 0
    thrown = false
    hp = 1
    slapped = 0
    grounded = true
    birdcreated = 0
    boundbox = 0
    spr_dead = spr_grapedead
    important = 0
    heavy = 0
    depth = 0
    paletteselect = 0
    spr_palette = palette_grape
    grabbedby = 0
    stuntouchbuffer = 0
    scaredbuffer = 0
    railmovespeed = 0
    use_collision = 1
    turner = 0
    elite = false
    elitehit = 0
    elitegrab = 0
    ventilator_vsp = -5
    linethrown = false
    dashcloudid = obj_null
    tauntspr = spr_null
    storedspr = spr_null
    taunttimer = 20
    return;
}

