alarm[0] = 60
sticked = 1
create_debris((x + (random_range(-5, 5))), (y + (random_range(-5, 5))), spr_grapedebris, 0)
x = other.x
y = other.y
with (other)
{
    cheesepeptimer = 2
    sprite_index = spr_cheesepepfall
    image_index = 0
    state = (28 << 0)
}
instance_destroy()
