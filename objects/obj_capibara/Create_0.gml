x= 500;
y= 500;

commentary_text = "";
commentary_display = "";

commentary_index = 0;
commentary_speed = 1.5;

commentary_finished = false;

text_sound_timer = 0;

function start_commentary(_text)
{
    commentary_text = _text;
    commentary_display = "";

    commentary_index = 0;
    commentary_finished = false;
}