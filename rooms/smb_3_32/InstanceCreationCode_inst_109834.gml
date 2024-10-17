sprite_index = spr_turnipGrassCave
onPick = function() //anon@46@gml_RoomCC_smb_3_32_11_Create
{
    var inst = instance_create(x, y, obj_twoliterdog)
    inst.state = (6 << 0)
    with (obj_player1)
    {
        inst.grabbedby = id
        grabbingenemy = true
        baddiegrabbedID = inst
        state = (81 << 0)
        sprite_index = spr_haulingidle
    }
}

