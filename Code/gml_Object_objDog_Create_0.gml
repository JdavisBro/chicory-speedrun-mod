event_inherited()   // REGULAR objDog_Create
global.the_dog = id
footSpeed = 10
footAccel = 1.5
swimSpeed = choice(14, 18, data_get("power_waterfall"))
swimAccel = choice(1.25, 1.4, data_get("power_waterfall"))
can_water = data_get("power_water")
paddleSpeed = 7
paddleAccel = 0.5
walkAccel = footAccel
walkSpeed = footSpeed
jump_holding = -1
swimming_sound = -1
swimming_sound_name = "paint_swim_lp"
swimming_vibrate = -1
needs_shake = 0
idle_interrupt = 0
interrupt_type = -1
tense = 0
slowSpeed = 5
collider_radius_default = 24
collider_radius = collider_radius_default
swim_collisions = 0
swim_event = 0
render_off_x = 0
render_off_y = 0
brush_looks = 0
mini_item_popup = 0
mini_item_spr = -1
mini_item_img = 0
mini_item_num = 0
mini_item_data = ""
mini_item_always = 0
ear_a = 0
ears_blow = 0
singing = -1
shame = 0
peppiness = 1
if (brush_missing() && data_get(global.progress) >= 30)
{
    peppiness = 0.45
    shame = 1
    music_scene_set(-1)
    bus_set("foley_gameplay", -100)
    bus_set("vo_gameplay", -100)
    bus_set("ambience_gameplay", -100)
}
else if (data_get(global.progress) >= 32 && data_get(global.progress) < 33)
    music_scene_set(-1)
swimming_nose_dir = 0
swimming_nose_path = ds_list_create()
swimming_nose_path_len = 2
swimming_nose_x = x
swimming_nose_y = y
repeat swimming_nose_path_len
{
    ds_list_insert(swimming_nose_path, 0, swimming_nose_dir)
    ds_list_insert(swimming_nose_path, 0, y)
    ds_list_insert(swimming_nose_path, 0, x)
}
swimg = 0
foley_frame = -1
painted_save = 0
prunusgoodbye = 0
brush_default_angle = 40
brush_angle = brush_default_angle
bounce_amount_default = bounce_amount
in_hSpeed = 0
in_vSpeed = 0
holding_swim = 0
last_color = 1
bouncing = 0
onshroom = 0
particles = part_system_create()
part_system_depth(particles, (-((room_height * 5))))
part_water = part_type_create()
part_type_sprite(part_water, 2709, 0, 0, 1)
part_type_gravity(part_water, 0.8, 270)
part_type_direction(part_water, 45, 135, 0, 0)
part_type_speed(part_water, 8, 12, 0, 0)
part_type_alpha3(part_water, 1, 1, 0)
part_type_life(part_water, 15, 25)
part_type_orientation(part_water, 0, 360, 0, 0, 0)
part_type_size(part_water, 0.75, 1.5, 0, 0)
part_emitter = part_emitter_create(particles)
updown = 0
respawn_x = ""
respawn_y = ""
respawn_z = z
respawn_blink = 0
respawn_time = 0
respawning = 0
last_paint = 1
hits = 0
hit_anim = 0
puppet = 0
image_speed = 0
image_index = 0
for (var i = (global.cur_players - 1); i >= 0; i -= 1)
{
    global.brush_obj[i] = instance_create_depth(x, y, depth, objBrush)
    global.cursor_x[i] = x
    global.cursor_y[i] = y
    if (data_get(("brush_color_" + string(i))) > 0)
    {
        with (global.brush_obj[i])
        {
            brush_color = data_get(("brush_color_" + string(i)))
            if (brush_color < 4 || brush_color >= global.the_levelobj.paint.paint_colors)
                brush_color %= global.the_levelobj.paint.brush_colors
        }
    }
    if (data_get(("brush_size_" + string(i))) > 0)
        global.brush_obj[i].brush_size = data_get(("brush_size_" + string(i)))
    global.brush_obj[i].player_id = i
}
brush = global.brush_obj[0]
if (data_get(global.progress) < 2 && (!((global.SHOW && is_level("title")))))
{
    with (objBrush)
    {
        broom = 1
        brush_size_index = 0
    }
}
painted = 1
for (i = 2; i >= 0; i -= 1)
{
    color_part[i] = data_get(("color_part_" + string(i)))
    if (color_part[i] <= 0)
        color_part[i] = 16777215
    if (color_part[i] == 16777215)
        painted = 0
}
painted_color = -1
fall_delay = 0
fall_delaymax = (room_speed / 16)
fall_height = 0
fall_speed = 0
head_x = x
head_y = y
head_ha = 0
hat_spr = -1
body_x = x
body_y = y
body_ha = 0
floating = 0
dash_anim = 0
dash_dist = 252
dash_time = (room_speed / 3)
dash_dir = 0
squish_anim = 0
stroke = 1
wearing_layer2 = 0
paintable_frame = 0
painted_start = 1
can_move_frame = 1
can_walk_frame = 1
can_swim_frame = 1
swimming = 0
swimming_wall = 0
swimming_ydamp = 0.8
swimming_vspeed = 0
swimming_gravity = 0.3
swimming_fallmax = 2
swimming_frame = 0
in_shallows = 0
paddling = 0
scale = 1
image_xscale = scale
if (x > (room_width / 2))
    image_xscale = (-image_xscale)
