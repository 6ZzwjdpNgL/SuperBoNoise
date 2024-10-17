for (var i = ds_list_size(global.AfterImageList) - 1; i > -1; i--)
{
    with (ds_list_find_value(global.AfterImageList, i))
    {
        if (lifeTime > 0)
            lifeTime--
        else
            vanish = true
        if doesBlink
        {
            visible = global.BlinkTrail
            if (afterImageType == (2 << 0))
                afterImageIndex = choose(0, 1)
        }
        if (afterImageType == (2 << 0))
        {
            if ((!((ownerID.state == (94 << 0) && ownerID.sprite_index == spr_null))) && ownerID.pizzapepper == 0 && ownerID.state != (193 << 0) && ownerID.state != (57 << 0) && ownerID.state != (110 << 0) && ownerID.state != (99 << 0) && ownerID.state != (149 << 0) && ownerID.state != (43 << 0) && ownerID.state != (82 << 0) && ownerID.state != (43 << 0) && ownerID.state != (33 << 0) && ownerID.state != (104 << 0) && ownerID.state != (6 << 0) && ownerID.pogochargeactive == 0 && ownerID.state != (22 << 0) && ownerID.state != (123 << 0) && ownerID.state != (39 << 0) && ownerID.state != (21 << 0) && ownerID.state != (130 << 0) && ownerID.state != (106 << 0) && ownerID.state != (44 << 0) && ownerID.state != (107 << 0) && ownerID.state != (77 << 0) && ownerID.state != (65 << 0) && ownerID.state != (75 << 0) && ownerID.state != (78 << 0) && ownerID.state != (67 << 0) && ownerID.state != (63 << 0) && ownerID.state != (99 << 0) && ownerID.state != (35 << 0))
                vanish = true
            image_alpha = 0.65
            if (ownerID.state == (106 << 0) || ownerID.state == (105 << 0) || ownerID.state == (123 << 0))
                image_alpha *= (abs(ownerID.movespeed) / 12)
            with (ownerID)
            {
                if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
                    other.vanish = true
            }
        }
        if vanish
        {
            fadingAlpha = approach(fadingAlpha, 0, (afterImageType > (2 << 0) ? 0.05 : 0.15))
            if (fadingAlpha <= 0)
                ds_list_delete(global.AfterImageList, i)
        }
    }
}
if (blinkingBuffer > 0)
    blinkingBuffer--
else
{
    event_user(0)
    blinkingBuffer = blinkingBufferMax
}
