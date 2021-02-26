extends Area2D

var occupied = false


func _ready() -> void:
	pass


func _on_Exit_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		occupied = true


func _on_Exit_body_exited(body: Node) -> void:
	pass # Replace with function body.
