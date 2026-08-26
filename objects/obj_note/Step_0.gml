var song_time = audio_sound_get_track_position(obj_game.music_instance);

var time_remaining = note_time - song_time;

x = timing_x + ((time_remaining / travel_time) * (spawn_x - timing_x));

//x -= speed;

// ==========================================
// DISTANCIA AL TIMING
// ==========================================

var distance = abs(x - timing_x);


// ==========================================
// DETECTAR TECLA
// ==========================================

var pressed_key = noone;

if (keyboard_check_pressed(vk_up))
{
    pressed_key = vk_up;
}
else if (keyboard_check_pressed(vk_down))
{
    pressed_key = vk_down;
}
else if (keyboard_check_pressed(vk_left))
{
    pressed_key = vk_left;
}
else if (keyboard_check_pressed(vk_right))
{
    pressed_key = vk_right;
}


// ==========================================
// COMPROBAR HIT
// ==========================================

if (pressed_key != noone)
{
    if (distance <= 40)
    {
        var feedback = "MISS";

        // ------------------------------------------
        // TECLA CORRECTA
        // ------------------------------------------

        if (pressed_key == note_key)
        {
            if (distance <= 15)
            {
                feedback = "PERFECT";

                with (obj_game)
                {
					//barra de progreso
                    score_bar += 10;
                    score_bar = clamp(score_bar, 0, 100);
                    score_bar_color = c_green;

                    
                    combo += 1;	//sumador combo
                    combo_miss = 0; //reinicio contador miss
					
					//cambio de estado de la hinchada
					if (combo >= 20)
					{
						hinchada_level = 2;
					}
					else if (combo >= 10)
					{
						hinchada_level = 1;
					}
                }

                audio_play_sound(
                    snd_beep1,
                    1,
                    false
                );
            }
            else
            {
                feedback = "GOOD";

                with (obj_game)
                {
                    score_bar += 5;
                    score_bar = clamp(score_bar, 0, 100);
                    score_bar_color = c_blue;
   
                    combo += 1;
                    combo_miss = 0;
					
					//cambio de estado de la hinchada
					if (combo >= 20)
					{
						hinchada_level = 2;
					}
					else if (combo >= 10)
					{
						hinchada_level = 1;
					}
                }

                audio_play_sound(
                    snd_beep1,
                    1,
                    false
                );
            }
        }

        // ------------------------------------------
        // TECLA INCORRECTA = MISS
        // ------------------------------------------

        else
        {
            with (obj_game)
            {
                feedback_text = "MISS";
                feedback_timer = 60;

                score_bar -= 15;
                score_bar = clamp(score_bar, 0, 100);
                score_bar_color = c_red;

                combo = 0;
                combo_miss += 1;
				
				//pierdo un nivel 
				if (hinchada_level > 0)
				{
				    hinchada_level -= 1;
				}
            }

            audio_play_sound(
                snd_boop,
                1,
                false
            );
        }

        // ------------------------------------------
        // FEEDBACK
        // ------------------------------------------

        with (obj_game)
        {
            feedback_text = feedback;
            feedback_timer = 60;
        }

        instance_destroy();
    }
}


// ==========================================
// NOTA PERDIDA
// ==========================================

if (x < timing_x - 50)
{
    with (obj_game)
    {
        feedback_text = "MISS";
        feedback_timer = 60;

        score_bar -= 15;
        score_bar = clamp(score_bar, 0, 100);
        score_bar_color = c_red;

        //sumo a contador de miss
        combo = 0;
        combo_miss += 1;
    }

    audio_play_sound(
        snd_boop,
        1,
        false
    );

    instance_destroy();
}