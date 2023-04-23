function controls_load() //gml_Script_controls_load
{
    if global.using_async_io
        controls_load_async()
    if file_Exists("controls")
    {
        var file = file_text_open_read("controls")
        var i = 0
        while (i < ds_list_size(global.buttonlists))
        {
            if file_text_eof(file)
            {
                // ds_list_destroy(global.buttonlists)
                for (var ii = i; ii < ds_list_size(global.buttonlists); ii += 1) {
                    ds_list_delete(global.buttonlists, ii)
                }
                buttonlist_defaults()
                break
            }
            else
            {
                var blist = ds_list_find_value(global.buttonlists, i)
                ds_list_read(blist, file_text_read_string(file))
                file_text_readln(file)
                i += 1
                continue
            }
        }
        file_text_close(file)
    }
    controls_check_interact_default()
}

