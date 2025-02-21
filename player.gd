extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var coyoteRunning: bool = true
@onready var coyote_timer = $CoyoteTimer


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if coyote_timer.is_stopped():
			coyote_timer.start(0.5)
	else:
		coyoteRunning = true

	# Handle jump.
	if Input.is_action_just_pressed("jump_action") and coyoteRunning:
		velocity.y = JUMP_VELOCITY
		coyoteRunning = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_coyote_timer_timeout():
	coyoteRunning = false
