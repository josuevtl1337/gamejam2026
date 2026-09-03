
with(obj_volume_bar){
	obj_volume_bar.effect_volume = min(1, obj_volume_bar.effect_volume + 0.25);
	actualizar_volumen_efectos();
}
