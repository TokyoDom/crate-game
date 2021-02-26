extends KinematicBody2D

onready var ray = $RayCast2D
onready var tween = $Tween

var TILE_SIZE = 64
var inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}
var last_move = null


func _ready() -> void:
	pass

func move(direction):
	last_move = direction
	
	var vector_position = inputs[direction] * TILE_SIZE
	ray.cast_to = vector_position
	ray.force_raycast_update()
	
	tween.interpolate_property(
		self,
		"position",
		position,
		position + vector_position,
		0, #duration
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	
	if not ray.is_colliding():
		tween.start()
		return true
	else:
		var collider = ray.get_collider()
	
		if collider.is_in_group("disabled_blocker"):
			tween.start()
			return true
			
	return false
