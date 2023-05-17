function buttonlist_defaults() //gml_Script_buttonlist_defaults
{
    var confirm_style = os_type == os_switch // global.control_constant = 100000, add it to all keyboard controls (which are unicode char real)
    var confirm = choice(32769, 32770, confirm_style)
    var skip = choice(32770, 32769, confirm_style)
    var interact = confirm
    global.default_interact = 1 
    global.interact_buttons = list_Create((32 + global.control_constant), interact)
    global.jump_buttons = list_Create((66 + global.control_constant), (17 + global.control_constant), (69 + global.control_constant), choice(32772, 32769, confirm_style))
    global.confirm_buttons = list_Create((16 + global.control_constant), choice(32772, 32771, confirm_style))
    global.back_buttons = list_Create((27 + global.control_constant), (17 + global.control_constant), (66 + global.control_constant), (69 + global.control_constant), skip)
    global.skip_buttons = list_Create((17 + global.control_constant), (66 + global.control_constant), (69 + global.control_constant), skip)
    show_debug_message("swim buttons...")
    global.swim_buttons = list_Create((16 + global.control_constant), (86 + global.control_constant), (81 + global.control_constant), choice(skip, 32771, confirm_style))
    show_debug_message("colro buttons...")
    global.color_buttons = list_Create((90 + global.control_constant), choice(32774, 32773, global.TOUCH_MODE))
    show_debug_message("size buttons...")
    global.size_buttons = list_Create((18 + global.control_constant), (88 + global.control_constant), choice(32773, choice(32775, 32774, global.PS_MODE), global.TOUCH_MODE))
    global.draw_buttons = list_Create(choice(32776, 32775, (global.TOUCH_MODE && global.PS_MODE)))
    global.erase_buttons = list_Create(choice(32775, choice(32774, 32776, global.PS_MODE), global.TOUCH_MODE))
    global.menu_buttons = list_Create((13 + global.control_constant), (67 + global.control_constant), choice(32778, -1, global.PS_MODE))
    global.map_buttons = list_Create((77 + global.control_constant), choice(32771, 32772, confirm_style))
    global.inven_buttons = list_Create((73 + global.control_constant))
    global.pause_buttons = list_Create((80 + global.control_constant), choice(32777, 32778, global.PS_MODE))
    global.up_buttons = list_Create((87 + global.control_constant), (38 + global.control_constant))
    global.down_buttons = list_Create((83 + global.control_constant), (40 + global.control_constant))
    global.left_buttons = list_Create((65 + global.control_constant), (37 + global.control_constant))
    global.right_buttons = list_Create((68 + global.control_constant), (39 + global.control_constant))
    global.stamp1_buttons = list_Create((49 + global.control_constant), 32781)
    global.stamp2_buttons = list_Create((50 + global.control_constant), 32783)
    global.stamp3_buttons = list_Create((51 + global.control_constant), 32784)
    global.stamp4_buttons = list_Create((52 + global.control_constant), 32782)
    global.zoom_buttons = list_Create((choice(189, 24, os_type == os_macosx) + global.control_constant), (choice(187, 109, os_type == os_macosx) + global.control_constant), 32780)
    global.skipscene_buttons = list_Create()
    global.paint_buttons = global.draw_buttons
    global.mod_settings_buttons = list_Create(35 + global.control_constant)
    global.savestate_buttons = list_Create(34 + global.control_constant)
    global.loadstate_buttons = list_Create(33 + global.control_constant)
    global.custom_buttons = list_Create(36 + global.control_constant)
    global.teleport_buttons = list_Create(191 + global.control_constant)
    global.chaptersel_buttons = list_Create(187 + global.control_constant)
    global.resetscreen_buttons = list_Create(46 + global.control_constant)
    var newblists = list_of_lists(
        global.left_buttons, global.right_buttons, global.jump_buttons, global.interact_buttons, global.skip_buttons, global.confirm_buttons, global.back_buttons, global.swim_buttons, global.color_buttons, global.size_buttons, global.draw_buttons, global.erase_buttons, global.zoom_buttons, global.stamp1_buttons, global.stamp2_buttons, global.stamp3_buttons, global.stamp4_buttons, global.up_buttons, global.down_buttons, global.pause_buttons, global.menu_buttons, global.inven_buttons, global.map_buttons, global.skipscene_buttons,
        global.mod_settings_buttons, global.savestate_buttons, global.loadstate_buttons, global.custom_buttons, global.teleport_buttons, global.chaptersel_buttons, global.resetscreen_buttons
    )
    if (!variable_global_exists("buttonlists") || !ds_exists(global.buttonlists, ds_type_list)) {
        global.buttonlists = newblists
    } else if (ds_list_size(global.buttonlists) < ds_list_size(newblists)) { // Controls exist BUT not new ones.
        for (var i = ds_list_size(global.buttonlists); i < ds_list_size(newblists); i += 1) {
            ds_list_add_list(global.buttonlists, ds_list_find_value(newblists, i))
        }
        controls_check_interact_default() // This is set at the top because it assumes no user controls are used.
    } // we have the same or MORE???? controls than we should.

    if (instance_exists(objDog)) {
        with (objDog) {
            mod_pause_controls = list_of_lists(
                global.mod_settings_buttons, global.savestate_buttons, global.loadstate_buttons, global.custom_buttons, global.teleport_buttons, global.chaptersel_buttons, global.resetscreen_buttons
            )
        }
    }

}

