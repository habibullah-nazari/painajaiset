extends KinematicBody2D


func _physics_process(_delta):
	if GeneralData.boss1 == true:
		visible = true
		get_node("CollisionShape2D").disabled = false
	else:
		visible = false
		get_node("CollisionShape2D").disabled = true
