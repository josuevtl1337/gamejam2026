if (keyboard_check_pressed(vk_up))
{
   var tiempo = round(audio_sound_get_track_position(music_instance) * 1000) / 1000;

    array_push(notes, {
        time: tiempo,
        key: vk_up
    });
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