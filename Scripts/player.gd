extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

var is_attacking = false
var move_speed = 200

func _ready():
	sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta):
	if is_attacking:
		return

	var input_vector = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()
	velocity = input_vector * move_speed
	move_and_slide()

	if input_vector != Vector2.ZERO:
		sprite.play("walk")
		if input_vector.x != 0:
			sprite.flip_h = input_vector.x < 0
	elif Input.is_action_just_pressed("attack"):
		attack()
	else:
		sprite.stop()


func attack():
	is_attacking = true
	sprite.play("attack")

func _on_animation_finished():
	if sprite.animation == "attack":
		is_attacking = false
