extends Area2D

# warning-ignore:unused_argument
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "max":
			GeneralData.boss1 = false
			GeneralData.boss2 = true
			queue_free()
