if ((os_type == os_windows || os_type == os_macosx) && global.cur_players < global.max_players) // Default stuff
    coop_search()
event_inherited()

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

var title = global.the_leveleditor.level_z == 1 && (global.the_leveleditor.level_x == 2 || global.the_leveleditor.level_x == 1) && global.the_leveleditor.level_y == 0 // on title/newgame screen

if (num >= 0 && !title) {
    if (keyboard_check(vk_pagedown)) { // pagedown pressed, save.
        save_game()
        copy = true
        copyfrom = "save/_playdata_backup" // save_game saves to _playdata_backup and async copies that to _playdata which means it might not be immediately updated, so copy _playdata_backup
        copyto = "saveslots/" + string(num) + "/_playdata"
    } else if (keyboard_check(vk_pageup)) { // pageup (and not pagedown) pressed, load.
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

if (keyboard_check_pressed(vk_home)) { // PALETTE
    Drawing(string_translate("draw_palette"), -1, "palette", -2, 0)
    GiftStamp(27, 0)
    SceneEnd()
}