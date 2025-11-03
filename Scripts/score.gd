extends CanvasLayer
@onready var score = $ScoreLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = str(State.score)
