function gameframe_buffer_read_chars() {
    var _buf = argument[0]
    var _len = argument[1]
    var _tmp = global.__ggpo_string_buffer
    if (_tmp == undefined)
    {
        _tmp = buffer_create((_len + 1), buffer_grow, 1)
        global.__ggpo_string_buffer = _tmp
    }
    else if (buffer_get_size(_tmp) <= _len)
        buffer_resize(_tmp, (_len + 1))
    buffer_copy(_buf, buffer_tell(_buf), _len, _tmp, 0)
    buffer_seek(_buf, buffer_seek_relative, _len)
    buffer_poke(_tmp, _len, buffer_u8, 0)
    buffer_seek(_tmp, buffer_seek_start, 0)
    return buffer_read(_tmp, buffer_string);
}