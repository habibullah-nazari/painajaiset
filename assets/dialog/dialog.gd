extends Node2D

var dialog = false

func _physics_process(_delta):
	
	if dialog == false:
		visible = false
		
	else:
		visible = true
		
	if Input.is_action_just_pressed("f2") and dialog == false:
		dialog = true
	
	elif Input.is_action_just_pressed("f2") and dialog == true:
		dialog = false
