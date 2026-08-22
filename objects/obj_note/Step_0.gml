y += fall_speed;

var distance = abs(y - timing_y);

if (keyboard_check_pressed(note_key))
{
    if (distance <= 20)
    {
		with (obj_game)
        {
            feedback_text = "PERFECT";
            feedback_timer = 60;
        }
        instance_destroy();
    }
    else if (distance <= 60)
    {
		with (obj_game)
        {
            feedback_text = "GOOD";
            feedback_timer = 60;
        }
        instance_destroy();
    }
    else
    {
        with (obj_game)
        {
            feedback_text = "MISS";
            feedback_timer = 60;
        }

        instance_destroy();
    }
}

if (y > timing_y + 100)
{
    with (obj_game)
        {
            feedback_text = "MISS";
            feedback_timer = 60;
        }

    instance_destroy();
}