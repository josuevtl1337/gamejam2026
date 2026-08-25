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