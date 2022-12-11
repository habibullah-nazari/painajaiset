class_name Player
extends KinematicBody2D


enum States {
	IDLE = 0,
	WALK = 1,
	RUN = 2,
	FLY = 3,
	FALL = 4,
}

var speed = Vector2(200.0, 900.0)
var velocity = Vector2.ZERO
var falling_slow = false
var falling_fast = true
var no_move_horizontal_time = 0.0
var direction = 0

const FIREBALL = preload("res://assets/player/Fireball.tscn")

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
onready var sprite = $Sprite
onready var sprite_scale = sprite.scale.x
onready var def_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	$AnimationTree.active = true

		
func _physics_process(delta):
	
	GeneralData.max_x = position.x
	GeneralData.max_y = position.y
	velocity.y += gravity * delta
	
	
	if no_move_horizontal_time > 0.0:
		velocity.x = 0.0
		no_move_horizontal_time -= delta
		
	elif Input.is_action_pressed("tele_L") and GeneralData.stamina > 0:
		velocity.x -= 200
		GeneralData.stamina -= 0.5
		
	elif Input.is_action_pressed("tele_R") and GeneralData.stamina > 0:
		velocity.x += 200
		GeneralData.stamina -= 0.5
	
	else:
		velocity.x = (Input.get_action_strength("move_right") - Input.get_action_strength("move_left")) * speed.x
		
		


	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("fire") and GeneralData.fireball_count > 0 and GeneralData.stamina > 0 and GeneralData.mini_shoot == true:
		GeneralData.fireball_count -= 1
		GeneralData.stamina -= 1
		GeneralData.fireball_dir = direction
		var fireball = FIREBALL.instance()
		fireball.position.x = GeneralData.mini_x
		fireball.position.y = GeneralData.mini_y
		get_parent().add_child(fireball)
	
		



	if velocity.x > 0:
		sprite.transform.x = Vector2(sprite_scale, 0)
		direction = 1
		GeneralData.max_dir = 1
		
		
	elif velocity.x < 0:
		sprite.transform.x = Vector2(-sprite_scale, 0)
		direction = -1
		GeneralData.max_dir = -1
		
	if velocity.y > 500:
		falling_fast = true
		falling_slow = false
	elif velocity.y > 300:
		falling_slow = true
	


	if is_on_floor():
		if falling_fast:
			$AnimationTree["parameters/land_hard/active"] = true
			no_move_horizontal_time = 0.4
			falling_fast = false
		elif falling_slow:
			$AnimationTree["parameters/land/active"] = true
			falling_slow = false
		if Input.is_action_just_pressed("jump"):
			$AnimationTree["parameters/jump/active"] = true
			velocity.y = -speed.y
		if abs(velocity.x) > 50:
			$AnimationTree["parameters/state/current"] = States.RUN
			$AnimationTree["parameters/run_timescale/scale"] = abs(velocity.x) / 60
		elif velocity.x:
			$AnimationTree["parameters/state/current"] = States.WALK
			$AnimationTree["parameters/walk_timescale/scale"] = abs(velocity.x) / 12
		else:
			$AnimationTree["parameters/state/current"] = States.IDLE
	else:
		if velocity.y > 0:
			$AnimationTree["parameters/state/current"] = States.FALL
		else:
			$AnimationTree["parameters/state/current"] = States.FLY
