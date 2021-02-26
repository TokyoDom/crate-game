extends Node2D

onready var exit = $Exit
var game_end = false

func _process(_delta: float) -> void:
	if not game_end and exit.occupied:
		var next_level = str(int(get_tree().current_scene.name) + 1)
		get_tree().change_scene("res://Levels/Level" + next_level + ".tscn")
		game_end = true
