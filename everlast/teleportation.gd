extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
var alive = true
var movement = 0
var raycast = preload("res://raycast.tscn")
var end_position
func _ready() -> void:
	raycast = raycast.instantiate()
	add_child(raycast)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("move_left"):
		movement = 1
	if Input.is_action_just_pressed("move_right"):
		movement = 2
	if Input.is_action_just_pressed("gravity_switch"):
		if movement == 1:
			raycast.rotation = deg_to_rad(90)
		if movement == 2:
			raycast.rotation = deg_to_rad(270)
		end_position = raycast.to_global(raycast.target_position)
		if raycast.is_colliding():
			end_position = raycast.get_collision_point()
		global_position = end_position
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if alive:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x=0


	move_and_slide()
