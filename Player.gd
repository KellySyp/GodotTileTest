extends KinematicBody2D

export var speed = 400.0
var screen_size = Vector2.ZERO
var velocity = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size
	#print(screen_size)
	#hide()

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x += -1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y += -1
	
	if direction.length() > 0:
		direction = direction.normalized()
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	#velocity.x = direction.x * speed * delta
	#velocity.y = direction.y * speed * delta
	#velocity = move_and_collide(velocity)
	position += direction * speed * delta
	move_and_collide(velocity * delta)
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	#print(position.y)
	
	#var collision = move_and_collide(velocity * delta)
	#if collision:
	#	print("I collided with ", collision.collider.name)
	
	if direction.x != 0:
		$AnimatedSprite.animation = "walk_right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction.x < 0
	elif direction.y < 0:
		$AnimatedSprite.animation = "walk_up"
		#$AnimatedSprite.flip_v = direction.y > 0
	elif direction.y > 0:
		$AnimatedSprite.animation = "walk_down"
		#$AnimatedSprite.flip_v = direction.y > 0
