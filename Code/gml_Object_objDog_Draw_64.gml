var title = global.the_leveleditor.level_z == 1 && (global.the_leveleditor.level_x == 2 || global.the_leveleditor.level_x == 1) && global.the_leveleditor.level_y == 0 // on title/newgame screen


if (mod_pause) {
    draw_set_colour(c_white)
    draw_rectangle(0, 0, 1920, 1080, false)
}

draw_set_valign(fa_top)
draw_set_halign(fa_left)
if (title){
    draw_set_colour(c_black)
    if (!mod_pause){
        draw_text(200, 100, "Speedrun Mod!")
    } else {
        draw_text(600, 100, "Speedrun Mod Settings!")
    }
}

var pause_options_max = 6
var scroll_index = 2 // the index to scroll at
var menu_length = ds_list_size(ds_list_find_value(mod_pause_menu_options, mod_pause_menu))
var start = max(min(mod_pause_selected - scroll_index, menu_length - pause_options_max), 0)

if (mod_pause) {
    draw_text(0, 0, "Confirm: " + buttonlist_to_string(global.interact_buttons, false, 4) + " - Back: " + buttonlist_to_string(global.back_buttons, false, 4))
    if (menu_length > pause_options_max) {
        if (start != 0) // draw up arrow
            draw_text(275, 100, "^^")
        if (start != (menu_length - pause_options_max)) // draw down arrow
            draw_text(275, 800, "vv")
    }   
    for (var i = start; i < min(menu_length, start + pause_options_max); i += 1) {
        if (i % 2 == 0) { // even are black
            draw_set_colour(c_black)
        } else { // odd are grey
            draw_set_colour(c_gray)
        }
        var text = ""
        if (i != mod_pause_selected) { // not selected options
            text += "  "
            if (mod_pause_controls_setting) { // When setting keys other options are grey
                draw_set_colour(c_ltgray)
            }
        } else { // Selected option
            text += "> "
        }
        text += ds_list_find_value(ds_list_find_value(mod_pause_menu_options, mod_pause_menu), i)
        if (mod_pause_menu == 1) {
            text += ": " + buttonlist_to_string(ds_list_find_value(mod_pause_controls, i), false, 4)
            if (i == mod_pause_selected && mod_pause_controls_setting) {
                text += " <"
            }
        }
        draw_text(50, 200 + (100 * (i - start)), text)
    }
}
