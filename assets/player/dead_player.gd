extends Area2D


func _physics_process(_delta):
	
	if GeneralData.hP <= 0:
		GeneralData.hP = 100
		GeneralData.game_over += 1
		get_tree().reload_current_scene()

	var bodies = get_overlapping_bodies()
	for body in bodies:

		if body.name == "demon":
			get_tree().reload_current_scene()
			GeneralData.game_over += 1
		elif body.name == "demon2":
			get_tree().reload_current_scene()
			GeneralData.game_over += 1
		elif body.name == "Granny":
			get_tree().reload_current_scene()
			GeneralData.game_over += 1
			GeneralData.boss1 = true
			GeneralData.boss2 = false
			
		elif body.name == "1":
			GeneralData.hP -= 2.5
		elif body.name == "2":
			GeneralData.hP -= 2.5
		elif body.name == "3":
			GeneralData.hP -= 2.5
		elif body.name == "4":
			GeneralData.hP -= 2.5
		elif body.name == "5":
			GeneralData.hP -= 2.5
		elif body.name == "6":
			GeneralData.hP -= 2.5
		elif body.name == "7":
			GeneralData.hP -= 2.5
		elif body.name == "8":
			GeneralData.hP -= 2.5
		elif body.name == "9":
			GeneralData.hP -= 2.5
		elif body.name == "10":
			GeneralData.hP -= 2.5
		elif body.name == "11":
			GeneralData.hP -= 2.5
		elif body.name == "12":
			GeneralData.hP -= 2.5
			
		elif body.name == "Stamina_full":
			GeneralData.stamina += 1
		
		elif body.name == "key":
			get_tree().change_scene("res://assets/victory.tscn")
			

