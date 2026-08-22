
if (instance_number(obj_note) == 0)
{

    spawn_timer -= 1;

    if (spawn_timer <= 0)
    {
        var key = choose(
            vk_up,
            vk_down,
            vk_left,
            vk_right
        );

        var note = instance_create_layer(
            360,
            100,
            "Instances",
            obj_note
        );

        note.note_key = key;

        spawn_timer = 30;
    }
	if (feedback_timer > 0)
	{
	    feedback_timer--;
	}
	feedback_timer = 60
}