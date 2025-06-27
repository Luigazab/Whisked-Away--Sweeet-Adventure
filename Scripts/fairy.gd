extends Area2D

@onready var floaty = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	floaty.play("floating")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
