extends Node2D
class_name Entity
@export var speed = 0
@export var spawn_position : Vector2
@export var offset_height : float
@onready var area_2d: Area2D = $Area2D


func _ready() -> void:
	var target_height = randi_range(spawn_position.y - offset_height , spawn_position.y+offset_height)
	spawn_position = Vector2(spawn_position.x , target_height)
	area_2d.area_entered.connect(on_area_entered)


func _process(delta: float) -> void:
	move(delta)


func on_area_entered(area2d : Area2D):
	queue_free()

func move(delta):
	position.x += -speed * delta

	
