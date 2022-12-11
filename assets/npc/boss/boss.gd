extends KinematicBody2D

	
var boss_move = Vector2()
var boss_speed = 600

func _physics_process(_delta):
	$AnimationPlayer.play("fly")
