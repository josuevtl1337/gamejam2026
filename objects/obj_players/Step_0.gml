if(obj_game.game_state != GameState.PLAYING){
	image_index = 0;
}


switch (obj_game.current_level)
{
    case 0:
        sprite_index = sp_players_normal1;
        break;

    case 1:
        sprite_index = sp_players_normal1;
        break;

    case 2:
        sprite_index = sp_players_normal2;
        break;
}
