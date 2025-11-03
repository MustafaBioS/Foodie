extends CharacterBody2D
@onready var pause = $"../Pause"

const JUMP_VELOCITY = -400.0

func player():
	pass
	
func _ready() -> void:
	pause.visible = false
	State.paused = false

func _process(delta: float) -> void:
	print(State.SPEED)

func _physics_process(delta: float) -> void:

	var direction := Input.get_axis("a", "d")
	if direction and State.paused == false:
		velocity.x = direction * State.SPEED
	else:
		if State.paused == false:
			velocity.x = move_toward(velocity.x, 0, State.SPEED)
			
	if State.paused == false:
		move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause") and State.paused == false and State.options == false and State.shop == false:
		State.paused = true
		pause.visible = true
		
	elif Input.is_action_just_pressed("pause") and State.paused == true and State.options == false and State.shop == false:
		pause.visible = false
		State.paused = false
