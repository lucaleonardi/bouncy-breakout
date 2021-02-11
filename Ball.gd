extends RigidBody2D


signal ball_bounce

var push_force := 10000

func _physics_process(delta):
	for _body in get_colliding_bodies():
		if _body.is_in_group("paddle"):
			var _distance_from_center = global_position.distance_to(_body.global_position)
			var _direction = 1 if global_position > _body.global_position else -1
			
			apply_central_impulse(Vector2(_distance_from_center * push_force * _direction, 0))
