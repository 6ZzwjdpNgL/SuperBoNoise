pal_swap_init_system(shd_pal_swapper)
global.roommessage = ""
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon@142@gml_Room_midway_secret1_Create
    {
        secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon@215@gml_Room_midway_secret1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon@319@gml_Room_midway_secret1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
