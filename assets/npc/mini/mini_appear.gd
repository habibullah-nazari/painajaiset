extends Area2D


func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "max":
			GeneralData.mini = true
			queue_free()
