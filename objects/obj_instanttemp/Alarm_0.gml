if (sprite_index == spr_null)
{
    repeat irandom_range(1, 3)
        create_spr_deadjohnsmoke((x + 64 + (irandom_range(-24, 24))), (y + 40))
}
alarm[0] = 10 + (irandom_range(-2, 5))
