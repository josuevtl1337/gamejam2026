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
                "Instances",
                obj_note
            );

            note.note_time = chart_note.time;


           var random_index = irandom(
			    array_length(current_available_keys) - 1
			);

			note.note_key = current_available_keys[random_index];
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
    // TERMINO LA CANCION?
    // ==========================================

	if (!audio_is_playing(music_instance))
	{
		//GANO
	    if (score_bar >= current_target)
	    {
	        game_state = GameState.COMMENTARY;
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
    if (commentator_instance == noone)
    {
        commentator_instance = instance_create_layer(
            300,
            300,
            "Instances",
            obj_capibara
        );

        commentator_instance.start_commentary(
            current_commentary
        );
		with(obj_capibara){
			visible = true
		}
		instance_create_layer(
            600,
            400,
            "Instances",
            obj_continue_btn
        );

    }

    break;	


    case GameState.GAME_OVER:
        // Game Over
    break;


    case GameState.VICTORY:
        // Victoria
    break;
}