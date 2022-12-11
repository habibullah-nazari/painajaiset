extends ColorRect


func _physics_process(delta):
	if GeneralData.bridge == false:
		visible = true
		
	else:
		visible = false
