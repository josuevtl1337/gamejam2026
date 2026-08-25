var song_time = audio_sound_get_track_position(obj_game.music_instance);

var time_remaining = note_time - song_time;

x = timing_x + ((time_remaining / travel_time) * (spawn_x - timing_x));

//x -= speed;

// ==========================================
// DISTANCIA AL TIMING
// ==========================================

var distance = abs(x - timing_x);


// ==========================================
// COMPROBAR HIT
// ==========================================
// se evalua solo la tecla propia de esta nota (note_key). asi, cuando hay
// dos notas activas al mismo tiempo (notas dobles), presionar la tecla de
// una no afecta a la otra: cada una se evalua de forma independiente.

if (keyboard_check_pressed(note_key) && distance <= 60)
{
    var feedback;

    if (distance <= 20)
    {
        feedback = "PERFECT";
    }
    else
    {
        feedback = "GOOD";
    }

    with (obj_game)
    {
        notes_count = notes_count + 1;
        game_register_result(feedback);

        feedback_text = feedback;
        feedback_timer = 60;
    }

    instance_destroy();
}


// ==========================================
// NOTA PERDIDA
// ==========================================

if (x < timing_x - 50)
{
    with (obj_game)
    {
        game_register_result("MISS");

        feedback_text = "MISS";
        feedback_timer = 60;
    }

    instance_destroy();
}