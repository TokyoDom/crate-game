extends Area2D


func _ready() -> void:
	pass


func _on_Ice_body_entered(body: Node) -> void:
	if body is KinematicBody2D:
		body.call("move", body.last_move)
