class_name Player extends CharacterBody2D

var coyote_frames = 4
var is_coyote = false
var jumped = false
var facing = 1
const SPEED = 350.0
const JUMP_VELOCITY = -700.0

func _ready() -> void:
	$Timer.wait_time = coyote_frames / 60.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		if !jumped:
			is_coyote = true
			$Timer.start()
	else:
		jumped = false
	
	if Input.is_action_just_pressed("up"):
		
		if (is_on_floor() or is_coyote):
			jumped = true
			velocity.y = JUMP_VELOCITY
		else:
			pass

	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimationPlayer.play("walk-left")
		else:
			$AnimationPlayer.play("walk-right")
	else:
		if velocity.x != 0:
			facing = velocity.x
			if facing < 0:
				$AnimationPlayer.play("idle-left")
			else:
				$AnimationPlayer.play("idle-right")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func _on_timer_timeout() -> void:
	jumped = true
	is_coyote = false
