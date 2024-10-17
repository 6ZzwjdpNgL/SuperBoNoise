switch type
{
    case (0 << 0):
        sprite_index = spr_soundtest_button_left
        onPress = function() //anon@105@gml_Object_obj_soundtest_button_Other_4
        {
            with (obj_soundtest)
            {
                position--
                if (position < 0)
                    position = pos_last
            }
        }

        break
    case (1 << 0):
        sprite_index = spr_soundtest_button_pause
        onPress = function() //anon@335@gml_Object_obj_soundtest_button_Other_4
        {
            with (obj_soundtest)
            {
                var mu = musicArr[position]
                if mu.playing
                    mu.pause()
                else
                    mu.play()
            }
        }

        break
    case (2 << 0):
        sprite_index = spr_soundtest_button_right
        onPress = function() //anon@602@gml_Object_obj_soundtest_button_Other_4
        {
            with (obj_soundtest)
            {
                position++
                if (position > pos_last)
                    position = 0
            }
        }

        break
}

