extends CharacterBody2D
@onready var anim = $"../Fade/AnimationPlayer"
@onready var fade = $"../Fade"
@onready var win = $"../Win"
@onready var pause = $"../Pause"
@onready var btns = $"../Pause/BtnCon"
@onready var title = $"../Pause/PauseTitle"

const JUMP_VELOCITY = -400.0

func player():
	pass
	
func _ready() -> void:
	win.visible = false
	pause.visible = false
	State.paused = false
	State.win == false
	anim.play("FadeIn")
	await get_tree().create_timer(1.0).timeout
	fade.visible = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and State.paused == false and State.options == false and State.shop == false and State.win == false:
		State.paused = true
		pause.visible = true
		btns.visible = true
		title.visible = true
		print(State.paused)
		print(pause.visible)
		
	elif Input.is_action_just_pressed("pause") and State.paused == true and State.options == false and State.shop == false and State.win == false:
		State.paused = false
		pause.visible = false
		pause.visible = false
		title.visible = false
		print(State.paused)
		print(pause.visible)

func _physics_process(delta: float) -> void:

	var direction := Input.get_axis("a", "d")
	if direction and State.paused == false and State.win == false:
		velocity.x = direction * State.SPEED
	else:
		if State.paused == false and State.win == false:
			velocity.x = move_toward(velocity.x, 0, State.SPEED)
			
	if State.paused == false and State.win == false:
		move_and_slide()
