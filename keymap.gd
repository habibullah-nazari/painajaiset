extends Node2D

var keymap = false

func _physics_process(_delta):
	
	if keymap == false:
		visible = false
		
	else:
		visible = true
		
	if Input.is_action_just_pressed("keymap_show") and keymap == false:
		keymap = true
	
	elif Input.is_action_just_pressed("keymap_show") and keymap == true:
		keymap = false
