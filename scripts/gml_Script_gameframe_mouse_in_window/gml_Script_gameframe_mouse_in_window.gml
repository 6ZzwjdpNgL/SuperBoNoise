function gameframe_mouse_in_window() {
    var _buf = gameframe_prepare_buffer(1)
    return gameframe_mouse_in_window_raw(buffer_get_address(_buf), 1);
}