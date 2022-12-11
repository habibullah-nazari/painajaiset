extends Area2D

# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "max":
# warning-ignore:return_value_discarded
			get_tree().reload_current_scene()
			GeneralData.game_over += 1
