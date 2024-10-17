function gameframe_prepare_buffer() {
    var _size = argument[0]
    var _buf = global.__gameframe_buffer
    if (_buf == undefined)
    {
        _buf = buffer_create(_size, buffer_grow, 1)
        global.__gameframe_buffer = _buf
    }
    else if (buffer_get_size(_buf) < _size)
        buffer_resize(_buf, _size)
    buffer_seek(_buf, buffer_seek_start, 0)
    return _buf;
}