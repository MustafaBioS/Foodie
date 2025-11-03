extends Control
@onready var speed = $HBoxContainer/Speed
@onready var score = $HBoxContainer/Score
@onready var drops = $HBoxContainer/Drops

@onready var speedPrice = $HBoxContainer2/SpeedPrice
@onready var scorePrice = $HBoxContainer2/ScorePrice
@onready var dropPrice = $HBoxContainer2/DropPrice
@onready var shop = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speedPrice.text = str(State.speedPrice)
	scorePrice.text = str(State.scorePrice)
	dropPrice.text = str(State.dropPrice)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_speed_pressed() -> void:
	print("clicked")
	State.SPEED = round(State.SPEED * 1.15)
	State.speedPrice = round(State.speedPrice * 1.2)
	
func _on_score_pressed() -> void:
	State.scoreMulti += 1
	State.scorePrice = round(State.scorePrice * 1.2)

func _on_drops_pressed() -> void:
	State.dropSec -= 0.5
