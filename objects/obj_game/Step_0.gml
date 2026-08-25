//if (game_state == "countdown")
//{
//    countdown_timer--;

//    if (countdown_timer <= 0)
//    {
//        countdown--;

//        countdown_timer = room_speed;

//        if (countdown > 0)
//        {
//            audio_play_sound(snd_whistle_start, 1, false);
//        }
//        else
//        {
//            // Termina el countdown
//            game_state = "playing";

//            music_instance = audio_play_sound(
//                sound_lvl1,
//                1,
//                false
//            );

//            music_started = true;
//        }
//    }

//    exit;
//}

//if (game_state == "playing"){
//	var song_time = audio_sound_get_track_position(music_instance);

//	if (chart_index < array_length(chart_data.notes))
//	{
//    var chart_note = chart_data.notes[chart_index];

//    if (song_time >= chart_note.time - spawn_offset)
//    {
//        var note = instance_create_layer(
//            800,
//            150,
//            "Instances_1",
//            obj_note
//        );
		
//		note.note_time = chart_note.time;

//        if (chart_note.key == "up")
//        {
//            note.note_key = vk_up;
//        }
//        else if (chart_note.key == "down")
//        {
//            note.note_key = vk_down;
//        }
//        else if (chart_note.key == "left")
//        {
//            note.note_key = vk_left;
//        }
//        else if (chart_note.key == "right")
//        {
//            note.note_key = vk_right;
//        }

//        chart_index++;
//    }
//	}
//	if (!audio_is_playing(music_instance))
//    {
//        game_state = "finished";

//        audio_play_sound(
//            snd_whistle_start,
//            1,
//            false
//        );

//        level_finished = true;
//    }  
//}

//score_bar_visual = lerp(
//    score_bar_visual,
//    score_bar,
//    0.1
//);

//if (score_bar >= 85)
//{
//    level_complete = true;
//}



switch (game_state)
{
    case GameState.COUNTDOWN:
    countdown_timer--;

    if (countdown_timer <= 0)
    {
        countdown--;

        countdown_timer = room_speed;

        if (countdown > 0)
        {
            audio_play_sound(
                snd_whistle_start,
                1,
                false
            );
        }
        else
        {
            game_state = GameState.PLAYING
        }
    }
    break;


    case GameState.PLAYING:
	if (!song_started)
    {
        music_instance = audio_play_sound(
            current_song,
            1,
            false
        );

        song_started = true;
    }


    // ==========================================
    // TIEMPO DE LA CANCIÓN
    // ==========================================

    var song_time = audio_sound_get_track_position(
        music_instance
    );


    // ==========================================
    // GENERAR NOTAS
    // ==========================================

    if (chart_index < array_length(current_chart.notes))
    {
        var chart_note = current_chart.notes[chart_index];

        if (song_time >= chart_note.time - spawn_offset)
        {
            var note = instance_create_layer(
                800,
                150,
                "Instances_1",
                obj_note
            );

            note.note_time = chart_note.time;


            // Tecla de la nota
            if (chart_note.key == "up")
            {
                note.note_key = vk_up;
            }
            else if (chart_note.key == "down")
            {
                note.note_key = vk_down;
            }
            else if (chart_note.key == "left")
            {
                note.note_key = vk_left;
            }
            else if (chart_note.key == "right")
            {
                note.note_key = vk_right;
            }

            chart_index++;
        }
    }


    // ==========================================
    // ACTUALIZAR BARRA
    // ==========================================

    score_bar_visual = lerp(
        score_bar_visual,
        score_bar,
        0.1
    );

    // ==========================================
    // ¿TERMINÓ LA CANCIÓN?
    // ==========================================

	if (!audio_is_playing(music_instance))
	{
		//GANO
	    if (score_bar >= current_target)
	    {
	        game_state = GameState.COMMENTARY;
			level_complete = true;
	    }
		//PERDIO
	    else
	    {
	        game_state = GameState.GAME_OVER;
	    }

	    audio_play_sound(
	        snd_whistle_start,
	        1,
	        false
	    );

	    level_finished = true;
	}
    break;


    case GameState.COMMENTARY:
        // Relator
    break;	


    case GameState.GAME_OVER:
        // Game Over
    break;


    case GameState.VICTORY:
        // Victoria
    break;
}