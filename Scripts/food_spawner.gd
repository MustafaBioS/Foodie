extends Node2D

@onready var spawner_pos = $Spawner
var burgerS = preload("uid://btcdwmikwtvf5")
var friesS = preload("uid://bp3o4t3uetd2i")
var colaS = preload("uid://d0qr6nn4cao2s")
@onready var time = $Timer

func _ready() -> void:
	randomize()
	time.start()

func _process(delta: float) -> void:
	time.wait_time = State.dropSec

func spawn() -> void:
	if spawner_pos.get_child_count() == 0:
		return
		
	var spawn_points = spawner_pos.get_children()
	var spawn_index = randi() % spawn_points.size()
	
	var food_scenes = [burgerS, friesS, colaS]
	var chosen_scene = food_scenes[randi() % food_scenes.size()]
	
	var food = chosen_scene.instantiate()
	food.global_position = spawn_points[spawn_index].global_position
	
	add_child(food)

func _on_timer_timeout() -> void:
	if State.paused == false and State.options == false and State.shop == false and State.win == false:
		spawn()
