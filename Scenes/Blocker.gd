extends StaticBody2D

onready var sprite = $AnimatedSprite

func disable():
	sprite.play("disabled")
	add_to_group("disabled_blocker")
	
func enable():
	sprite.play("enabled")
	remove_from_group("disabled_blocker")


func _ready() -> void:
	pass
