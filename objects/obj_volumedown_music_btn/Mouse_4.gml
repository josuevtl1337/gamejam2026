with(obj_volume_bar){
	obj_volume_bar.music_volume = max(0, obj_volume_bar.music_volume - 0.25);
	actualizar_volumen_musica();
}
