spawn_timer = 0;

feedback_text = "";
feedback_timer = 0;
notes_count = 0;

count = 0;

// score y combo de la partida actual (ver scr_score.gml)
score = 0;
combo = 0;
combo_bar = 0;

// cantidad total de cada tipo de resultado, para la pantalla de nivel
// terminado (se incrementan en scr_score.gml, junto con score/combo)
perfect_count = 0;
good_count = 0;
miss_count = 0;

// se pone en true cuando termina la cancion (ver obj_game/Step_0.gml)
level_finished = false;

chart_index = 0;
spawn_offset = 1.5;

music_instance = audio_play_sound(sound_lvl1, 1, false);

// el chart ya no vive pegado en el codigo: se carga desde un archivo por
// nivel (ver los archivos incluidos del proyecto / datafiles). para agregar un nivel nuevo
// alcanza con sumar otro archivo .json ahi y cambiar chart_file (ver
// scr_chart.gml)
chart_file = "charta.json";
chart_data = chart_load(chart_file);

show_debug_message(chart_data.notes[0].time);
show_debug_message(chart_data.notes[0].key);

