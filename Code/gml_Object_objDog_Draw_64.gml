var title = global.the_leveleditor.level_z == 1 && (global.the_leveleditor.level_x == 2 || global.the_leveleditor.level_x == 1) && global.the_leveleditor.level_y == 0 // on title/newgame screen

if (title){
    draw_set_colour(c_black)
    draw_text(200, 100, "Speedrun Mod!")
}
