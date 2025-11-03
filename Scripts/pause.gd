extends CanvasLayer
@onready var pause = $"."
@onready var btns = $BtnCon
@onready var title = $PauseTitle
@onready var options = $"../OptionsTab"
@onready var shop = $"../Shop"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	State.options = false
	btns.visible = true
	title.visible = true
	options.visible = false
	shop.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_resume_pressed() -> void:
	State.paused = false
	pause.visible = false

func _on_shop_pressed() -> void:
	State.shop = true
	btns.visible = false
	title.visible = false
	shop.visible = true
	
func _on_options_pressed() -> void:
	State.options = true
	btns.visible = false
	title.visible = false
	options.visible = true
	
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_left_arrow_pressed() -> void:
	State.options = false
	btns.visible = true
	title.visible = true
	options.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if State.options == true:
		if Input.is_action_just_pressed("back"):
			State.options = false
			btns.visible = true
			title.visible = true
			options.visible = false
			
	if State.shop == true:
		if Input.is_action_just_pressed("back"):
			State.shop = false
			shop.visible = false
			btns.visible = true
			title.visible = true


func _on_left_arrow_2_pressed() -> void:
	State.shop = false
	shop.visible = false
	btns.visible = true
	title.visible = true
