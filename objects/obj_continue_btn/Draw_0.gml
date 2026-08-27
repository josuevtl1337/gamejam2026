draw_self();

if(obj_game.game_state != GameState.COMMENTARY)
{
		visible = false;
}
else
{ 
	visible = true;
	
	if (hover)
	{
		draw_set_font(fnt_menu);
	
	    draw_text(x + 20, y + 120, "Continuar");
	}
}