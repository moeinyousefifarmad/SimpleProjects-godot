extends Node

@export var Entities: Array[PackedScene] = []
@onready var spawn_rate: Timer = $SpawnRate
@export var random_Spawn_rate : Vector2

func spawn(entity:PackedScene):
	var entity_instance = entity.instantiate()
	add_child(entity_instance)
	entity_instance.position = entity_instance.spawn_position


func _on_spawn_rate_timeout() -> void:
	spawn(Entities.pick_random())
	spawn_rate.wait_time = randi_range(random_Spawn_rate.y , random_Spawn_rate.x)
