// ==========================================
// TEXTO
// ==========================================


var center_x = obj_screen.x + obj_screen.sprite_width / 2;
var center_y = obj_screen.y + obj_screen.sprite_height / 2;

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    center_x,
    center_y,
    commentary_display
);

