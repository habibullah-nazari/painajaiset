extends KinematicBody2D


var smoke_move = Vector2()
var smoke_speed = 750
var suunta = -1

		
func _physics_process(_delta):
	smoke_move.y = smoke_move.y +5
	smoke_move.x = smoke_speed * suunta
	smoke_move = move_and_slide(smoke_move, Vector2.UP)
	
	if is_on_wall():
		suunta = suunta * -1
		$Body/body.flip_h = not $Body/body.flip_h
		
	elif GeneralData.demon == true:
		$AnimationPlayer.play("walk")
	
	elif GeneralData.demon == false:
		$AnimationPlayer.play("dead")
		yield($AnimationPlayer, "animation_finished")
		queue_free()
		

