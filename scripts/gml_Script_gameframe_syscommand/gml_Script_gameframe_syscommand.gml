function gameframe_syscommand() {
    var _buf = gameframe_prepare_buffer(8)
    buffer_write(_buf, buffer_f64, argument[0])
    gameframe_syscommand_raw(buffer_get_address(_buf), 8)
}