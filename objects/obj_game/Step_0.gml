var song_time = audio_sound_get_track_position(music_instance);

// while en vez de if: si dos notas comparten el mismo tiempo objetivo
// (notas dobles) las crea a las dos en el mismo frame, no una por vez
while (chart_index < array_length(chart_data.notes))
{
    var chart_note = chart_data.notes[chart_index];

    if (song_time < chart_note.time - spawn_offset)
    {
        break;
    }

    var note = instance_create_layer(
        800,
        150,
        "Instances_1",
        obj_note
    );

	note.note_time = chart_note.time;

    // cada tecla tiene su propio carril (su propio y fijo), asi dos notas
    // con el mismo tiempo objetivo no se dibujan una encima de la otra
    if (chart_note.key == "up")
    {
        note.note_key = vk_up;
        note.y = 58;
    }
    else if (chart_note.key == "down")
    {
        note.note_key = vk_down;
        note.y = 128;
    }
    else if (chart_note.key == "left")
    {
        note.note_key = vk_left;
        note.y = 198;
    }
    else if (chart_note.key == "right")
    {
        note.note_key = vk_right;
        note.y = 268;
    }

    chart_index++;
}

// el feedback ahora se apaga solo despues de su tiempo, sin depender de
// que aparezca una nota nueva (antes este decremento faltaba y el texto
// quedaba fijo en pantalla despues del primer acierto/fallo)
if (feedback_timer > 0)
{
    feedback_timer -= 1;
}

// fin de nivel: la cancion se reproduce una sola vez (sin loop), asi que
// cuando deja de sonar es porque termino. se pide ademas que ya se hayan
// creado todas las notas del chart, para no confundir el fin de nivel con
// el instante inicial (sound_lvl1 tiene preload:false, asi que puede
// tardar un frame en arrancar y audio_is_playing daria false por error)
if (!level_finished && chart_index >= array_length(chart_data.notes) && !audio_is_playing(music_instance))
{
    level_finished = true;

    // por las dudas, saca cualquier nota que haya quedado colgada
    with (obj_note)
    {
        instance_destroy();
    }
}

if (level_finished && keyboard_check_pressed(vk_enter))
{
    room_restart();
}