if (feedback_timer > 0 && !level_finished)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text(
        640,
        460,
        feedback_text
    );
}

// score y combo: visibles desde el arranque de la partida, no solo
// mientras hay un feedback activo (a diferencia del bloque de arriba).
// se dibujan fijos debajo del panel expandido (que ahora llega a y 338),
// para no solaparse con las flechas
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(400, 350, "SCORE " + string(score));
draw_text(400, 375, "COMBO: " + string(combo));

// barra de combo: vacia = negra, cargada = azul, mismo ancho que el carril
draw_set_color(c_black);
draw_rectangle(400, 400, 900, 418, false);

draw_set_color(c_blue);
draw_rectangle(400, 400, 400 + (5 * combo_bar), 418, false);

// recuadro de nivel terminado: se dibuja al final asi tapa el resto del
// hud (score/combo/barra) sin pisarse con nada
if (level_finished)
{
    draw_set_color(c_black);
    draw_rectangle(340, 220, 940, 500, false);

    draw_set_color(c_white);
    draw_rectangle(340, 220, 940, 500, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);

    draw_text(640, 250, "NIVEL TERMINADO");

    draw_text(640, 300, "PERFECT: " + string(perfect_count));
    draw_text(640, 330, "GOOD: " + string(good_count));
    draw_text(640, 360, "MISS: " + string(miss_count));

    draw_text(640, 400, "SCORE FINAL: " + string(score));

    draw_text(640, 460, "ENTER para reintentar");
}