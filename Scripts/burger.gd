extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	if not is_on_floor() and State.paused == false:
		velocity += get_gravity() * delta

	if State.paused == false:
		move_and_slide()

func _on_burger_area_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		queue_free()
		State.score += State.scoreMulti
