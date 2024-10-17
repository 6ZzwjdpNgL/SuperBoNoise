function gameframe_init_raw() {
    var _buf = gameframe_prepare_buffer(8)
    buffer_write(_buf, buffer_u64, int64(window_handle()))
    gameframe_init_raw_raw(buffer_get_address(_buf), 8)
}