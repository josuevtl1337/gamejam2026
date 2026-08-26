if (obj_game.combo_miss >= 5)
{
    sprite_index = hinchadaENOJADOS;
}
else
{
    switch (obj_game.hinchada_level)
    {
        case 0:
            sprite_index = hinchadaIDLE;
            break;

        case 1:
            sprite_index = hinchadaCONTENTOS;
            break;

        case 2:
            sprite_index = hinchadaEUFORICOS;
            break;
    }
}