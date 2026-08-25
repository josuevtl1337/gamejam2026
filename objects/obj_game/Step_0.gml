if (game_state == "countdown")
{
    countdown_timer--;

    if (countdown_timer <= 0)
    {
        countdown--;

        countdown_timer = room_speed;

        if (countdown > 0)
        {
            audio_play_sound(snd_whistle_start, 1, false);
        }
        else
        {
            // Termina el countdown
            game_state = "playing";

            music_instance = audio_play_sound(
                sound_lvl1,
                1,
                false
            );

            music_started = true;
        }
    }

    exit;
}

if (game_state == "playing"){
	var song_time = audio_sound_get_track_position(music_instance);

	if (chart_index < array_length(chart_data.notes))
	{
    var chart_note = chart_data.notes[chart_index];

    if (song_time >= chart_note.time - spawn_offset)
    {
        var note = instance_create_layer(
            800,
            150,
            "Instances_1",
            obj_note
        );
		
		note.note_time = chart_note.time;

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
	if (!audio_is_playing(music_instance))
    {
        game_state = "finished";

        audio_play_sound(
            snd_whistle_start,
            1,
            false
        );

        level_finished = true;
    }  
}

score_bar_visual = lerp(
    score_bar_visual,
    score_bar,
    0.1
);

if (score_bar >= 85)
{
    level_complete = true;
}