if (ds_list_find_index(global.saveroom, id) == -1 && other.state == (86 << 0))
{
    other.state = (87 << 0)
    other.sprite_index = other.spr_victory
    other.image_index = 0
    sprite_index = spr_graffiti_drawn
    global.graffiticount++
    instance_create(x, (y - 80), obj_graffiticount)
    ds_list_add(global.saveroom, id)
}
