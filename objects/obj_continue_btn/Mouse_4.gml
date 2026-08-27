with(obj_game){
	    show_debug_message("CURRENT LEVEL: " + string(current_level));
	next_level();	 
}

with(obj_capibara){
	instance_destroy();
}
instance_destroy();
