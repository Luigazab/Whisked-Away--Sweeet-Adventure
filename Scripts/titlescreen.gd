extends CanvasLayer
@onready var bgm = $Title_bgm

func _ready():
	bgm.play()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/intro_scene.tscn")

func _on_quit_pressed():
	get_tree().quit()
