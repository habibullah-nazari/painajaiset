extends KinematicBody2D

func _physics_process(_delta):
	if GeneralData.key_lock == true:
		get_node("CollisionShape2D").disabled = false
		visible = false
	
	elif GeneralData.key_lock == false:
		get_node("CollisionShape2D").disabled = true
		visible = true
