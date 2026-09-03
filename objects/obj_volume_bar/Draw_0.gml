// BARRA MUSICA
var x_bar = 479;
var y_bar = 427;

var bar_width = 252;
var bar_height = 22;

// Convertimos el volumen a 5 etapas
var music_bar_level = round(music_volume * 4) / 4;

// Fondo
draw_set_color(c_gray);

draw_rectangle(
    x_bar,
    y_bar,
    x_bar + bar_width,
    y_bar + bar_height,
    false
);

// Volumen actual
draw_set_color(c_white);

draw_rectangle(
    x_bar,
    y_bar,
    x_bar + (bar_width * music_bar_level),
    y_bar + bar_height,
    false
);

// BARRA EFECTOS

var x_bar_effects = 479;
var y_bar_effects = 280;

var bar_width_effects = 252;
var bar_height_effects = 22;

// Convertimos el volumen a 5 etapas
var effect_bar_level = round(effect_volume * 4) / 4;

// Fondo
draw_set_color(c_gray);

draw_rectangle(
    x_bar_effects,
    y_bar_effects,
    x_bar_effects + bar_width_effects,
    y_bar_effects + bar_height_effects,
    false
);

// Volumen actual
draw_set_color(c_white);

draw_rectangle(
    x_bar_effects,
    y_bar_effects,
    x_bar_effects + (bar_width_effects * effect_bar_level),
    y_bar_effects + bar_height_effects,
    false
);
