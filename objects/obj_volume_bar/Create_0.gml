music_volume = 1.0;
effect_volume = 1.0;

function actualizar_volumen_musica()
{
    audio_sound_gain(sound_lvl1, music_volume, 0);
    audio_sound_gain(sound_lvl2, music_volume, 0);
    audio_sound_gain(sound_lvl3, music_volume, 0);
}

function actualizar_volumen_efectos()
{
    audio_sound_gain(snd_beep1, effect_volume, 0);
    audio_sound_gain(snd_boop, effect_volume, 0);
    audio_sound_gain(snd_whistle_start, effect_volume, 0);
	audio_sound_gain(sound_buttonHover, effect_volume, 0);
}