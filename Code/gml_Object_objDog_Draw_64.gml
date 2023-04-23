var title = global.the_leveleditor.level_z == 1 && (global.the_leveleditor.level_x == 2 || global.the_leveleditor.level_x == 1) && global.the_leveleditor.level_y == 0 // on title/newgame screen

draw_set_halign(fa_left)
if (title){
    draw_set_colour(c_black)
    draw_set_valign(fa_middle)
    if (!mod_pause){
        draw_text(200, 100, "Speedrun Mod!")
    } else {
        draw_text(200, 100, "Speedrun Mod Settings!")
    }
}

if (mod_pause) {
    draw_set_valign(fa_top)
    for (var i = 0; i != ds_list_size(ds_list_find_value(mod_pause_menu_options, mod_pause_menu)); i += 1) {
        if (i != mod_pause_selected)
            var text = "  "
        else
            var text = "> "
        text += ds_list_find_value(ds_list_find_value(mod_pause_menu_options, mod_pause_menu), i)
        if (mod_pause_menu == 1) {
            text += " - " + buttonlist_to_string(ds_list_find_value(mod_pause_controls, i), false, 4)
            if (i == mod_pause_selected && mod_pause_controls_setting) {
                text += " <"
            }
        }
        draw_text(50, 200 + (100 * i), text)
    }
}
