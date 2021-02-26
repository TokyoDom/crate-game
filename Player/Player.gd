extends KinematicBody2D

onready var ray = $RayCast2D
onready var sprite = $AnimatedSprite
onready var tween = $Tween

var last_move = null

const TILE_SIZE: int = 64
const inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}

func _unhandled_input(event: InputEvent) -> void:
	if tween.is_active(): return
	
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			animate(direction)
			move(direction)

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
		0, #duration, not using tween rn
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	
	if not ray.is_colliding():
		tween.start()
	else:
		var collider = ray.get_collider()
		
		if collider.is_in_group("crate"):
			if collider.move(direction):
				tween.start()
		
		if collider.is_in_group("disabled_blocker"):
			tween.start()


func animate(direction):
	sprite.play(direction)
	
func _ready() -> void:
	pass
