if (!visible)
{
    exit;
}

//EFECTO DEL TEXTO 
if (!commentary_finished)
{
    commentary_index += commentary_speed;

    if (commentary_index >= string_length(commentary_text))
    {
        commentary_index = string_length(commentary_text);

        commentary_finished = true;
    }

    commentary_display = string_copy(
        commentary_text,
        1,
        floor(commentary_index)
    );
}

//BOTON DE CONTINUAR
if (keyboard_check_pressed(vk_enter))
{
    if (!commentary_finished)
    {
        commentary_index = string_length(commentary_text);

        commentary_display = commentary_text;

        commentary_finished = true;
    }
    else
    {
        visible = false;
		with (obj_game)
		{
		    commentator_finished();
		}
		instance_destroy();
    }
}