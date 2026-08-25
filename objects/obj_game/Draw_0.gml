if (feedback_timer > 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);

    draw_text(
        640,
        400,
        feedback_text
    );

	
	 draw_text(
        500,
        400,
        notes_count
    );
	 draw_text(
        550,
        400,
        " / 14"
    );
}