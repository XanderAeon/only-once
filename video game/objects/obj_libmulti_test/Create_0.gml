/// @description NOTE: Drop this object into an empty room.

if (!libmulti_present()) {
    show_error("libmulti: Cannot load the DLL, demo will quit.", true);
    game_end();
    exit;
}

window_set_caption("move me!");
window_set_min_width(640);
window_set_min_height(480);
window_set_size(640, 480);
//alarm[0] = 15; // window_center() delay

wndclass = libmulti_init();

// GMS 2 is using RGBA pixel format instead of BGRA.
libmulti_set_gms2_pixel_format(true);
if (libmulti_get_gms2_pixel_format()) {
	show_debug_message("libmulti: gms2 pixel format enabled ok!");
}

libmulti_set_game_window(window_handle());

seed = randomize();
windows = ds_list_create();
buffers = ds_list_create();
inputs = ds_list_create();

// GMS 2.3.1+
var info = os_get_info();
is64bit = ds_map_find_value(info, "is64bit");
ds_map_destroy(info);

MakeSecondWindow();

global.bitchass = surface_create(640, 480);
surface_set_target(global.bitchass);
draw_set_colour(c_purple);
draw_rectangle(0, 0, 640, 480, false);
surface_reset_target();