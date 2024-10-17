function gameframe_get_monitors() {
    var _list = (argument_count > 0 ? argument[0] : undefined)
    var _count = gameframe_get_monitors_1()
    var _buf = gameframe_prepare_buffer(_count * 36)
    if (!gameframe_get_monitors_2(buffer_get_address(_buf)))
        return (_list == undefined ? array_create(0) : 0);
    var _use_array = _list == undefined
    if _use_array
        var _array = array_create(_count)
    buffer_seek(_buf, buffer_seek_start, 0)
    for (var _ind = 0; _ind < _count; _ind++)
    {
        if _use_array
        {
            var _mntr = array_create(4)
            var _work = array_create(4)
            var _item = [_mntr, _work, 0]
            _array[_ind] = _item
        }
        else
        {
            _item = ds_list_find_value(_list, _ind)
            if (_item == undefined)
            {
                _mntr = array_create(4)
                _work = array_create(4)
                _item = [_mntr, _work, 0]
                ds_list_set(_list, _ind, _item)
            }
            else
            {
                _mntr = _item[0]
                _work = _item[1]
            }
        }
        _mntr[0] = buffer_read(_buf, buffer_s32)
        _mntr[1] = buffer_read(_buf, buffer_s32)
        _mntr[2] = buffer_read(_buf, buffer_s32)
        _mntr[3] = buffer_read(_buf, buffer_s32)
        _work[0] = buffer_read(_buf, buffer_s32)
        _work[1] = buffer_read(_buf, buffer_s32)
        _work[2] = buffer_read(_buf, buffer_s32)
        _work[3] = buffer_read(_buf, buffer_s32)
        _item[2] = buffer_read(_buf, buffer_s32)
    }
    return (_use_array ? _array : _count);
}