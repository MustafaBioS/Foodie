extends Control
@onready var btns = $BtnCon
@onready var title = $Title

@onready var options = $OptionsTab
@onready var arrow = $OptionsTab/LeftArrow
@onready var anim = $Fade/AnimationPlayer
@onready var fade = $Fade

func _ready() -> void:
	btns.visible = true
	title.visible = true
	options.visible = false
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
	State.win = false
	State.cont = false
	anim.play("FadeIn")
	await get_tree().create_timer(1.0).timeout
	fade.visible = false
	
func _on_play_pressed() -> void:
	anim.play("Fadeout")
	fade.visible = true
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


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
