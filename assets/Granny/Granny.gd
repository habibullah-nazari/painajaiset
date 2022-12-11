extends KinematicBody2D

var smoke_move = Vector2()
var smoke_speed = 800
var suunta = -1
func _physics_process(_delta):
	
	smoke_move.y = smoke_move.y +5
	smoke_move.x = smoke_speed * suunta
	smoke_move = move_and_slide(smoke_move, Vector2.UP)
	
	if is_on_wall():
		suunta = suunta * -1
	
	elif suunta == 1:
		$AnimationPlayer.play("walk_dir")
		
	else:
		$AnimationPlayer.play("def")
		
	if GeneralData.Granny_hp == 5 or GeneralData.Granny_hp < 0:
		GeneralData.key_lock = false
		queue_free()
		

	#elif GeneralData.demon == false:
		#$AnimationPlayer.play("dead")
		#yield($AnimationPlayer, "animation_finished")
		#queue_free()

