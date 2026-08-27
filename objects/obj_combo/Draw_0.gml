draw_self();

if(obj_game.combo > 20 ) {
		sprite_index = sp_combo_on;
		image_speed = 0.25;
}else{
	sprite_index = sp_combo_off;
}
