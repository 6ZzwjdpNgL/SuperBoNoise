pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA mid ISLAND"
global.pizzadelivery = 1
global.hp = 8
global.use_temperature = 1
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon@223@gml_Room_rm_daycareback_Create
    {
        touchedtriggers = 0
        return;
    }
, function() //anon@277@gml_Room_rm_daycareback_Create
    {
        if (touchedtriggers >= 2)
            secret_open_portal(0)
        return;
    }
)
    secret_add(function() //anon@376@gml_Room_rm_daycareback_Create
    {
        hittriggers = 0
        return;
    }
, function() //anon@426@gml_Room_rm_daycareback_Create
    {
        if (hittriggers >= 2)
            secret_open_portal(4)
        return;
    }
)
    secret_add(-4, function() //anon@525@gml_Room_rm_daycareback_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        return;
    }
)
    secret_add(-4, function() //anon@629@gml_Room_rm_daycareback_Create
    {
        secret_open_portal(2)
        return;
    }
)
    secret_add(-4, function() //anon@702@gml_Room_rm_daycareback_Create
    {
        if secret_check_trigger(3)
            secret_open_portal(3)
        else
            secret_close_portal(3)
        return;
    }
)
    secret_add(function() //anon@837@gml_Room_rm_daycareback_Create
    {
        totems = 0
        return;
    }
, function() //anon@882@gml_Room_rm_daycareback_Create
    {
        if (totems >= 3)
            secret_open_portal(5)
        return;
    }
)
    secret_add(-4, function() //anon@976@gml_Room_rm_daycareback_Create
    {
        if secret_check_trigger(6)
            secret_open_portal(6)
        return;
    }
)
    secret_add(-4, function() //anon@1080@gml_Room_rm_daycareback_Create
    {
        if secret_check_trigger(7)
            secret_open_portal(7)
        return;
    }
)
}
