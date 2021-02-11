extends RigidBody2D


signal scored

var min_bounce_velocity := 300
var max_velocity := 700
var push_force := 10000
var score := 10
var multiplier := 1
var starting_position := Vector2.ZERO

func _ready() -> void:
	starting_position = global_position

func _physics_process(delta):
		
	for _body in get_colliding_bodies():
		if _body.is_in_group("paddle"):
			multiplier = 1
			
			print(linear_velocity)
			if abs(linear_velocity.x) > min_bounce_velocity or abs(linear_velocity.y) > min_bounce_velocity:
				var _distance_from_center = global_position.distance_to(_body.global_position)
				var _direction = 1 if global_position > _body.global_position else -1
				
				apply_central_impulse(Vector2(_distance_from_center * abs(linear_velocity.y) * 10 * _direction, 0))
		
		if _body.is_in_group("brick"):
			_body.get_node("AnimationPlayer").play("hit")
			emit_signal("scored", score * multiplier)
			
			multiplier += 1


func _on_VisibilityNotifier2D_screen_exited() -> void:
	gravity_scale = 0
	linear_velocity = Vector2.ZERO
	scale = Vector2.ZERO
	global_position = starting_position
	$AnimationPlayer.play("spawn")
