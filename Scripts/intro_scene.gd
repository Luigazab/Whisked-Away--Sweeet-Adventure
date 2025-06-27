extends Control

@onready var label = $IntroText
@onready var timer = $TextTimer
@onready var flash = $FlashOverlay
@onready var bgm = $Intro_bgm

var lines = [
	"Late into a quiet, weary night, Elise sat alone in her apartment...",
	"The hum of her office laptop mixing with distant city noise.",
	"Her eyes wandered to a dusty old book — her grandmother’s recipe book.",
	"Only the first page remained:\n\"Memory Tart\"\nAnd a note: “For the one who still believes in flavor.”",
	"The rest were blank — like her forgotten dream of becoming a pâtissier.",
	"Craving something sweeter than routine, she opened it one last time…",
	"And as sleep took her, the room began to fade away."
]
var current_index = 0

func _ready():
	bgm.play()
	label.text = lines[current_index]
	
func _start_flash():
	var tween := create_tween()
	tween.tween_property(flash, "modulate:a", 1.0, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	await get_tree().create_timer(0.5).timeout
	var fade_out := create_tween()
	fade_out.tween_property(flash, "modulate:a", 0.0, 0.3)
	get_tree().change_scene_to_file("res://Scenes/StartArea.tscn")
	await fade_out.finished
	

func _on_text_timer_timeout():
	current_index += 1
	if current_index < lines.size():
		label.text = lines[current_index]
	else:
		timer.stop()
		_start_flash()
