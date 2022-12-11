extends Node2D

func _ready():
	$AnimationPlayer.play("victory")
	yield($AnimationPlayer, "animation_finished")
	$AnimationPlayer.play("def")

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
