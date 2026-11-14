extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var ngravity = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if Input.is_action_just_pressed("gravity_switch") and (is_on_ceiling()or is_on_floor()):
		ngravity = -1*ngravity
		self.rotation_degrees += 180
	
	#if not is_on_floor():
	velocity += get_gravity() * delta * ngravity
	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY 
		if is_on_ceiling():
			velocity.y = JUMP_VELOCITY * ngravity
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
