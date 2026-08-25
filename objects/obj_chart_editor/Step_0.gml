// una sola lectura de tiempo por step: si se tocan dos flechas en el
// mismo frame (para grabar una nota doble) quedan con el mismo timestamp
var tiempo = round(audio_sound_get_track_position(music_instance) * 1000) / 1000;

// se graba "up"/"down"/"left"/"right" (string), igual que el chart real
// que ya usa obj_game/Create_0.gml, para poder copiar el resultado tal cual
if (keyboard_check_pressed(vk_up))
{
    array_push(notes, { time: tiempo, key: "up" });
}

if (keyboard_check_pressed(vk_down))
{
    array_push(notes, { time: tiempo, key: "down" });
}

if (keyboard_check_pressed(vk_left))
{
    array_push(notes, { time: tiempo, key: "left" });
}

if (keyboard_check_pressed(vk_right))
{
    array_push(notes, { time: tiempo, key: "right" });
}

if (keyboard_check_pressed(vk_f5))
{
    var data = {
        song: "music_song",
        notes: notes
    };

    var json = json_stringify(data);

    var file = file_text_open_write("chart1.json");
    file_text_write_string(file, json);
    file_text_close(file);
    
    show_debug_message("Chart guardado.");
}