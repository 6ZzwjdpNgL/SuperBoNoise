pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA mid IN SPACE"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon@160@gml_Room_water_secret1_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon@233@gml_Room_water_secret1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon@337@gml_Room_water_secret1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
