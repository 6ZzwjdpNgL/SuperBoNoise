function gameframe_is_natively_minimized() {
    var _buf = gameframe_prepare_buffer(1)
    return gameframe_is_natively_minimized_raw(buffer_get_address(_buf), 1);
}