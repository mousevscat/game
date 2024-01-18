extends Node2D
@onready var moon = $moon
@onready var duckSound = $AudioStreamPlayer
@onready var saveButton = $save_button
@onready var player = $player

func _ready():
	moon.visible = false

func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		moon.visible = true


func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		moon.visible = false


func _on_duck_body_entered(body):
	if body.has_method("player"):
		duckSound.play()


func _on_save_button_pressed():
	SaveAndLoad.saveGame("res://room.tres")


func _on_load_button_pressed():
	SaveAndLoad.loadGame("res://room.tres")


func _on_bed_body_entered(body):
	saveButton.visible = true


func _on_bed_body_exited(body):
	saveButton.visible = false
