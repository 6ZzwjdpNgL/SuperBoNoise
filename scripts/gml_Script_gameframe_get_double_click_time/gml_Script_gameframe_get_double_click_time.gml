function gameframe_get_double_click_time() {
    var _buf = gameframe_prepare_buffer(1)
    return gameframe_get_double_click_time_raw(buffer_get_address(_buf), 1);
}