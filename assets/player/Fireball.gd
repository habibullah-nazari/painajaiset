extends Area2D

const SPEED = 2700
var velocity = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	velocity.x = SPEED * GeneralData.fireball_dir * delta
	translate(velocity)
	
	
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "TileMap":
			GeneralData.fireball_count += 1
			queue_free()
		
		elif body.name == "Granny":
			GeneralData.Granny_hp -= 5
			GeneralData.fireball_count += 1
			queue_free()
			
		elif body.name == "demon":
			GeneralData.demon = false
			GeneralData.fireball_count += 1
			queue_free()
			
		elif body.name == "demon2":
			GeneralData.demon2 = false
			GeneralData.fireball_count += 1
			queue_free()
			
		elif body.name == "wall":
			GeneralData.wall = false
			GeneralData.fireball_count += 1
			queue_free()
			
		elif GeneralData.demon == false:
			$AnimationPlayer.play("damaged")
			yield($AnimationPlayer, "animation_finished")
			GeneralData.demon = true
			
		else:
			$AnimationPlayer.play("default")