image_yscale = scale
action = 0
interact_prio = ds_priority_create()
prompting = -4
prompting_p = -4
prompting_last = -4
prompt_anim = 0
prompt_popup = 0
transitioning = 0
animation = "idle"
animation_p = animation
facing_p = facing
animation_index = 0
animation_speed = 1
scene_anim = ""
if (global.animation_map < 0)
{
    global.animation_map = ds_map_create()
    animation_create("idle", 1, 1, 0, list_of_maps(map_Create("x", -2.5, "y", -45.6, "ang", 0.32), map_Create("x", -2.2, "y", -45.05, "ang", 0.32), map_Create("x", -1.85, "y", -46.2, "ang", 0.32), map_Create("x", -2.45, "y", -48.65, "ang", 0.45), map_Create("x", -2.75, "y", -49.5, "ang", 0.32), map_Create("x", -2.75, "y", -49.9, "ang", 0.32), map_Create("x", -2.75, "y", -47.75, "ang", 0.32), map_Create("x", -2.5, "y", -46.85, "ang", 0.32)), list_of_maps(map_Create("x", -4.55, "y", -12.05, "ang", 0), map_Create("x", -4.3, "y", -12.3, "ang", 0), map_Create("x", -3.55, "y", -13.55, "ang", 0), map_Create("x", -4.1, "y", -14.05, "ang", 0), map_Create("x", -4.1, "y", -14.05, "ang", 0), map_Create("x", -4.05, "y", -14.05, "ang", 0), map_Create("x", -3.85, "y", -13.4, "ang", 0), map_Create("x", -3.95, "y", -12.3, "ang", 0)))
    animation_create("run", 1, 1, 0, list_of_maps(map_Create("x", -1.85, "y", -48.15, "ang", 0.32), map_Create("x", -1.75, "y", -44.75, "ang", 0.32), map_Create("x", -1.75, "y", -41.6, "ang", 0.32), map_Create("x", -1.8, "y", -46.25, "ang", 0.32), map_Create("x", -1.85, "y", -49.15, "ang", 0.32), map_Create("x", -1.85, "y", -43.7, "ang", 0.32), map_Create("x", -1.85, "y", -43.1, "ang", 0.32), map_Create("x", -1.85, "y", -45.6, "ang", 0.32)), list_of_maps(map_Create("x", -3.85, "y", -11.5, "ang", 0), map_Create("x", -3.85, "y", -7, "ang", 0), map_Create("x", -3.85, "y", -8.75, "ang", 0), map_Create("x", -3.85, "y", -14.1, "ang", 0), map_Create("x", -3.8, "y", -13, "ang", 0), map_Create("x", -3.85, "y", -7.5, "ang", 0), map_Create("x", -3.85, "y", -8.3, "ang", 0), map_Create("x", -3.8, "y", -13.65, "ang", 0)))
    animation_create("runup", 1, 1, 0, list_of_maps(map_Create("x", -1.75, "y", -47.95, "ang", 0.32), map_Create("x", -1.75, "y", -44.65, "ang", 0.32), map_Create("x", -1.75, "y", -41.45, "ang", 0.32), map_Create("x", -1.75, "y", -46.15, "ang", 0.32), map_Create("x", -1.75, "y", -48.95, "ang", 0.32), map_Create("x", -1.75, "y", -43.5, "ang", 0.32), map_Create("x", -1.75, "y", -42.95, "ang", 0.32), map_Create("x", -1.7, "y", -45.5, "ang", 0.32)), list_of_maps(map_Create("x", -3.9, "y", -11.5, "ang", 0), map_Create("x", -3.9, "y", -7, "ang", 0), map_Create("x", -3.9, "y", -8.75, "ang", 0), map_Create("x", -3.9, "y", -14.15, "ang", 0), map_Create("x", -3.9, "y", -13, "ang", 0), map_Create("x", -3.9, "y", -7.5, "ang", 0), map_Create("x", -3.9, "y", -8.3, "ang", 0), map_Create("x", -3.9, "y", -13.7, "ang", 0)))
    animation_create("walk", 1, 1, 0, list_of_maps(map_Create("x", -1.65, "y", -40.95, "ang", 0.32), map_Create("x", -1.7, "y", -43.05, "ang", 0.32), map_Create("x", -1.75, "y", -46.25, "ang", 0.32), map_Create("x", -1.75, "y", -46.6, "ang", 0.32), map_Create("x", -1.65, "y", -40.65, "ang", 0.32), map_Create("x", -1.75, "y", -43.8, "ang", 0.32), map_Create("x", -1.75, "y", -45.55, "ang", 0.32), map_Create("x", -1.75, "y", -45.55, "ang", 0.32)), list_of_maps(map_Create("x", -3.8, "y", -8.75, "ang", 0), map_Create("x", -3.8, "y", -12, "ang", 0), map_Create("x", -3.8, "y", -13.65, "ang", 0), map_Create("x", -3.8, "y", -11, "ang", 0), map_Create("x", -3.8, "y", -8.75, "ang", 0), map_Create("x", -3.8, "y", -11.3, "ang", 0), map_Create("x", -3.8, "y", -12.95, "ang", 0), map_Create("x", -3.8, "y", -12, "ang", 0)))
    animation_create("walkup", 1, 1, 0, list_of_maps(map_Create("x", -1.7, "y", -45.5, "ang", 0.32), map_Create("x", -1.7, "y", -40.9, "ang", 0.32), map_Create("x", -1.7, "y", -43.05, "ang", 0.32), map_Create("x", -1.7, "y", -46.2, "ang", 0.32), map_Create("x", -1.7, "y", -46.55, "ang", 0.32), map_Create("x", -1.7, "y", -40.6, "ang", 0.32), map_Create("x", -1.7, "y", -43.75, "ang", 0.32), map_Create("x", -1.7, "y", -45.5, "ang", 0.32)), list_of_maps(map_Create("x", -3.8, "y", -11.9, "ang", 0), map_Create("x", -3.8, "y", -8.65, "ang", 0), map_Create("x", -3.8, "y", -11.9, "ang", 0), map_Create("x", -3.7, "y", -13.55, "ang", 0), map_Create("x", -3.7, "y", -10.9, "ang", 0), map_Create("x", -3.7, "y", -8.65, "ang", 0), map_Create("x", -3.7, "y", -11.2, "ang", 0), map_Create("x", -3.7, "y", -12.85, "ang", 0)))
    animation_create("jump", (sprite_get_number(sprDog_jump_A) / dash_time), 0, 1, list_of_maps(map_Create("x", 4.5, "y", -38.25, "ang", -12.92), map_Create("x", 8.85, "y", -38.85, "ang", -71.63), map_Create("x", 11.7, "y", -41.15, "ang", -142.03), map_Create("x", 7.8, "y", -32.65, "ang", 147.28), map_Create("x", -7.75, "y", -37.4, "ang", 53.44), map_Create("x", -13.55, "y", -45, "ang", 24.44), map_Create("x", -12.2, "y", -47.95, "ang", 9.05), map_Create("x", -7.05, "y", -51.25, "ang", 6.11), map_Create("x", -3.45, "y", -42, "ang", 6.11), map_Create("x", -3.15, "y", -42.8, "ang", -1.52), map_Create("x", -2.5, "y", -45.6, "ang", 0.32)), list_of_maps(map_Create("x", -16.05, "y", -13.85, "ang", 25.94), map_Create("x", -19.15, "y", -35.95, "ang", 61.49), map_Create("x", -14.25, "y", -56.3, "ang", 95.48), map_Create("x", 13.15, "y", -62, "ang", 165.68), map_Create("x", 21.2, "y", -30.05, "ang", -100.44), map_Create("x", 12.05, "y", -23.3, "ang", -64.92), map_Create("x", 2.85, "y", -20, "ang", -33.04), map_Create("x", 0.95, "y", -17.95, "ang", -17.16), map_Create("x", 1.05, "y", -11.5, "ang", -17.16), map_Create("x", -3.75, "y", -10.45, "ang", -2.45), map_Create("x", -4.55, "y", -12.05, "ang", 0)))
    animation_create("jump_speed", (sprite_get_number(sprDog_jump_A) / dash_time), 0, 1, list_of_maps(map_Create("x", 4.5, "y", -38.25, "ang", -12.92), map_Create("x", 8.85, "y", -38.85, "ang", -71.63), map_Create("x", 11.7, "y", -41.15, "ang", -142.03), map_Create("x", 7.8, "y", -32.65, "ang", 147.28), map_Create("x", -7.75, "y", -37.4, "ang", 53.44), map_Create("x", -13.55, "y", -45, "ang", 24.44), map_Create("x", -12.2, "y", -47.95, "ang", 9.05), map_Create("x", -7.05, "y", -51.25, "ang", 6.11), map_Create("x", -3.45, "y", -42, "ang", 6.11), map_Create("x", -3.15, "y", -42.8, "ang", -1.52), map_Create("x", -2.5, "y", -45.6, "ang", 0.32)), list_of_maps(map_Create("x", -16.05, "y", -13.85, "ang", 25.94), map_Create("x", -19.15, "y", -35.95, "ang", 61.49), map_Create("x", -14.25, "y", -56.3, "ang", 95.48), map_Create("x", 13.15, "y", -62, "ang", 165.68), map_Create("x", 21.2, "y", -30.05, "ang", -100.44), map_Create("x", 12.05, "y", -23.3, "ang", -64.92), map_Create("x", 2.85, "y", -20, "ang", -33.04), map_Create("x", 0.95, "y", -17.95, "ang", -17.16), map_Create("x", 1.05, "y", -11.5, "ang", -17.16), map_Create("x", -3.75, "y", -10.45, "ang", -2.45), map_Create("x", -4.55, "y", -12.05, "ang", 0)))
    animation_create("bob", 0.13333333333333333, 1, 0, list_of_maps(map_Create("x", 0.3, "y", 0.75, "ang", 9.72), map_Create("x", 0.3, "y", 1.05, "ang", 10.17), map_Create("x", 0.3, "y", 2.05, "ang", 11.2), map_Create("x", 0.3, "y", 2.8, "ang", 10.95), map_Create("x", 0.3, "y", 2.95, "ang", 9.72), map_Create("x", 0.3, "y", 2.05, "ang", 9.28), map_Create("x", 0.3, "y", 1, "ang", 8.57), map_Create("x", 0.3, "y", 0.7, "ang", 8.77)), list_of_maps())
    animation_create("paddle", 1, 1, 0, list_of_maps(map_Create("x", 0.3, "y", -0.35, "ang", 9.72), map_Create("x", 0.75, "y", 3.75, "ang", 10.43), map_Create("x", 0.3, "y", 2.05, "ang", 9.72), map_Create("x", -0.25, "y", -1.1, "ang", 8.5), map_Create("x", -0.35, "y", -1.85, "ang", 9.72), map_Create("x", 1.5, "y", 1.55, "ang", 14.72), map_Create("x", 0.75, "y", 2.55, "ang", 11.94), map_Create("x", 0.2, "y", -1.05, "ang", 9.72)), list_of_maps())
    animation_create("hop_up", 0.16666666666666666, "sit", 0, list_of_maps(map_Create("x", -2.5, "y", -45.6, "ang", -0.32), map_Create("x", -1.5, "y", -44.6, "ang", -0.32), map_Create("x", 5.75, "y", -34.15, "ang", -0.32), map_Create("x", 5.75, "y", -33.25, "ang", -1.98), map_Create("x", -9.8, "y", -87.3, "ang", -3.54), map_Create("x", -10.95, "y", -87.5, "ang", -1.14), map_Create("x", -5.3, "y", -73.25, "ang", -10.97), map_Create("x", -13.6, "y", -78.7, "ang", -10.97), map_Create("x", -14.9, "y", -79.85, "ang", -7.86)), list_of_maps(map_Create("x", -4.55, "y", -12.05, "ang", 0), map_Create("x", -4.05, "y", -10.55, "ang", -1.48), map_Create("x", -2.25, "y", -7.05, "ang", -3.69), map_Create("x", -2.25, "y", -6.15, "ang", -5.43), map_Create("x", -11.9, "y", -53.25, "ang", -3.69), map_Create("x", -12.7, "y", -51.05, "ang", -0.32), map_Create("x", -13.25, "y", -46.9, "ang", -2.81), map_Create("x", -13.25, "y", -47.35, "ang", -5.69), map_Create("x", -13.25, "y", -47.35, "ang", -7.93)))
    animation_create("hop_down", 0.2, "idle", 0, list_of_maps(map_Create("x", -12.65, "y", -77.95, "ang", -6.14), map_Create("x", -5.85, "y", -74.6, "ang", -0.84), map_Create("x", -0.6, "y", -65.6, "ang", -9.77), map_Create("x", 5.4, "y", -52.4, "ang", -11.44), map_Create("x", 4.6, "y", -38.8, "ang", -3.65), map_Create("x", 2.1, "y", -37.15, "ang", -3.55), map_Create("x", -1, "y", -43.6, "ang", -2.39), map_Create("x", -2.5, "y", -45.6, "ang", -0.32)), list_of_maps(map_Create("x", -11.9, "y", -46.9, "ang", -10.65), map_Create("x", -6.1, "y", -41.1, "ang", -14.15), map_Create("x", -4.45, "y", -28.35, "ang", -8.91), map_Create("x", -2.85, "y", -16.75, "ang", -0.71), map_Create("x", -1, "y", -7.55, "ang", -0.71), map_Create("x", -1.8, "y", -9.55, "ang", -1.87), map_Create("x", -3.4, "y", -11.15, "ang", -1.27), map_Create("x", -4.55, "y", -12.05, "ang", 0)))
    animation_create("hop_down_slow", 0.1, "idle", 0, list_of_maps(map_Create("x", -12.65, "y", -77.95, "ang", -6.14), map_Create("x", -5.85, "y", -74.6, "ang", -0.84), map_Create("x", -0.6, "y", -65.6, "ang", -9.77), map_Create("x", 5.4, "y", -52.4, "ang", -11.44), map_Create("x", 4.6, "y", -38.8, "ang", -3.65), map_Create("x", 2.1, "y", -37.15, "ang", -3.55), map_Create("x", -1, "y", -43.6, "ang", -2.39), map_Create("x", -2.5, "y", -45.6, "ang", -0.32)), list_of_maps(map_Create("x", -11.9, "y", -46.9, "ang", -10.65), map_Create("x", -6.1, "y", -41.1, "ang", -14.15), map_Create("x", -4.45, "y", -28.35, "ang", -8.91), map_Create("x", -2.85, "y", -16.75, "ang", -0.71), map_Create("x", -1, "y", -7.55, "ang", -0.71), map_Create("x", -1.8, "y", -9.55, "ang", -1.87), map_Create("x", -3.4, "y", -11.15, "ang", -1.27), map_Create("x", -4.55, "y", -12.05, "ang", 0)))
    animation_create("sit", 0.16666666666666666, 1, 0, list_of_maps(map_Create("x", -14.9, "y", -79.85, "ang", -7.86), map_Create("x", -15.1, "y", -80.15, "ang", -7.16), map_Create("x", -15.65, "y", -80.5, "ang", -6.22), map_Create("x", -15.2, "y", -80.5, "ang", -5.46), map_Create("x", -15.15, "y", -80.25, "ang", -7.18), map_Create("x", -15.7, "y", -79.95, "ang", -8.4), map_Create("x", -15.3, "y", -79.6, "ang", -8.09), map_Create("x", -14.95, "y", -79.6, "ang", -7.65)), list_of_maps(map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -8.88), map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -7.23), map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -9.89), map_Create("x", -13.25, "y", -47.35, "ang", -9.18), map_Create("x", -13.25, "y", -47.35, "ang", -8.41)))
    animation_create("doze", 0.08333333333333333, "snooze", 0, list_of_maps(map_Create("x", -14.9, "y", -79.85, "ang", -7.86), map_Create("x", -14.65, "y", -79.55, "ang", -8.26), map_Create("x", -14.35, "y", -79.25, "ang", -8.97), map_Create("x", -13.85, "y", -78.95, "ang", -9.87), map_Create("x", -11.2, "y", -77.65, "ang", -14.54), map_Create("x", -11.6, "y", -78.65, "ang", -12.84), map_Create("x", -11.85, "y", -79, "ang", -11.63), map_Create("x", -12.05, "y", -79.2, "ang", -11.19), map_Create("x", -11.95, "y", -79.1, "ang", -11.5), map_Create("x", -11.85, "y", -79, "ang", -11.95), map_Create("x", -11.6, "y", -78.45, "ang", -12.58), map_Create("x", -11.65, "y", -77.9, "ang", -13.47), map_Create("x", -11.7, "y", -77.25, "ang", -14.51), map_Create("x", -11.85, "y", -77.05, "ang", -15.5)), list_of_maps(map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -7.49), map_Create("x", -13.25, "y", -47.35, "ang", -6.23), map_Create("x", -13.3, "y", -47.35, "ang", -7.98), map_Create("x", -13.25, "y", -47.35, "ang", -9.47), map_Create("x", -13.25, "y", -47.35, "ang", -9.89), map_Create("x", -13.25, "y", -47.35, "ang", -9.64), map_Create("x", -13.25, "y", -47.35, "ang", -9.09), map_Create("x", -13.25, "y", -47.35, "ang", -8.57), map_Create("x", -13.25, "y", -47.35, "ang", -7.93), map_Create("x", -13.25, "y", -47.35, "ang", -7.49), map_Create("x", -13.25, "y", -47.35, "ang", -8.4), map_Create("x", -13.25, "y", -47.35, "ang", -8.64)))
    animation_create("snooze", 0.08333333333333333, 1, 0, list_of_maps(map_Create("x", -11.85, "y", -77.05, "ang", -16.21), map_Create("x", -11.85, "y", -77.5, "ang", -16.21), map_Create("x", -11.8, "y", -77.75, "ang", -16.08), map_Create("x", -11.8, "y", -78.05, "ang", -15.76), map_Create("x", -11.8, "y", -78.2, "ang", -15.45), map_Create("x", -11.8, "y", -78.2, "ang", -15.13), map_Create("x", -11.8, "y", -78.05, "ang", -15.13), map_Create("x", -11.8, "y", -77.75, "ang", -15.13), map_Create("x", -11.8, "y", -77.3, "ang", -15.45), map_Create("x", -11.9, "y", -77.2, "ang", -15.91), map_Create("x", -11.85, "y", -77.05, "ang", -16.21)), list_of_maps(map_Create("x", -13.25, "y", -47.35, "ang", -8.93), map_Create("x", -13.25, "y", -47.35, "ang", -9.2), map_Create("x", -13.25, "y", -47.35, "ang", -9.52), map_Create("x", -13.25, "y", -47.35, "ang", -9.83), map_Create("x", -13.25, "y", -47.35, "ang", -9.83), map_Create("x", -13.25, "y", -47.35, "ang", -9.83), map_Create("x", -13.25, "y", -47.35, "ang", -9.97), map_Create("x", -13.25, "y", -47.35, "ang", -9.52), map_Create("x", -13.25, "y", -47.35, "ang", -9.2), map_Create("x", -13.25, "y", -47.35, "ang", -8.93), map_Create("x", -13.25, "y", -47.35, "ang", -8.93)))
    animation_create("knockdown", 0.2, 0, 0, list_of_maps(map_Create("x", 23.5, "y", -45.6, "ang", 0.32), map_Create("x", 18.5, "y", -43.6, "ang", 0.32), map_Create("x", 7.8, "y", -49.2, "ang", -2.78), map_Create("x", 3.5, "y", -48.05, "ang", -4.16), map_Create("x", -2.95, "y", -38.6, "ang", 7.75), map_Create("x", -18.95, "y", -36.2, "ang", 15.48), map_Create("x", -18.1, "y", -33.15, "ang", 22.92), map_Create("x", -23.95, "y", -34.35, "ang", -18.09), map_Create("x", -24.1, "y", -36.8, "ang", -7.65), map_Create("x", -25, "y", -37.8, "ang", -5.98)), list_of_maps(map_Create("x", 21.45, "y", -12.05, "ang", 0), map_Create("x", 16.5, "y", -12.05, "ang", -8.19), map_Create("x", 7.95, "y", -17.15, "ang", -11.65), map_Create("x", 6.3, "y", -16.35, "ang", -19.61), map_Create("x", 4.7, "y", -5.5, "ang", -37.14), map_Create("x", 2.25, "y", -11.7, "ang", -60.23), map_Create("x", -1.65, "y", -5.7, "ang", -44.27), map_Create("x", -12.55, "y", -3.7, "ang", -23.12), map_Create("x", -14.55, "y", -3.7, "ang", -23.12), map_Create("x", -15.55, "y", -3.7, "ang", -23.12)))
    animation_create("knockdown_fast", 0.4, 0, 0, list_of_maps(map_Create("x", 23.5, "y", -45.6, "ang", 0.32), map_Create("x", 18.5, "y", -43.6, "ang", 0.32), map_Create("x", 7.8, "y", -49.2, "ang", -2.78), map_Create("x", 3.5, "y", -48.05, "ang", -4.16), map_Create("x", -2.95, "y", -38.6, "ang", 7.75), map_Create("x", -18.95, "y", -36.2, "ang", 15.48), map_Create("x", -18.1, "y", -33.15, "ang", 22.92), map_Create("x", -23.95, "y", -34.35, "ang", -18.09), map_Create("x", -24.1, "y", -36.8, "ang", -7.65), map_Create("x", -25, "y", -37.8, "ang", -5.98)), list_of_maps(map_Create("x", 21.45, "y", -12.05, "ang", 0), map_Create("x", 16.5, "y", -12.05, "ang", -8.19), map_Create("x", 7.95, "y", -17.15, "ang", -11.65), map_Create("x", 6.3, "y", -16.35, "ang", -19.61), map_Create("x", 4.7, "y", -5.5, "ang", -37.14), map_Create("x", 2.25, "y", -11.7, "ang", -60.23), map_Create("x", -1.65, "y", -5.7, "ang", -44.27), map_Create("x", -12.55, "y", -3.7, "ang", -23.12), map_Create("x", -14.55, "y", -3.7, "ang", -23.12), map_Create("x", -15.55, "y", -3.7, "ang", -23.12)))
    animation_create("knockdown_inst", 0.4, 0, 0, list_of_maps(map_Create("x", 23.5, "y", -45.6, "ang", 0.32), map_Create("x", 18.5, "y", -43.6, "ang", 0.32), map_Create("x", 7.8, "y", -49.2, "ang", -2.78), map_Create("x", 3.5, "y", -48.05, "ang", -4.16), map_Create("x", -2.95, "y", -38.6, "ang", 7.75), map_Create("x", -18.95, "y", -36.2, "ang", 15.48), map_Create("x", -18.1, "y", -33.15, "ang", 22.92), map_Create("x", -23.95, "y", -34.35, "ang", -18.09), map_Create("x", -24.1, "y", -36.8, "ang", -7.65), map_Create("x", -25, "y", -37.8, "ang", -5.98)), list_of_maps(map_Create("x", 21.45, "y", -12.05, "ang", 0), map_Create("x", 16.5, "y", -12.05, "ang", -8.19), map_Create("x", 7.95, "y", -17.15, "ang", -11.65), map_Create("x", 6.3, "y", -16.35, "ang", -19.61), map_Create("x", 4.7, "y", -5.5, "ang", -37.14), map_Create("x", 2.25, "y", -11.7, "ang", -60.23), map_Create("x", -1.65, "y", -5.7, "ang", -44.27), map_Create("x", -12.55, "y", -3.7, "ang", -23.12), map_Create("x", -14.55, "y", -3.7, "ang", -23.12), map_Create("x", -15.55, "y", -3.7, "ang", -23.12)))
    animation_create("phone", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", -12.05, "y", -45.75, "ang", 12.17), map_Create("x", -12.35, "y", -45.7, "ang", 12.49), map_Create("x", -12.8, "y", -45.65, "ang", 12.81), map_Create("x", -13.7, "y", -45.6, "ang", 13.25), map_Create("x", -14.55, "y", -45.5, "ang", 14.02), map_Create("x", -14.85, "y", -45.45, "ang", 14.33), map_Create("x", -15.25, "y", -45.45, "ang", 14.65), map_Create("x", -15.3, "y", -45.4, "ang", 14.97), map_Create("x", -15.15, "y", -45.55, "ang", 14.84), map_Create("x", -14.95, "y", -45.6, "ang", 14.73), map_Create("x", -14.6, "y", -45.7, "ang", 14.02), map_Create("x", -13.55, "y", -45.75, "ang", 13.51), map_Create("x", -12.7, "y", -45.8, "ang", 12.81), map_Create("x", -12.35, "y", -45.85, "ang", 12.49)), list_of_maps(map_Create("x", -5.75, "y", -11.55, "ang", -14.4), map_Create("x", -5.9, "y", -11.55, "ang", -14.4), map_Create("x", -6.05, "y", -11.55, "ang", -15.03), map_Create("x", -6.3, "y", -11.55, "ang", -15.48), map_Create("x", -6.45, "y", -11.55, "ang", -15.8), map_Create("x", -6.6, "y", -11.55, "ang", -16.12), map_Create("x", -6.75, "y", -11.5, "ang", -16.57), map_Create("x", -6.75, "y", -11.5, "ang", -16.57), map_Create("x", -6.6, "y", -11.55, "ang", -16.25), map_Create("x", -6.45, "y", -11.55, "ang", -15.81), map_Create("x", -6.25, "y", -11.5, "ang", -15.8), map_Create("x", -6, "y", -11.6, "ang", -14.93), map_Create("x", -5.9, "y", -11.55, "ang", -14.4), map_Create("x", -5.9, "y", -11.55, "ang", -14.4)))
    animation_create("pet", 0.21666666666666667, "idle", 0, list_of_maps(map_Create("x", 7.95, "y", -46.1, "ang", 7.36), map_Create("x", 8.7, "y", -45.85, "ang", 7.36), map_Create("x", 11.1, "y", -45.65, "ang", 8.13), map_Create("x", 13.05, "y", -46.1, "ang", 9.29), map_Create("x", 13.7, "y", -46.6, "ang", 10.32), map_Create("x", 13.95, "y", -46.75, "ang", 10.65), map_Create("x", 14.05, "y", -46.9, "ang", 10.78), map_Create("x", 13.95, "y", -46.75, "ang", 10.65), map_Create("x", 13.7, "y", -46.6, "ang", 10.32), map_Create("x", 13.05, "y", -46.1, "ang", 9.29), map_Create("x", 11.1, "y", -45.65, "ang", 8.13), map_Create("x", 8.9, "y", -45.9, "ang", 7.36), map_Create("x", 8.15, "y", -46.05, "ang", 7.36)), list_of_maps(map_Create("x", 4.3, "y", -11.4, "ang", 13.46), map_Create("x", 4.6, "y", -11.35, "ang", 13.78), map_Create("x", 5.65, "y", -11.2, "ang", 15.13), map_Create("x", 6.55, "y", -11.1, "ang", 16.04), map_Create("x", 6.85, "y", -11.05, "ang", 16.04), map_Create("x", 7.15, "y", -11.15, "ang", 16.04), map_Create("x", 7.3, "y", -11.15, "ang", 16.1), map_Create("x", 7.15, "y", -11.15, "ang", 16.04), map_Create("x", 6.85, "y", -11.05, "ang", 16.04), map_Create("x", 6.55, "y", -11.1, "ang", 16.04), map_Create("x", 5.65, "y", -11.2, "ang", 15.13), map_Create("x", 4.8, "y", -11.35, "ang", 14.48), map_Create("x", 4.45, "y", -11.35, "ang", 13.8)))
    animation_create("item", 0.25, 0, 1.25, list_of_maps(map_Create("x", -1.85, "y", -45, "ang", 0.32), map_Create("x", -2.65, "y", -44.65, "ang", -1.05), map_Create("x", -5.15, "y", -43.95, "ang", -6.94), map_Create("x", -2.75, "y", -36.9, "ang", -9.96), map_Create("x", 6.5, "y", -38.15, "ang", 2.63), map_Create("x", 10.45, "y", -52.4, "ang", 18.1), map_Create("x", 9.8, "y", -55.1, "ang", 25.83), map_Create("x", 9.75, "y", -55.4, "ang", 27.28), map_Create("x", 9.75, "y", -55.4, "ang", 27.59)), list_of_maps(map_Create("x", -3.9, "y", -11.45, "ang", 0), map_Create("x", -4.2, "y", -10.75, "ang", 3.17), map_Create("x", -3.4, "y", -8.55, "ang", 10.24), map_Create("x", -2, "y", -6.8, "ang", 6.03), map_Create("x", 0.25, "y", -9.2, "ang", 2.26), map_Create("x", 4.6, "y", -14.3, "ang", 1.79), map_Create("x", 5.5, "y", -16, "ang", 4.21), map_Create("x", 5.55, "y", -16.4, "ang", 4.67), map_Create("x", 5.55, "y", -16.4, "ang", 5.23)))
    animation_create("item_fast", 0.75, 0, 1.5, list_of_maps(map_Create("x", -1.85, "y", -45, "ang", 0.32), map_Create("x", -2.65, "y", -44.65, "ang", -1.05), map_Create("x", -5.15, "y", -43.95, "ang", -6.94), map_Create("x", -2.75, "y", -36.9, "ang", -9.96), map_Create("x", 6.5, "y", -38.15, "ang", 2.63), map_Create("x", 10.45, "y", -52.4, "ang", 18.1), map_Create("x", 9.8, "y", -55.1, "ang", 25.83), map_Create("x", 9.75, "y", -55.4, "ang", 27.28), map_Create("x", 9.75, "y", -55.4, "ang", 27.59)), list_of_maps(map_Create("x", -3.9, "y", -11.45, "ang", 0), map_Create("x", -4.2, "y", -10.75, "ang", 3.17), map_Create("x", -3.4, "y", -8.55, "ang", 10.24), map_Create("x", -2, "y", -6.8, "ang", 6.03), map_Create("x", 0.25, "y", -9.2, "ang", 2.26), map_Create("x", 4.6, "y", -14.3, "ang", 1.79), map_Create("x", 5.5, "y", -16, "ang", 4.21), map_Create("x", 5.55, "y", -16.4, "ang", 4.67), map_Create("x", 5.55, "y", -16.4, "ang", 5.23)))
    animation_create("transit", 0.13333333333333333, 0, 1, list_of_maps(map_Create("x", -15.85, "y", -80.1, "ang", -11.22), map_Create("x", -18, "y", -78.45, "ang", -14.85), map_Create("x", -18.4, "y", -78.2, "ang", -15.55), map_Create("x", -18.6, "y", -78.15, "ang", -15.56), map_Create("x", -7.8, "y", -84.35, "ang", 4.92), map_Create("x", -8.55, "y", -83.3, "ang", 4.2), map_Create("x", -9.45, "y", -82.4, "ang", 4.22), map_Create("x", -9.75, "y", -81.8, "ang", 4.22), map_Create("x", -9.9, "y", -81.8, "ang", 3.76)), list_of_maps(map_Create("x", -12.65, "y", -47.05, "ang", 11.9), map_Create("x", -13.75, "y", -47.5, "ang", 15.86), map_Create("x", -13.95, "y", -47.6, "ang", 16.57), map_Create("x", -13.95, "y", -47.6, "ang", 16.63), map_Create("x", -12.25, "y", -47.65, "ang", 3.54), map_Create("x", -12.25, "y", -47.65, "ang", 4.53), map_Create("x", -12.55, "y", -47.4, "ang", 2.61), map_Create("x", -12.55, "y", -47.4, "ang", 1.67), map_Create("x", -12.55, "y", -47.4, "ang", 1.67)))
    animation_create("slouch", 0.1, 1, (0.85 / bounce_amount_default), list_of_maps(map_Create("x", 1.5, "y", -42.05, "ang", -23.18), map_Create("x", 1.9, "y", -42.05, "ang", -23.18), map_Create("x", 2.3, "y", -41.85, "ang", -23.18), map_Create("x", 2.9, "y", -41.25, "ang", -23.18), map_Create("x", 2.9, "y", -41.05, "ang", -23.18), map_Create("x", 2.7, "y", -41.25, "ang", -23.18), map_Create("x", 1.9, "y", -41.65, "ang", -23.18), map_Create("x", 1.7, "y", -41.85, "ang", -23.18)), list_of_maps(map_Create("x", -4, "y", -9.9, "ang", 2.94), map_Create("x", -3.8, "y", -9.9, "ang", 3.39), map_Create("x", -3.6, "y", -9.9, "ang", 3.39), map_Create("x", -3.2, "y", -9.7, "ang", 3.39), map_Create("x", -3, "y", -9.7, "ang", 3.72), map_Create("x", -3.4, "y", -9.9, "ang", 4.1), map_Create("x", -3.8, "y", -9.9, "ang", 3.42), map_Create("x", -3.8, "y", -9.9, "ang", 3.12)))
    animation_create("smit", 0.13333333333333333, 1, 1.1, list_of_maps(map_Create("x", 17.25, "y", -51.85, "ang", 16.67), map_Create("x", 16.85, "y", -49.85, "ang", 16.67), map_Create("x", 16.45, "y", -49.05, "ang", 16.67), map_Create("x", 15.75, "y", -48.7, "ang", 16.13)), list_of_maps(map_Create("x", 9.4, "y", -15.7, "ang", 28.35), map_Create("x", 9.4, "y", -14.1, "ang", 27.34), map_Create("x", 9.4, "y", -13.7, "ang", 26.39), map_Create("x", 9.7, "y", -12.85, "ang", 24.87)))
    animation_create("droop", 0.1, 1, (0.85 / bounce_amount_default), list_of_maps(map_Create("x", -0.65, "y", -42.3, "ang", -27.07), map_Create("x", -0.85, "y", -42.7, "ang", -27.52), map_Create("x", -1.6, "y", -43.5, "ang", -29.07), map_Create("x", -2.7, "y", -45.05, "ang", -30.39), map_Create("x", -3.1, "y", -45.6, "ang", -30.78), map_Create("x", -3.35, "y", -46.1, "ang", -31.24), map_Create("x", -3.25, "y", -46.05, "ang", -30.75), map_Create("x", -2.8, "y", -45.85, "ang", -30.02), map_Create("x", -1.95, "y", -45.75, "ang", -29.03), map_Create("x", -0.85, "y", -44.3, "ang", -24.69), map_Create("x", 0.15, "y", -43.4, "ang", -22.5), map_Create("x", -0.1, "y", -42.35, "ang", -24.79), map_Create("x", -0.7, "y", -42.3, "ang", -26.52)), list_of_maps(map_Create("x", -4.3, "y", -9.85, "ang", 1.48), map_Create("x", -4.3, "y", -9.85, "ang", 1.95), map_Create("x", -4.55, "y", -10.05, "ang", 3.13), map_Create("x", -4.8, "y", -10.3, "ang", 3.84), map_Create("x", -4.95, "y", -10.55, "ang", 3.84), map_Create("x", -5.1, "y", -10.65, "ang", 3.73), map_Create("x", -4.95, "y", -10.55, "ang", 3.84), map_Create("x", -4.8, "y", -10.3, "ang", 3.84), map_Create("x", -4.3, "y", -10.1, "ang", 2.41), map_Create("x", -4.3, "y", -9.85, "ang", 1.48), map_Create("x", -4.3, "y", -9.6, "ang", 1.48)))
    animation_create("startled", 0.13333333333333333, 1, 1.1, list_of_maps(map_Create("x", -14.05, "y", -54.3, "ang", 4.66), map_Create("x", -14.05, "y", -55.35, "ang", 4.66), map_Create("x", -14.05, "y", -54.65, "ang", 4.66), map_Create("x", -13.75, "y", -55.4, "ang", 4.66)), list_of_maps(map_Create("x", -5.65, "y", -15.2, "ang", -8.48), map_Create("x", -5.3, "y", -15.55, "ang", -8.48), map_Create("x", -5.65, "y", -15.2, "ang", -8.48), map_Create("x", -5.25, "y", -15.55, "ang", -8.68)))
    animation_create("lean", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", 12.25, "y", -45.6, "ang", 2), map_Create("x", 13, "y", -45.3, "ang", 2), map_Create("x", 15.4, "y", -44.85, "ang", 2.78), map_Create("x", 17.35, "y", -45.15, "ang", 3.93), map_Create("x", 18.05, "y", -45.55, "ang", 4.97), map_Create("x", 18.3, "y", -45.7, "ang", 5.31), map_Create("x", 18.45, "y", -45.85, "ang", 5.43), map_Create("x", 18.3, "y", -45.7, "ang", 5.31), map_Create("x", 18.05, "y", -45.55, "ang", 4.97), map_Create("x", 17.35, "y", -45.15, "ang", 3.93), map_Create("x", 15.4, "y", -44.85, "ang", 2.78), map_Create("x", 13.2, "y", -45.3, "ang", 2), map_Create("x", 12.45, "y", -45.55, "ang", 2)), list_of_maps(map_Create("x", 3.2, "y", -11.75, "ang", 5.97), map_Create("x", 3.55, "y", -11.75, "ang", 6.29), map_Create("x", 4.6, "y", -11.75, "ang", 7.65), map_Create("x", 5.5, "y", -11.75, "ang", 8.55), map_Create("x", 5.8, "y", -11.75, "ang", 8.55), map_Create("x", 6.1, "y", -11.9, "ang", 8.55), map_Create("x", 6.25, "y", -11.9, "ang", 8.62), map_Create("x", 6.1, "y", -11.9, "ang", 8.55), map_Create("x", 5.8, "y", -11.75, "ang", 8.55), map_Create("x", 5.5, "y", -11.75, "ang", 8.55), map_Create("x", 4.6, "y", -11.75, "ang", 7.65), map_Create("x", 3.75, "y", -11.75, "ang", 7), map_Create("x", 3.4, "y", -11.75, "ang", 6.32)))
    animation_create("gasp", 0.13333333333333333, 1, 1.25, list_of_maps(map_Create("x", -22.4, "y", -52.85, "ang", 2), map_Create("x", -22.15, "y", -52.9, "ang", 1.7), map_Create("x", -22.8, "y", -53.05, "ang", 1.52), map_Create("x", -22.15, "y", -52.9, "ang", 1.7), map_Create("x", -22.4, "y", -52.85, "ang", 2), map_Create("x", -22.15, "y", -52.9, "ang", 1.7), map_Create("x", -22.8, "y", -53.05, "ang", 1.52), map_Create("x", -22.15, "y", -52.9, "ang", 1.7)), list_of_maps(map_Create("x", -12.15, "y", -12.05, "ang", -10.92), map_Create("x", -11.5, "y", -12.05, "ang", -11.15), map_Create("x", -12.3, "y", -12, "ang", -11.44), map_Create("x", -11.15, "y", -12.05, "ang", -10.53), map_Create("x", -12.2, "y", -12, "ang", -9.67), map_Create("x", -11.55, "y", -12, "ang", -11.02), map_Create("x", -12.35, "y", -12, "ang", -9.14), map_Create("x", -11.5, "y", -12, "ang", -10.55)))
    animation_create("hit", 0.16666666666666666, 1, 1.25, list_of_maps(map_Create("x", -6.65, "y", -46.8, "ang", -22.43)), list_of_maps(map_Create("x", -11.5, "y", -13.2, "ang", 1.1)))
    animation_create("toes", 0.16666666666666666, 1, 1, list_of_maps(map_Create("x", 0.6, "y", -56, "ang", 22.73), map_Create("x", 0.55, "y", -55.75, "ang", 22.37), map_Create("x", 0.25, "y", -55.4, "ang", 21.6), map_Create("x", 0.25, "y", -54.85, "ang", 20.54), map_Create("x", 0.25, "y", -54.65, "ang", 19.84), map_Create("x", 0.55, "y", -55.4, "ang", 22.37), map_Create("x", 0.55, "y", -55.75, "ang", 22.37)), list_of_maps(map_Create("x", 2.8, "y", -16.8, "ang", 1.73), map_Create("x", 2.8, "y", -16.25, "ang", 1.73), map_Create("x", 2.8, "y", -15.95, "ang", 2.05), map_Create("x", 3.1, "y", -15.3, "ang", 2.7), map_Create("x", 3.1, "y", -15.1, "ang", 2.7), map_Create("x", 2.8, "y", -16.25, "ang", 1.73), map_Create("x", 2.8, "y", -16.6, "ang", 1.73)))
    animation_create("lay", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", -32, "y", -12.25, "ang", 70.45)), list_of_maps(map_Create("x", 3.9, "y", -14.55, "ang", -91.56)))
    animation_create("hero", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", -5.45, "y", -49.75, "ang", 15.16), map_Create("x", -5.1, "y", -49.65, "ang", 17.35), map_Create("x", -5.1, "y", -49.65, "ang", 18.83), map_Create("x", -4.7, "y", -49.3, "ang", 19.85), map_Create("x", -4.4, "y", -48.95, "ang", 21.06), map_Create("x", -4.4, "y", -48.65, "ang", 21.77), map_Create("x", -4.4, "y", -48.95, "ang", 21.06), map_Create("x", -4.7, "y", -49.3, "ang", 19.85), map_Create("x", -5.1, "y", -49.9, "ang", 18.11), map_Create("x", -5.1, "y", -49.65, "ang", 17.35)), list_of_maps(map_Create("x", 2.5, "y", -14.7, "ang", -8.23), map_Create("x", 2.8, "y", -14.65, "ang", -8.99), map_Create("x", 3.25, "y", -14.6, "ang", -9.94), map_Create("x", 3.45, "y", -14.5, "ang", -10.18), map_Create("x", 3.6, "y", -14.25, "ang", -10.63), map_Create("x", 3.6, "y", -14, "ang", -11.08), map_Create("x", 3.6, "y", -14.25, "ang", -10.63), map_Create("x", 3.45, "y", -14.5, "ang", -10.18), map_Create("x", 3.25, "y", -14.6, "ang", -9.94), map_Create("x", 2.8, "y", -14.65, "ang", -8.99)))
    animation_create("think", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", -4.2, "y", -46.7, "ang", 17.66), map_Create("x", -3.85, "y", -46.65, "ang", 19.85), map_Create("x", -3.85, "y", -46.65, "ang", 21.32), map_Create("x", -3.4, "y", -46.3, "ang", 22.35), map_Create("x", -3.1, "y", -46, "ang", 23.56), map_Create("x", -3.1, "y", -45.7, "ang", 24.27), map_Create("x", -3.1, "y", -46, "ang", 23.56), map_Create("x", -3.4, "y", -46.3, "ang", 22.35), map_Create("x", -3.85, "y", -46.9, "ang", 20.61), map_Create("x", -3.85, "y", -46.65, "ang", 19.85)), list_of_maps(map_Create("x", 2.05, "y", -13.45, "ang", 11.68), map_Create("x", 2.35, "y", -13.4, "ang", 12.44), map_Create("x", 2.85, "y", -13.4, "ang", 13.39), map_Create("x", 3.05, "y", -13.3, "ang", 13.63), map_Create("x", 3.25, "y", -13.05, "ang", 14.08), map_Create("x", 3.25, "y", -12.8, "ang", 14.53), map_Create("x", 3.25, "y", -13.05, "ang", 14.08), map_Create("x", 3.05, "y", -13.3, "ang", 13.63), map_Create("x", 2.85, "y", -13.4, "ang", 13.39), map_Create("x", 2.35, "y", -13.4, "ang", 12.44)))
    animation_create("letter", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", -0.25, "y", -51.2, "ang", -22.66), map_Create("x", -0.45, "y", -51.3, "ang", -23.34), map_Create("x", -0.75, "y", -51.4, "ang", -24.84), map_Create("x", -1.05, "y", -51.5, "ang", -25.29), map_Create("x", -1.25, "y", -51.55, "ang", -25.61), map_Create("x", -1.15, "y", -51.5, "ang", -25.29), map_Create("x", -0.6, "y", -51.4, "ang", -24.84), map_Create("x", -0.2, "y", -51.3, "ang", -23.34)), list_of_maps(map_Create("x", 0.3, "y", -12.6, "ang", 1.23), map_Create("x", 0.15, "y", -12.6, "ang", 1.52), map_Create("x", -0.05, "y", -12.6, "ang", 1.85), map_Create("x", -0.15, "y", -12.55, "ang", 2.24), map_Create("x", -0.1, "y", -12.5, "ang", 2.15), map_Create("x", -0.15, "y", -12.55, "ang", 2.24), map_Create("x", -0.05, "y", -12.6, "ang", 1.85), map_Create("x", 0.15, "y", -12.6, "ang", 1.52)))
    animation_create("tense", 0.13333333333333333, 1, 1, list_of_maps(map_Create("x", 0.05, "y", -43.25, "ang", -2.26), map_Create("x", 0.55, "y", -42.75, "ang", -2.26), map_Create("x", 0.95, "y", -43.35, "ang", -2.26), map_Create("x", 0.45, "y", -44.3, "ang", -2.28), map_Create("x", 0.1, "y", -44.65, "ang", -2.26), map_Create("x", 0.2, "y", -45.55, "ang", -2.26), map_Create("x", 0.1, "y", -44.65, "ang", -2.26), map_Create("x", 0.4, "y", -44, "ang", -2.26)), list_of_maps(map_Create("x", -5.1, "y", -11.5, "ang", -0.9), map_Create("x", -4.5, "y", -11.55, "ang", -1.27), map_Create("x", -4.25, "y", -12.35, "ang", -1.27), map_Create("x", -4.7, "y", -12.85, "ang", -1.27), map_Create("x", -4.7, "y", -13.1, "ang", -1.27), map_Create("x", -4.7, "y", -12.6, "ang", -1.27), map_Create("x", -4.55, "y", -11.95, "ang", -1.27), map_Create("x", -4.65, "y", -11.35, "ang", -1.27)))
    animation_create("shake", 0.13333333333333333, "idle", 0, list_of_maps(map_Create("x", -1.1, "y", -44.4, "ang", -5.21), map_Create("x", 3.3, "y", -41.95, "ang", -23.11), map_Create("x", -7.35, "y", -41.35, "ang", -47.05), map_Create("x", 3.6, "y", -41.25, "ang", -19.11), map_Create("x", -3.75, "y", -44.2, "ang", -38.59), map_Create("x", 1.8, "y", -48, "ang", -34.68), map_Create("x", 5.85, "y", -54.6, "ang", -9.67), map_Create("x", 10.65, "y", -53.55, "ang", 1.05), map_Create("x", 8.05, "y", -50.75, "ang", 8.53), map_Create("x", 3.45, "y", -48.3, "ang", 1.14), map_Create("x", -0.65, "y", -40.35, "ang", 1.1), map_Create("x", -2.5, "y", -43.4, "ang", 0.32)), list_of_maps(map_Create("x", -3.2, "y", -11.6, "ang", -3.98), map_Create("x", -3.2, "y", -9.8, "ang", -1.73), map_Create("x", -4.95, "y", -9.8, "ang", -11.19), map_Create("x", -4.05, "y", -11.55, "ang", -16.47), map_Create("x", -1.7, "y", -12.75, "ang", -11.44), map_Create("x", -0.85, "y", -13.4, "ang", -2.08), map_Create("x", 1.2, "y", -15.85, "ang", -8.05), map_Create("x", 3.35, "y", -17.65, "ang", -14.78), map_Create("x", 1.65, "y", -15.45, "ang", -7.47), map_Create("x", 0.8, "y", -14.25, "ang", -2.41), map_Create("x", -3.35, "y", -10.45, "ang", 0), map_Create("x", -4.55, "y", -10.85, "ang", -2.19)))
    animation_create("breathe", 0.13333333333333333, "idle", 0, list_of_maps(map_Create("x", -2.5, "y", -45.2, "ang", -1), map_Create("x", -2.65, "y", -45.25, "ang", -1.7), map_Create("x", -3.65, "y", -46.1, "ang", -4.18), map_Create("x", -3.7, "y", -47.2, "ang", -2.76), map_Create("x", -4.45, "y", -48.35, "ang", -0.84), map_Create("x", -5.2, "y", -49.1, "ang", 1.18), map_Create("x", -5.75, "y", -49.55, "ang", 2), map_Create("x", -5.7, "y", -49.45, "ang", 2.22), map_Create("x", -5.3, "y", -49.1, "ang", 1.95), map_Create("x", -4.8, "y", -48.5, "ang", 1.7), map_Create("x", -3.45, "y", -47.7, "ang", 0.84), map_Create("x", -1.85, "y", -46, "ang", -1.7), map_Create("x", -0.8, "y", -44.35, "ang", -4.4), map_Create("x", -0.5, "y", -42.9, "ang", -7.81), map_Create("x", -0.6, "y", -42.65, "ang", -8.35), map_Create("x", -0.5, "y", -43.1, "ang", -7.83), map_Create("x", -1.45, "y", -43.7, "ang", -5.07), map_Create("x", -2.1, "y", -44.55, "ang", -2.22), map_Create("x", -2.65, "y", -44.9, "ang", -1.7)), list_of_maps(map_Create("x", -4.55, "y", -12.05, "ang", 0.71), map_Create("x", -4.55, "y", -12.45, "ang", 0.32), map_Create("x", -4.95, "y", -12.85, "ang", 1.76), map_Create("x", -4.95, "y", -13.25, "ang", 3.5), map_Create("x", -4.95, "y", -13.25, "ang", 4.44), map_Create("x", -4.95, "y", -13.25, "ang", 5.15), map_Create("x", -4.95, "y", -13.25, "ang", 5.6), map_Create("x", -4.95, "y", -13.25, "ang", 5.15), map_Create("x", -4.95, "y", -13.25, "ang", 4.44), map_Create("x", -4.95, "y", -13.25, "ang", 3.5), map_Create("x", -4.95, "y", -12.85, "ang", 1.76), map_Create("x", -4.55, "y", -12.45, "ang", 0.32), map_Create("x", -4.55, "y", -12.05, "ang", 0.71), map_Create("x", -4.3, "y", -11.55, "ang", 0.71), map_Create("x", -4.3, "y", -11.3, "ang", 0.71), map_Create("x", -4.3, "y", -11.3, "ang", 0.71), map_Create("x", -4.3, "y", -11.55, "ang", 0.71), map_Create("x", -4.55, "y", -11.8, "ang", 0.71), map_Create("x", -4.55, "y", -12.05, "ang", 0.71)))
    animation_create("look", 0.13333333333333333, "idle", 0, list_of_maps(map_Create("x", -2.2, "y", -44.6, "ang", 0.32), map_Create("x", -1.5, "y", -46.2, "ang", 1.48), map_Create("x", -1.4, "y", -49.2, "ang", 7.22), map_Create("x", -0.45, "y", -51.05, "ang", 15.67), map_Create("x", -0.85, "y", -51.65, "ang", 15.87), map_Create("x", -1.3, "y", -51.65, "ang", 15.87), map_Create("x", -1.3, "y", -51.2, "ang", 15.87), map_Create("x", -1.7, "y", -51.3, "ang", 16.65), map_Create("x", -2.4, "y", -51.2, "ang", 18.09), map_Create("x", -3.05, "y", -51.2, "ang", 20.34), map_Create("x", -3.6, "y", -51.15, "ang", 20.81), map_Create("x", -3.9, "y", -51.15, "ang", 21.25), map_Create("x", -3.9, "y", -51.15, "ang", 21.25), map_Create("x", -3.6, "y", -51.15, "ang", 20.81), map_Create("x", -3.05, "y", -51.2, "ang", 20.34), map_Create("x", -2.4, "y", -51.2, "ang", 18.09), map_Create("x", -1.7, "y", -51.3, "ang", 16.65), map_Create("x", -1.3, "y", -51.2, "ang", 15.87), map_Create("x", -2, "y", -49.6, "ang", 11.92), map_Create("x", -2.85, "y", -47.65, "ang", 7.56), map_Create("x", -2.25, "y", -46.35, "ang", 2.76)), list_of_maps(map_Create("x", -4.3, "y", -12.3, "ang", 0), map_Create("x", -3.55, "y", -12.65, "ang", 0), map_Create("x", -3.65, "y", -13.6, "ang", 0), map_Create("x", -3.65, "y", -14.5, "ang", 3.27), map_Create("x", -3.85, "y", -14.75, "ang", 5.15), map_Create("x", -3.85, "y", -14.75, "ang", 5.15), map_Create("x", -3.85, "y", -14.75, "ang", 5.15), map_Create("x", -4.2, "y", -14.75, "ang", 5.15), map_Create("x", -4.9, "y", -14.75, "ang", 5.15), map_Create("x", -5.6, "y", -14.75, "ang", 5.6), map_Create("x", -5.95, "y", -14.75, "ang", 6.16), map_Create("x", -5.95, "y", -14.75, "ang", 6.93), map_Create("x", -5.95, "y", -14.75, "ang", 6.93), map_Create("x", -5.95, "y", -14.75, "ang", 6.16), map_Create("x", -5.6, "y", -14.75, "ang", 5.6), map_Create("x", -4.9, "y", -14.75, "ang", 5.15), map_Create("x", -4.2, "y", -14.75, "ang", 5.15), map_Create("x", -3.85, "y", -14.75, "ang", 5.15), map_Create("x", -3.85, "y", -13.95, "ang", 2.9), map_Create("x", -3.85, "y", -13.15, "ang", 2.9), map_Create("x", -4.55, "y", -12.45, "ang", 0)))
    animation_create("hug_clementine", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", 2.3, "y", -43.2, "ang", 5.15), map_Create("x", 6.7, "y", -44.35, "ang", 7.36), map_Create("x", 6.4, "y", -48, "ang", 8.4), map_Create("x", 6.75, "y", -48, "ang", 11.8), map_Create("x", 6.75, "y", -48, "ang", 11.8), map_Create("x", 6.75, "y", -48, "ang", 11.8)), list_of_maps(map_Create("x", -0.3, "y", -10.1, "ang", 8.22), map_Create("x", 2.6, "y", -9.85, "ang", 10.28), map_Create("x", 3.1, "y", -11.65, "ang", 14.46), map_Create("x", 3.25, "y", -11.7, "ang", 14.94), map_Create("x", 3.25, "y", -11.7, "ang", 14.94), map_Create("x", 3.25, "y", -11.7, "ang", 14.94)))
    animation_create("hug_chicory", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", 0.8, "y", -46.95, "ang", 8.4), map_Create("x", 10.6, "y", -47.4, "ang", 21.31), map_Create("x", 9.5, "y", -47.85, "ang", 17.54), map_Create("x", 7.45, "y", -47.95, "ang", 12.8), map_Create("x", 7.1, "y", -47.95, "ang", 11.8)), list_of_maps(map_Create("x", -2.4, "y", -9.65, "ang", 14.46), map_Create("x", 2.2, "y", -10.65, "ang", 12.94), map_Create("x", 3.25, "y", -11.7, "ang", 14.94), map_Create("x", 3.2, "y", -11.65, "ang", 14.68), map_Create("x", 2.85, "y", -11.65, "ang", 13.97)))
    animation_create("hug_chicory_fast", 0.2, 0, 0, list_of_maps(map_Create("x", 0.8, "y", -46.95, "ang", 8.4), map_Create("x", 10.6, "y", -47.4, "ang", 21.31), map_Create("x", 9.5, "y", -47.85, "ang", 17.54), map_Create("x", 7.45, "y", -47.95, "ang", 12.8), map_Create("x", 7.1, "y", -47.95, "ang", 11.8)), list_of_maps(map_Create("x", -2.4, "y", -9.65, "ang", 14.46), map_Create("x", 2.2, "y", -10.65, "ang", 12.94), map_Create("x", 3.25, "y", -11.7, "ang", 14.94), map_Create("x", 3.2, "y", -11.65, "ang", 14.68), map_Create("x", 2.85, "y", -11.65, "ang", 13.97)))
    animation_create("handshake", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", -2.3, "y", -44.85, "ang", 0.45), map_Create("x", -2.7, "y", -44.7, "ang", 0.32), map_Create("x", -3.45, "y", -46.5, "ang", 1.98), map_Create("x", -4.95, "y", -48.55, "ang", 5.73), map_Create("x", -6.95, "y", -49.65, "ang", 8.54), map_Create("x", -8.5, "y", -49.4, "ang", 11.74), map_Create("x", -8.45, "y", -49.35, "ang", 11.98), map_Create("x", -8.45, "y", -49.35, "ang", 11.98), map_Create("x", -8.25, "y", -49.15, "ang", 11.98), map_Create("x", -8.25, "y", -49.15, "ang", 11.98), map_Create("x", -8, "y", -49.1, "ang", 11.98), map_Create("x", -7.2, "y", -48.85, "ang", 12.29), map_Create("x", -7, "y", -48.85, "ang", 12.29), map_Create("x", -7.05, "y", -48.85, "ang", 12.29), map_Create("x", -7.25, "y", -49.05, "ang", 12.29), map_Create("x", -6.8, "y", -49.1, "ang", 11.98), map_Create("x", -5.8, "y", -48.85, "ang", 12.29), map_Create("x", -5.6, "y", -48.85, "ang", 12.29)), list_of_maps(map_Create("x", -4.35, "y", -11.7, "ang", 0), map_Create("x", -4.1, "y", -11.95, "ang", 0), map_Create("x", -3.35, "y", -12.5, "ang", 0), map_Create("x", -3.6, "y", -13.05, "ang", -2.24), map_Create("x", -3.65, "y", -13.75, "ang", -4.41), map_Create("x", -3.9, "y", -13.85, "ang", -5.24), map_Create("x", -3.8, "y", -13.95, "ang", -5.23), map_Create("x", -3.8, "y", -13.95, "ang", -5.23), map_Create("x", -3.7, "y", -13.65, "ang", -4.79), map_Create("x", -3.7, "y", -13.65, "ang", -4.79), map_Create("x", -3.65, "y", -13.75, "ang", -4.53), map_Create("x", -3.5, "y", -13.8, "ang", -3.84), map_Create("x", -3.5, "y", -13.8, "ang", -3.84), map_Create("x", -3.6, "y", -13.8, "ang", -4.15), map_Create("x", -3.6, "y", -13.8, "ang", -4.15), map_Create("x", -3.65, "y", -13.75, "ang", -4.53), map_Create("x", -3.5, "y", -13.8, "ang", -3.84), map_Create("x", -3.5, "y", -13.8, "ang", -3.84)))
    animation_create("assist", 0.2, "idle", 0, list_of_maps(map_Create("x", -23.15, "y", -38.15, "ang", -1.67), map_Create("x", -23.1, "y", -38.55, "ang", -1.38), map_Create("x", -20.55, "y", -38.75, "ang", 1.67), map_Create("x", -13.2, "y", -38.4, "ang", 6.83), map_Create("x", -2.4, "y", -41, "ang", 13.16), map_Create("x", 12.6, "y", -47.35, "ang", 11.41), map_Create("x", 25.05, "y", -57, "ang", 12.96), map_Create("x", 26.3, "y", -62.1, "ang", 16.68), map_Create("x", 25.9, "y", -59.35, "ang", 17.9), map_Create("x", 22.5, "y", -49.2, "ang", 11.94), map_Create("x", 25.5, "y", -41.75, "ang", 1.27), map_Create("x", 23.85, "y", -44.9, "ang", 0.32)), list_of_maps(map_Create("x", -15.35, "y", -3.7, "ang", -22.83), map_Create("x", -15.35, "y", -3.7, "ang", -21.61), map_Create("x", -14.5, "y", -3.7, "ang", -19.27), map_Create("x", -11.25, "y", -4, "ang", -6.76), map_Create("x", -5.4, "y", -7.9, "ang", -8.58), map_Create("x", 8.7, "y", -13.25, "ang", -13.28), map_Create("x", 19, "y", -20.8, "ang", -12.91), map_Create("x", 22.85, "y", -27.45, "ang", -4.73), map_Create("x", 24.05, "y", -23.95, "ang", -1.52), map_Create("x", 22.15, "y", -15.2, "ang", -3), map_Create("x", 22.15, "y", -9.95, "ang", -6.21), map_Create("x", 21.8, "y", -11, "ang", -1.23)))
    animation_create("brushride", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", -23.95, "y", -42.4, "ang", 26.77), map_Create("x", -23.4, "y", -41.3, "ang", 26.77), map_Create("x", -23.4, "y", -41.85, "ang", 26.77), map_Create("x", -23.95, "y", -42.4, "ang", 26.77)), list_of_maps(map_Create("x", -23.3, "y", -7.5, "ang", 17.8), map_Create("x", -23.3, "y", -7.5, "ang", 17.35), map_Create("x", -23.25, "y", -7.55, "ang", 17.87), map_Create("x", -23.3, "y", -7.5, "ang", 18.94)))
    animation_create("brushride_still", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", -21.85, "y", -43.05, "ang", 0.9)), list_of_maps(map_Create("x", -22.55, "y", -8.85, "ang", 10.76)))
    animation_create("floatstart", 0.13333333333333333, "float", 0, list_of_maps(map_Create("x", 0.3, "y", 1.65, "ang", 10.17), map_Create("x", 0.3, "y", 2.25, "ang", 9.23), map_Create("x", 0.3, "y", 2.55, "ang", 8.18), map_Create("x", -1.4, "y", 3.1, "ang", 11.41), map_Create("x", -3.25, "y", 3.45, "ang", 21.87), map_Create("x", -3.7, "y", 4.45, "ang", 40.09), map_Create("x", -3.85, "y", 4.8, "ang", 71.01), map_Create("x", -4.1, "y", 7.8, "ang", 77.47), map_Create("x", -4.1, "y", 9.55, "ang", 78.69), map_Create("x", -4.05, "y", 9.85, "ang", 79.01), map_Create("x", -4.05, "y", 7.25, "ang", 79.69), map_Create("x", -4.05, "y", 6.35, "ang", 78.47), map_Create("x", -4.05, "y", 6.05, "ang", 77.24), map_Create("x", -4.05, "y", 6.2, "ang", 77.24), map_Create("x", -4.15, "y", 6.35, "ang", 77.56), map_Create("x", -4.25, "y", 6.55, "ang", 78.01)), list_of_maps())
    animation_create("float", (1/15), 1, 0, list_of_maps(map_Create("x", -4.25, "y", 6.55, "ang", 78.01), map_Create("x", -4.35, "y", 6.5, "ang", 78.14), map_Create("x", -4.3, "y", 6.4, "ang", 78.4), map_Create("x", -4.1, "y", 6.15, "ang", 78.34), map_Create("x", -4, "y", 6.05, "ang", 77.95), map_Create("x", -4.05, "y", 5.9, "ang", 77.24), map_Create("x", -4.05, "y", 6.05, "ang", 77.24), map_Create("x", -4.05, "y", 6.35, "ang", 77.9)), list_of_maps())
    animation_create("floatstop", 0.13333333333333333, "bob", 0, list_of_maps(map_Create("x", -3.4, "y", 6.95, "ang", 77.2), map_Create("x", -2.55, "y", 8.45, "ang", 77.2), map_Create("x", -3.95, "y", 7.85, "ang", 79.7), map_Create("x", -1.5, "y", 9, "ang", 77.3), map_Create("x", -2.8, "y", 7.55, "ang", 61.3), map_Create("x", -1.9, "y", 4.45, "ang", 35.6), map_Create("x", -0.15, "y", 2.25, "ang", 22.4), map_Create("x", 0.3, "y", 0.75, "ang", 9.4), map_Create("x", 0.3, "y", 0.75, "ang", 4.5), map_Create("x", 0.3, "y", 1.65, "ang", 6.7), map_Create("x", 0.3, "y", 1.95, "ang", 10.1), map_Create("x", 0, "y", 1.95, "ang", 10.7), map_Create("x", -0.05, "y", 2.85, "ang", 10), map_Create("x", 0.15, "y", 3, "ang", 9.7)), list_of_maps())
    animation_create("bossgrab", 0.13333333333333333, "bosshold", 0, list_of_maps(map_Create("x", -3.05, "y", -45.6, "ang", -30.78), map_Create("x", -0.75, "y", -195.65, "ang", -43.05), map_Create("x", 3.15, "y", -242.7, "ang", -45.75), map_Create("x", -1.6, "y", -283.4, "ang", -7.39), map_Create("x", -32.5, "y", -309.65, "ang", -1.95), map_Create("x", -79.7, "y", -295.15, "ang", 36.35), map_Create("x", -112.1, "y", -277.05, "ang", 60.95), map_Create("x", -125.6, "y", -265.05, "ang", 77.89), map_Create("x", -122.45, "y", -250.55, "ang", 86.79), map_Create("x", -116, "y", -247.5, "ang", 80.84), map_Create("x", -108.7, "y", -248.4, "ang", 67.67), map_Create("x", -109.5, "y", -248.85, "ang", 69.62)), list_of_maps(map_Create("x", -4.9, "y", -10.55, "ang", -3.84), map_Create("x", -3.8, "y", -159.35, "ang", -4.53), map_Create("x", 0, "y", -211.7, "ang", -4.53), map_Create("x", 1.8, "y", -248.65, "ang", -12.68), map_Create("x", -25.65, "y", -275.9, "ang", -10.94), map_Create("x", -63.4, "y", -266.8, "ang", -39.32), map_Create("x", -88.35, "y", -250.35, "ang", -45.76), map_Create("x", -98.65, "y", -244.4, "ang", -54.86), map_Create("x", -93.3, "y", -234.65, "ang", -63.81), map_Create("x", -87.8, "y", -231.45, "ang", -69.76), map_Create("x", -82.9, "y", -233.8, "ang", -71.66), map_Create("x", -82.8, "y", -233.6, "ang", -71.8)))
    animation_create("bosshold", 0.13333333333333333, 1, 0, list_of_maps(map_Create("x", -109.55, "y", -249.05, "ang", 72.68), map_Create("x", -108.7, "y", -249.4, "ang", 73.85), map_Create("x", -108, "y", -249.4, "ang", 72.37), map_Create("x", -107.95, "y", -249.35, "ang", 71.66), map_Create("x", -108.3, "y", -249.1, "ang", 70.66), map_Create("x", -109.35, "y", -248.6, "ang", 71.21), map_Create("x", -109.55, "y", -249.05, "ang", 72.68)), list_of_maps(map_Create("x", -82.8, "y", -233.6, "ang", -73.03), map_Create("x", -82.8, "y", -233.6, "ang", -71.8), map_Create("x", -82.8, "y", -233.6, "ang", -70.58), map_Create("x", -82.8, "y", -233.6, "ang", -69.87), map_Create("x", -82.8, "y", -233.6, "ang", -70.82), map_Create("x", -82.8, "y", -233.6, "ang", -72.84), map_Create("x", -82.8, "y", -233.6, "ang", -71.8)))
    animation_create("bossdrop", 0.13333333333333333, 0, 0, list_of_maps(map_Create("x", -111.8, "y", -245, "ang", 61.47), map_Create("x", -114.55, "y", -240.15, "ang", 57.74), map_Create("x", -114.95, "y", -229.75, "ang", 57.74), map_Create("x", -113.65, "y", -190.9, "ang", 60.98), map_Create("x", -110.75, "y", -133.3, "ang", 54.76), map_Create("x", -110.75, "y", -71.15, "ang", 54.76), map_Create("x", -114.5, "y", -20.95, "ang", 22.92), map_Create("x", -109.35, "y", -21.05, "ang", -18.09), map_Create("x", -109.5, "y", -24.6, "ang", -7.65), map_Create("x", -110.4, "y", -25.6, "ang", -5.98)), list_of_maps(map_Create("x", -86, "y", -225.2, "ang", -65.07), map_Create("x", -89.05, "y", -220.95, "ang", -67.52), map_Create("x", -93.65, "y", -206.35, "ang", -63.79), map_Create("x", -94.5, "y", -165.9, "ang", -61.32), map_Create("x", -93.15, "y", -107.95, "ang", -59.56), map_Create("x", -93.15, "y", -45.8, "ang", -59.56), map_Create("x", -98.05, "y", 6.5, "ang", -44.27), map_Create("x", -97.95, "y", 8.5, "ang", -23.12), map_Create("x", -99.95, "y", 8.5, "ang", -23.12), map_Create("x", -100.95, "y", 8.5, "ang", -23.12)))
}
expressions = map_Create("small", 0, "closed", 1, "grin", 2, "grr", 3, "gr", 3, "grrr", 3, "angry", 3, "nervous", 4, "gah", 5, "gasp", 5, "heee", 6, "whoa", 7, "sorry", 8, "stop", 9, "ouch", 10, "ow", 10, "worry", 11, "worried", 11, "knockdown", 12, "smit", 13, "swoon", 13, "smile", 14, "cheeky", 15, "hmph", 16, "hmf", 16, "ok", 17, "depressed", 19, "embarass", 20, "closed_sad", 21)
expression = data_get("expression")
expression_p = expression
body_a = -1
head_a = 1
inverted = 0
mask_surf = -1
with (global.the_gameobj)
{
    if ds_list_empty(dog_expressions)
    {
        ds_list_add(dog_expressions, "neutral")
        var k = ds_map_find_first(global.the_dog.expressions)
        var n = ds_map_size(global.the_dog.expressions)
        var used = list_Create()
        for (i = 0; i < n; i += 1)
        {
            var expr = ds_map_find_value(global.the_dog.expressions, k)
            if (ds_list_find_index(used, expr) == -1)
            {
                ds_list_add(dog_expressions, k)
                ds_list_add(used, expr)
            }
            k = ds_map_find_next(global.the_dog.expressions, k)
        }
        ds_list_destroy(used)
    }
}
// MOD STUFF STARTS HERE
mod_pause = false
mod_pause_selected = 0
mod_pause_menu_options = list_of_lists(
    list_Create( // Default
        "Controls"
    ),
    list_Create( // Controls
        "Mod Settings",
        "Savestate",
        "Loadstate",
        "Change Custom Palette",
        "Teleport to Cursor",
        "Chapter Select"
    )
)
mod_pause_menu = 0 // 0 = default, 1 = controls
mod_pause_controls_setting = false
mod_pause_controls = list_of_lists(
    global.mod_settings_buttons, global.savestate_buttons, global.loadstate_buttons, global.custom_buttons, global.teleport_buttons, global.chaptersel_buttons
)
mod_pause_start_x = 0
mod_pause_start_y = 0