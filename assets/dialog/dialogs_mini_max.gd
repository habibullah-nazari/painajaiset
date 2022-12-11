extends Label
var dialog_max_index = 0
var dialog_mini_index = 0
var dialog_max = [
	"Max:  Ahhh........where am I !!??",
	"Max:  There is a door!!!",
	"Max:  Maybe I just need to go straight!!!",
	"Continue"
]
var dialog_mini= [
	"Mini:  Hello! My name is Mini and I'm here to guide you out of the nightmare.",
	"Mini:  To do that, you need to find a key. To make it a little bit easier, I give you a super speed ability.",
	"Mini:  You can also use me to shoot light towards enemies. But you need to remember that you have limited amount of magic to use.",
	"Mini:  If you fail, you need to start from the beginning. And remember, be careful!",
	"Continue"
]
var empty = " "




func _ready():
	$press_f.visible = false

# warning-ignore:unused_argument
func _process(delta):
	if GeneralData.dialog_num == 1 and GeneralData.dialog == true and GeneralData.game_over == 1:
		$press_f.visible = true
		text = dialog_max[dialog_max_index]
		if Input.is_action_just_pressed("fire"):
			dialog_max_index += 1
		if dialog_max_index == 3:
			$press_f.visible = false
			text = empty
			GeneralData.dialog = false
			return
	
	
	elif GeneralData.dialog_num == 1 and GeneralData.dialog == true and GeneralData.game_over == 2:
		text = "Max: Ohh...how it is really possible????"
		yield(get_tree().create_timer(2), "timeout")
		text = empty
		GeneralData.dialog = false
	
	elif GeneralData.dialog_num == 1 and GeneralData.dialog == true and GeneralData.game_over >= 2:
		text = "Max: NOT AGAINNN!!!"
		yield(get_tree().create_timer(2), "timeout")
		text = empty
		GeneralData.dialog = false
		
	elif GeneralData.dialog_num == 2 and GeneralData.dialog == true and GeneralData.game_over == 1:
		$press_f.visible = true
		text = dialog_mini[dialog_mini_index ]
		if Input.is_action_just_pressed("fire"):
			dialog_mini_index += 1
		if dialog_mini_index == 4:
			text = empty
			$press_f.visible = false
			GeneralData.mini_shoot = true
			GeneralData.dialog = false
			return
