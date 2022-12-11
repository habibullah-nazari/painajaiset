extends Area2D


func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "max":
			GeneralData.dialog_num = 1
			GeneralData.dialog = true
			queue_free()
