function gameframe_get_monitors_1() {
    var _buf = gameframe_prepare_buffer(1)
    return gameframe_get_monitors_1_raw(buffer_get_address(_buf), 1);
}