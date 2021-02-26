extends Area2D

func _on_CrateButton_body_entered(body: Node) -> void:
	if body.is_in_group("crate"):
		get_tree().call_group("blocker", "disable")


func _on_CrateButton_body_exited(body: Node) -> void:
	if body.is_in_group("crate"):
		get_tree().call_group("blocker", "enable")
