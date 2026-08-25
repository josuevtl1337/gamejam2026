show_debug_message(note_key);
switch (note_key)
{
    case vk_up:
        draw_sprite(arrow_up, 0, x, y);
        break;

    case vk_down:
        draw_sprite(arrow_down, 0, x, y);
        break;

    case vk_left:
        draw_sprite(arrow_left, 0, x, y);
        break;

    case vk_right:
        draw_sprite(arrow_right, 0, x, y);
        break;
}