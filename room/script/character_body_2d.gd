extends CharacterBody2D


@export var animated_sprite : AnimatedSprite2D

const SPEED = 100.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")
	var direction : Vector2 = Vector2(direction_x,direction_y)
	velocity = direction.normalized() * SPEED
	
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.length() > 0:	
		if velocity.x > 0.01:
			animated_sprite.flip_h = true	
			animated_sprite.play("walk")
		elif velocity.x < -0.01:
			animated_sprite.flip_h = false
			animated_sprite.play("walk")
		if velocity.y > 0.01:
			animated_sprite.play("down")
		if velocity.y < -0.01:
			animated_sprite.play("up")
	else: 
		animated_sprite.play("idle")



	move_and_slide()
