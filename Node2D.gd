
extends Node2D

var screen_size
var pad_size

func _ready():
	screen_size = get_viewport_rect().size
	pad_size = get_node("left").get_texture().get_size()
	set_process(true)
	set_process_input(true)

var ball_speed = 200
#direction of the ball (normal vector)

var direction = Vector2(-1, 0)
#constant for pad speed (also in pixels/second)

const PAD_SPEED = 250

func _process(delta):
	var ball_pos = get_node("ball").get_pos()
	var left_rect = Rect2( get_node("left").get_pos() - pad_size/2, pad_size )
	var right_rect = Rect2( get_node("right").get_pos() - pad_size/2, pad_size )
	ball_pos += direction * ball_speed * delta
	if ( (ball_pos.y < 0 and direction.y < 0) or (ball_pos.y > screen_size.y and direction.y > 0)):
	    direction.y = -direction.y
	if ( (left_rect.has_point(ball_pos) and direction.x < 0) or (right_rect.has_point(ball_pos) and direction.x > 0)):
	    direction.x = -direction.x
	    ball_speed *= 1.1
	    direction.y = randf() * 2.0 - 1
	    direction = direction.normalized()
	if (ball_pos.x < 0 or ball_pos.x > screen_size.x):
	    ball_pos = screen_size * 0.5  # ball goes to screen center
	    ball_speed = 200
	    direction = Vector2(-1, 0)
	get_node("ball").set_pos(ball_pos)
	#move left pad
	var left_pos = get_node("left").get_pos()
	
	if (left_pos.y > 0 and Input.is_action_pressed("left_move_up")):
	    left_pos.y += -PAD_SPEED * delta
	if (left_pos.y < screen_size.y and Input.is_action_pressed("left_move_down")):
	    left_pos.y += PAD_SPEED * delta
	
	get_node("left").set_pos(left_pos)
	
	#move right pad
	var right_pos = get_node("right").get_pos()
	
	if (right_pos.y > 0 and Input.is_action_pressed("right_move_up")):
	    right_pos.y += -PAD_SPEED * delta
	if (right_pos.y < screen_size.y and Input.is_action_pressed("right_move_down")):
	    right_pos.y += PAD_SPEED * delta
	
	get_node("right").set_pos(right_pos)
	
func _input(event):
	if(event.type == InputEvent.SCREEN_DRAG):
		var nodeToMove
		if (event.x < 200):
			nodeToMove = "left"
		elif (event.x > 640-200):
			nodeToMove = "right"
		else:
			return
		var right_pos = get_node(nodeToMove).get_pos()
		right_pos.y += event.relative_y
		get_node(nodeToMove).set_pos(right_pos)
	
	

	


