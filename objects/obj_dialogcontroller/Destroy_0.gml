with (obj_player1)
    state = other.savedstate
var func = dialog[currentdialog][2]
if (func != -4)
{
    if (npcID != noone && instance_exists(npcID))
    {
        with (npcID)
            self.method(id, func)()
    }
    else
        self.method(id, func)()
}
