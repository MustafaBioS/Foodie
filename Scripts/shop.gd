extends Control
@onready var speed = $HBoxContainer/Speed
@onready var score = $HBoxContainer/Score
@onready var drops = $HBoxContainer/Drops
@onready var pause = $"../../Pause"
@onready var options = $"../../OptionsTab"
@onready var speedPrice = $HBoxContainer2/SpeedPrice
@onready var scorePrice = $HBoxContainer2/ScorePrice
@onready var dropPrice = $HBoxContainer2/DropPrice
@onready var shop = $".."
@onready var fade = $"../../Fade"
@onready var anim = $"../../Fade/AnimationPlayer"
@onready var win = $"../../Win"


var speedBuys = 0
var scoreBuys = 0
var dropBuys = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speedPrice.text = str(State.speedPrice)
	scorePrice.text = str(State.scorePrice)
	dropPrice.text = str(State.dropPrice)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func check_win():
	if State.cont == false and speedBuys == 5 and scoreBuys == 5 and dropBuys == 5:
		shop.visible = false
		pause.visible = false
		options.visible = false
		State.paused = false
		State.shop = false
		State.options = false
		
		State.win = true
		win.visible = true
	
	if speedBuys == 5:
		speed.disabled = true
	if scoreBuys == 5:
		score.disabled = true
	if dropBuys == 5:
		drops.disabled = true

func _on_speed_pressed() -> void:
	speedBuys += 1
	State.SPEED = round(State.SPEED * 1.15)
	State.speedPrice = round(State.speedPrice * 1.2)
	check_win()
	
func _on_score_pressed() -> void:
	scoreBuys += 1
	State.scoreMulti += 1
	State.scorePrice = round(State.scorePrice * 1.2)
	check_win()
	
func _on_drops_pressed() -> void:
	dropBuys += 1
	State.dropSec -= 0.5
	State.dropPrice = round(State.dropPrice * 1.2)
	check_win()

func _on_continue_pressed() -> void:
	print("clicked")
	print(State.paused)
	print(State.options)
	print(State.shop)
	print(State.win)
	print(State.cont)
	
	win.visible = false
	pause.visible = false
	options.visible = false
	shop.visible = false
	
	State.win = false
	State.paused = false
	State.shop = false
	State.options = false
	State.cont = true
	
	print(State.paused)
	print(State.options)
	print(State.shop)
	print(State.win)
	print(State.cont)


func _on_back_menu_pressed() -> void:
	anim.play("Fadeout")
	fade.visible = true
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
