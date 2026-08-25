if (feedback_timer > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text(
        640,
        350,
        feedback_text
    );

}

var bar_x = 500;
var bar_y = 400;

var bar_width = 300;
var bar_height = 25;


// Fondo
draw_set_color(c_black);

draw_rectangle(
    bar_x,
    bar_y,
    bar_x + bar_width,
    bar_y + bar_height,
    false
);


// Barra
draw_set_color(score_bar_color);

var current_width = bar_width * (score_bar_visual / 100);

draw_rectangle(
    bar_x,
    bar_y,
    bar_x + current_width,
    bar_y + bar_height,
    true
);


var target_x = bar_x + (bar_width * 0.85);

draw_set_color(c_yellow);

draw_line(
    target_x,
    bar_y - 5,
    target_x,
    bar_y + bar_height + 5
);

if (level_finished)
{
    draw_set_color(c_green);

    draw_text(
        640,
        330,
        "Nivel Completado!"
    );
}

// Contador inicial

if (game_state == "countdown")
{
    draw_set_color(c_white);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(
        room_width / 2,
        room_height / 2,
        string(countdown)
    );

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
