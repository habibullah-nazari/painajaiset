extends Area2D


func _physics_process(_delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "max":
			GeneralData.bridge = false
			$bridge/AnimationPlayer.play("break")
			yield($bridge/AnimationPlayer, "animation_finished")
			queue_free()
			GeneralData.begin += -1
		
		elif GeneralData.game_over > 1:
			queue_free()
			
		else:
			$bridge/AnimationPlayer.play("def")
			GeneralData.bridge = true
			
