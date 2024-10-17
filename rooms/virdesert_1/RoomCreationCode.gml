pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA mid OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon@159@gml_Room_virdesert_1_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon@213@gml_Room_virdesert_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
        return;
    }
)
    secret_add(-4, function() //anon@316@gml_Room_virdesert_1_Create
    {
        secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon@389@gml_Room_virdesert_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
        return;
    }
)
}
