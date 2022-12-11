extends CanvasLayer

func _ready():
	$Panel/Attempts/num.text = String(GeneralData.game_over)
	
func _physics_process(_delta):
	$AnimationPlayer.play("def")

#func _input(event):
	#if event.is_action_pressed("exit"):
		#get_tree().paused = !get_tree().paused
	
