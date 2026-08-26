<<<<<<< HEAD
=======
if (!visible)
{
    exit;
}
>>>>>>> ea7d094dd9c2cbf74acc0aa2edf51c07639042a2

// ==========================================
// TEXTO
// ==========================================

<<<<<<< HEAD
var center_x = obj_screen.x + obj_screen.sprite_width / 2;
var center_y = obj_screen.y + obj_screen.sprite_height / 2;

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_ext(
    center_x,
    center_y,
    commentary_display,
    32,
    500
=======
draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(
    280,
    390,
    commentary_display,
    32,
    room_width - 320
>>>>>>> ea7d094dd9c2cbf74acc0aa2edf51c07639042a2
);

