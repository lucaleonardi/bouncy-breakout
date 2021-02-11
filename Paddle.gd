extends KinematicBody2D


var speed = 50
var max_speed = 150
var damping = .88
var gravity = 32

var motion := Vector2()
var mouse_is_in_window: bool

func _physics_process(delta):
#	var xaxis = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	
	if mouse_is_in_window:
		global_position.x = get_global_mouse_position().x
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		motion.y -= gravity * 2
	else:
		motion.y += gravity


#	motion.x = clamp(motion.x + xaxis * speed, -max_speed, max_speed)
	
	motion = move_and_slide(motion, Vector2.UP)
	
#	motion.x *= damping

func _notification(what):
	if what == NOTIFICATION_WM_MOUSE_ENTER:
		mouse_is_in_window = true
	
	if what == NOTIFICATION_WM_MOUSE_EXIT:
		mouse_is_in_window = false
