var tiempo = audio_sound_get_track_position(music_instance);

draw_text(100, 100, "Tiempo: " + string(tiempo));

draw_text(100, 140, "Notas registradas: " + string(array_length(notes)));