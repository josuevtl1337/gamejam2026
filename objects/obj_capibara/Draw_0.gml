if (!visible)
{
    exit;
}

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

