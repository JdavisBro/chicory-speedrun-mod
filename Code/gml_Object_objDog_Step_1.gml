if ((os_type == os_windows || os_type == os_macosx) && global.cur_players < global.max_players) // Default stuff
    coop_search()
event_inherited()

// Mod Stuff:

var title = global.the_leveleditor.level_z == 1 && (global.the_leveleditor.level_x == 2 || global.the_leveleditor.level_x == 1) && global.the_leveleditor.level_y == 0 // on title/newgame screen

// mod settings menu
if (!title) {mod_pause = false}

var pause_objs = list_Create(objTitle, objTimelapseshroom, objClearTimelapseshroom, objCoopshroom, objOptionshroom, objQuitshroom, objNewgame)

if (title && buttonlist_pressed(global.mod_settings_buttons, 0) && !mod_pause_controls_setting) { // Toggle mod pause
    mod_pause = !mod_pause
    if (mod_pause) {
        mod_pause_start_x = x
        mod_pause_start_y = y
        mod_pause_menu = 0
        mod_pause_selected = 0
        mod_pause_controls_setting = false
        for (var i = 0; i < ds_list_size(pause_objs); i+=1) {
            instance_deactivate_object(ds_list_find_value(pause_objs, i))
        }
    } else {
        x = mod_pause_start_x
        y = mod_pause_start_y
        for (var i = 0; i < ds_list_size(pause_objs); i+=1) {
            instance_activate_object(ds_list_find_value(pause_objs, i))
        }
    }
}

if (mod_pause) {
    x = 1920 / 2
    y = 1080 / 2
    if (buttonlist_pressed(global.confirm_buttons, 0) || buttonlist_pressed(global.interact_buttons, 0)) { // confirm pressed.
        switch (mod_pause_menu) {
            case 0: // pause
                switch (mod_pause_selected) {
                    case 0: // controls
                        mod_pause_menu = 1
                        mod_pause_selected = 0
                        break
                }
                mod_pause_selected = 0
                break
            case 1: // controls
                if (!mod_pause_controls_setting) {
                    ds_list_destroy(ds_list_find_value(mod_pause_controls ,mod_pause_selected))
                    var newlist = ds_list_create()
                    if (mod_pause_selected == 0)
                        ds_list_add(newlist, 35 + global.control_constant)
                    ds_list_replace(mod_pause_controls, mod_pause_selected, newlist)
                    mod_pause_controls_setting = true
                } else {
                    controls_save()
                    mod_pause_controls_setting = false
                }
                break
        }
    } else if (buttonlist_pressed(global.back_buttons, 0)) { // back pressed.
        switch (mod_pause_menu) {
            case 0:
                mod_pause = false
                x = mod_pause_start_x
                y = mod_pause_start_y
                for (var i = 0; i < ds_list_size(pause_objs); i+=1) {
                    instance_activate_object(ds_list_find_value(pause_objs, i))
                }
                break
            default:
                mod_pause_menu = 0
                mod_pause_selected = 0
                mod_pause_controls_setting = false
                break
        }
    } else if (mod_pause_menu == 1 && mod_pause_controls_setting) { // setting a control
        if (keyboard_key != vk_nokey && keyboard_check_pressed(keyboard_key)) { // keyboard_key just pressed
            if (ds_list_find_index(ds_list_find_value(mod_pause_controls, mod_pause_selected), keyboard_key + global.control_constant) == -1 && ds_list_size(ds_list_find_value(mod_pause_controls, mod_pause_selected)) < 4) { // not already selected, less than 4 keys done.
                ds_list_add(ds_list_find_value(mod_pause_controls, mod_pause_selected), keyboard_key + global.control_constant)
            }
        }
    } else if (buttonlist_pressed(global.up_buttons, 0)) { // up pressed.
        if (mod_pause_selected != 0) {
            mod_pause_selected -= 1
        }
    } else if (buttonlist_pressed(global.down_buttons, 0)) { // down pressed.
        if (mod_pause_selected != (ds_list_size(ds_list_find_value(mod_pause_menu_options, mod_pause_menu)) - 1)) {
            mod_pause_selected += 1
        }
    }
} else {


var copy = false // SAVE STATE
var copyfrom = ""
var copyto = ""
var do_load = false

var num = -1
for (var i = 0; i < 10; i += 1) {
    if keyboard_check_pressed(ord(string(i))) {
        num = i
        break
    }
}


if (num >= 0 && !title) {
    if (buttonlist_check(global.savestate_buttons, 0)) { // save pressed, save.
        save_game()
        copy = true
        copyfrom = "save/_playdata_backup" // save_game saves to _playdata_backup and async copies that to _playdata which means it might not be immediately updated, so copy _playdata_backup
        copyto = "saveslots/" + string(num) + "/_playdata"
    } else if (buttonlist_check(global.loadstate_buttons, 0)) { // load pressed, load.
        copy = true
        copyfrom = "saveslots/" + string(num) + "/_playdata"
        copyto = "save/_playdata"
        do_load = true
    }
}

if (copy) {
    if (file_exists(copyto) && file_exists(copyfrom)) {
        file_delete(copyto)
    }
    if (file_exists(copyfrom)) {
        file_copy(copyfrom, copyto)
        show_debug_message(copyfrom + " -> " + copyto)
    } else {
        do_load = false
    }
    if (do_load) {
        global.the_leveleditor.level_x = 0 // Load room 4_0_0 to unload the current room and its preloaded ones
        global.the_leveleditor.level_y = 0
        global.the_leveleditor.level_z = 4
        room_Restart()
        load_game() // Load new copied _playdata
        Transition(global.the_leveleditor.level_z, global.the_leveleditor.level_x, global.the_leveleditor.level_y, -1) // Transition because if you room_Restart multiple times in a frame it makes some deco invisible.
    }
}

if (buttonlist_pressed(global.custom_buttons, 0) && !title) { // PALETTE
    Drawing(string_translate("draw_palette"), -1, "palette", -2, 0)
    data_set("stamp_27", 1)
    data_set("stamp_unlocked", 1)
    SceneEnd()
}

if (buttonlist_pressed(global.teleport_buttons, 0)) { // teleport
    x = mouse_x
    y = mouse_y
}

if (buttonlist_pressed(global.chaptersel_buttons, 0) && global.the_gameobj.can_menu && !title) {
    global.paused = 1
    global.the_gameobj.pause_master = 1
    global.the_gameobj.pause_select = 0
    global.the_gameobj.pause_sceneselect = 1
}

} // End of pause else