function scr_transformationcheck() //scr_transformationcheck
{
    for (var i = 0; i < array_length(transformation); i++)
    {
        if (state == transformation[i])
            return false;
    }
    return true;
}

