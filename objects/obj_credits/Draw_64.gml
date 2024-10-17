draw_set_alpha(0.4)
draw_rectangle_color(-100, -100, (obj_gameFrame.defaultwidth + 100), (obj_gameFrame.defaultheight + 100), c_black, c_black, c_black, c_black, false)
draw_set_alpha(1)
draw_sprite_ext(sprite_index, image_index, (obj_gameFrame.defaultwidth / 2), (obj_gameFrame.defaultheight / 2), 1, 1, 0, c_white, endAlpha)
for (var i = 0; i < array_length(creditArr); i++)
{
    with (creditArr[i])
        self.draw()
}
for (i = 0; i < array_length(thrownArr); i++)
{
    with (thrownArr[i])
        self.draw()
}
for (i = array_length(thrownArr) - 1; i > -1; i--)
{
    with (thrownArr[i])
    {
        if (image_alpha <= 0)
            array_delete(other.thrownArr, i, 1)
    }
}
for (i = array_length(tomatoArr) - 1; i > -1; i--)
{
    with (tomatoArr[i])
    {
        if (image_alpha <= 0)
            array_delete(other.tomatoArr, i, 1)
    }
}
for (i = array_length(cheerArr) - 1; i > -1; i--)
{
    with (cheerArr[i])
    {
        if (image_alpha <= 0)
            array_delete(other.cheerArr, i, 1)
    }
}
draw_set_alpha(endAlpha)
draw_text_scribble((obj_gameFrame.defaultwidth / 2), 400, string("[shake][spr_transfopromptfont][fa_middle][fa_center]{0} to continue...", get_control_sprite("jump")))
draw_set_alpha(1)
if (finalAlpha > 0)
{
    draw_set_alpha(finalAlpha)
    draw_sprite(bg_credits_final, 0, (obj_gameFrame.defaultwidth / 2), (obj_gameFrame.defaultheight / 2))
    draw_sprite(bg_credits_final, 1, (obj_gameFrame.defaultwidth / 2), (obj_gameFrame.defaultheight / 2))
    draw_set_alpha(1)
}
