pal_swap_init_system(shd_pal_swapper)
global.roommessage = "WELCOME TO PIZZA mid"
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //anon@181@gml_Room_faketut_1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon@235@gml_Room_faketut_1_Create
    {
        if (touchedtriggers >= 4)
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon@338@gml_Room_faketut_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon@411@gml_Room_faketut_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
