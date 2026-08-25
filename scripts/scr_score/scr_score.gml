// procesa el resultado de una nota (PERFECT/GOOD/MISS) sobre la partida
// actual. se llama como "with (obj_game) { game_register_result(...) }"
// (ver obj_note/Step_0.gml), asi que self es obj_game y esta funcion
// lee/escribe directamente sus variables score, combo y combo_bar.

function game_register_result(_result)
{
    switch (_result)
    {
        case "PERFECT":
            score += 100;
            combo += 1;
            combo_bar = min(100, combo_bar + 12);
            perfect_count += 1;
            break;

        case "GOOD":
            score += 50;
            // el combo se mantiene: no suma pero tampoco corta la racha
            combo_bar = min(100, combo_bar + 4);
            good_count += 1;
            break;

        case "MISS":
        default:
            combo = 0;
            combo_bar = max(0, combo_bar - 25);
            miss_count += 1;
            break;
    }
}
