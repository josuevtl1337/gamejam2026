

if (game_state == GameState.COUNTDOWN)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
    draw_set_color(c_white);
	if(countdown <= 3){
	    draw_text(
	        room_width / 2,
	        room_height / 2,
	        string(countdown)
	    );
	}
}

if (game_state == GameState.PLAYING)
{
	if (feedback_timer > 0)
	{
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);

	    draw_set_color(c_black);

	    draw_text(
	        640,
	        320,
	        feedback_text
	    );

	}

	var bar_x = 430;
	var bar_y = 350;

	var bar_width = 400;
	var bar_height = 30;

	// progressbar

	// Fondo del progressbar
	draw_set_color(c_black);

	draw_rectangle(
	    bar_x,
	    bar_y,
	    bar_x + bar_width,
	    bar_y + bar_height,
	    false
	);
	
	//reborde negro de barra
	
	draw_set_color(c_black);

	draw_rectangle(
	    bar_x - 6,
	    bar_y - 6,
	    bar_x + bar_width + 6,
	    bar_y + bar_height + 6,
	    false
	);
	
	//color segun % de progreso
	var progress_color;

	if (score_bar_visual < 30)
	{
	    progress_color = c_red;
	}
		else if (score_bar_visual < current_target)
		{
		    progress_color = c_yellow;
		}
			else
			{
			    progress_color = c_green;
			}

	draw_set_color(progress_color);
	
	var current_width = bar_width * (score_bar_visual / 100);

	draw_rectangle(
	    bar_x,
	    bar_y,
	    bar_x + current_width,
	    bar_y + bar_height,
	    false	//relleno ON
	);
	
	//Linea amarilla de la meta
	var target_x = bar_x + (bar_width * (current_target / 100));

	draw_set_color(c_yellow);

	draw_line_width(
	    target_x,
	    bar_y - 5,
	    target_x,
	    bar_y + bar_height + 4,
		5.0
	);
}
 
if(game_state == GameState.VICTORY || game_state == GameState.GAME_OVER)
{
	draw_set_color(c_white);
}