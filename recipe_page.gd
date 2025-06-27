extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var sparkle_sound = $sparkle_sound
@onready var found_label = $found_label

func _ready():
	animation_player.play("glow")
	

func _on_body_entered(body):
	if body.name == "Player":
		show_found_effect()
		await get_tree().create_timer(2.0).timeout
		queue_free()

func show_found_effect():
	print("Label:", found_label)
	print("Sound:", sparkle_sound)
	print("Animation:", animation_player)
	found_label.visible = true
	sparkle_sound.play()
	animation_player.play("found_text")
