var i, b;

for (i = 0; i < ds_list_size(secrettriggers); i++)
{
    b = ds_list_find_value(secrettriggers, i);
    
    if (b[0] != -4)
        method(id, b[0])();
}
