if (!visible)
{
    exit;
}


// ==========================================
// FONDO OSCURO
// ==========================================

draw_set_alpha(0.75);
draw_set_color(c_black);

draw_rectangle(
    40,
    40,
    room_width - 40,
    room_height - 40,
    true
);

draw_set_alpha(1);


// ==========================================
// CAJA DEL DIÁLOGO
// ==========================================

draw_set_color(c_black);

draw_rectangle(
    80,
    350,
    room_width - 80,
    550,
    true
);


// Borde

draw_set_color(c_white);

draw_rectangle(
    80,
    350,
    room_width - 80,
    550,
    false
);


// ==========================================
// TEXTO
// ==========================================

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(
    280,
    390,
    commentary_display,
    32,
    room_width - 320
);