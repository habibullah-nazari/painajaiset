extends KinematicBody2D


var mini_y = -100
var mini_x = 0
var appeared = false

func _physics_process(_delta):
	GeneralData.mini_x = position.x
	GeneralData.mini_y = position.y
	if GeneralData.mini == false:
		visible = false
	elif GeneralData.mini == true and appeared == false:
		visible = true
		$AnimationPlayer.play("mini_appear")
		appeared = true
		

	if GeneralData.max_dir == -1:
		position.x = GeneralData.max_x -100
		position.y = GeneralData.max_y -100
		
	else:
		position.x = GeneralData.max_x +100
		position.y = GeneralData.max_y -100

