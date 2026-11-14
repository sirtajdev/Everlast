
extends Node2D

@onready var status_label = $StatusLabel

func _on_save_button_pressed():
	SaveMgr.save_game()
	status_label.text = "Game Saved!"

func _on_load_button_pressed():
	var data = SaveMgr.load_game()

	if data != null:
		status_label.text = "Game Loaded!"
	else:
		status_label.text = "No Save File Found!"

func _on_new_game_button_pressed():
	SaveMgr.new_game()
	status_label.text = "New Game Started!"
