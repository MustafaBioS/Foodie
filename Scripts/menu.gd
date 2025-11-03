extends Control
@onready var btns = $BtnCon
@onready var title = $Title

@onready var options = $OptionsTab
@onready var arrow = $OptionsTab/LeftArrow

func _ready() -> void:
	btns.visible = true
	title.visible = true
	options.visible = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	State.SPEED = 750.0
	State.score = 0
	State.paused = false
	State.options = false
	State.speedBoost = false
	State.scoreBoost = false
	State.dropBoost = false
	State.speedPrice = 1
	State.scorePrice = 2
	State.dropPrice = 3
	State.scoreMulti = 1
	State.dropSec = 3
	State.shop = false

func _on_options_pressed() -> void:
	btns.visible = false
	title.visible = false
	options.visible = true
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_left_arrow_pressed() -> void:
	btns.visible = true
	title.visible = true
	options.visible = false


func _unhandled_input(event: InputEvent) -> void:
	if options.visible == true:
		if Input.is_action_just_pressed("back"):
			btns.visible = true
			title.visible = true
			options.visible = false
