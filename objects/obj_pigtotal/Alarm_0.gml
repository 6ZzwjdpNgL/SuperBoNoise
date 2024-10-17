var _temp_local_var_1;
var _temp_local_var_1 = room
world = 1
ini_open(concat("saveData", global.currentsavefile, ".ini"))
ini_write_real("PigTotal", concat("world", world), global.pigtotal)
ini_close()
