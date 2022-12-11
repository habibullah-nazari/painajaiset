extends Node

var hP = 100
var stamina = 100
var max_x = 0
var max_y = 0
var max_dir = 0
var fireball_dir = 0
var fireball_count = 1
var mini_x = 0
var mini_y = 0
var begin = 0
var game_over = 1
var mini = false
var mini_shoot = false
var dialog = false
var dialog_num = 0
var bridge = true
var demon = true
var demon2 = true
var wall = true
var Granny_hp = 100
var boss1 = true
var boss2 = false
var key_lock = true
func _physics_process(delta):
	if game_over >= 2:
		mini_shoot = true
	if stamina > 100:
		stamina  = 100
